/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

// Note that the above include is "c74_min_api.h" and *not* "c74_min.h"
// Only one cpp file can include (directly or indirectly) "c74_min.h"
// because "c74_min.h" includes the implementation of Min.
//
// Any other cpp files may include (directly or indirectly) just the API
// and not the implementation using "c74_min_api.h"

#include "c74_min_api.h"

// Here we are using the "c74::min" namespace in a header file.
// This is not a generally advisable practice in C++ but in limited cases such as this it makes sense.
// This header file will only be included in Min projects and the code below would be
// very onerous if nearly every symbol we used required a fully-qualified name.

using namespace c74::min;

// The "shapes" or functions we use for doing crossfades or pans could be selected using
// an enum or, as in this case, using a symbol itself.
// We create a special namespace for our symbol options and then cache copies of the symbols
// with a C++ identifier so that we can use them throughout our code somewhat
// like we would use enum constants.

namespace shapes {
	static const symbol linear      = "linear";
	static const symbol equal_power = "equal_power";
	static const symbol square_root = "square_root";
}    // namespace shapes


#ifdef MAC_VERSION
#pragma mark -
#pragma mark Lookup Table Class
#endif


/// A lookup table in which we cache pre-calculated values for a function/shape.

using lookup_table = std::vector<double>;


/// Container for all available look-up tables of various shapes.

class lookup_tables {
public:
	/// The count of values the contained lookup table(s)
	static constexpr auto size = 512;

	/// Default constructor
	/// initializes all lookup tables with thier functions.
	lookup_tables();

	/// Get a pointer to a lookup table by name
	/// @param	name	The name of the shape/function for which to fetch a lookup_table.
	///	@return			The pointer to the associated lookup table.
	lookup_table* get(const symbol& name);

private:
	lookup_table linear;
	lookup_table equal_power;
	lookup_table sqrt;
};


/// All instances of this extern (panner~ or xfade~) can share a single copy of the lookup_tables.
//  Thus we create a global instance of it in our cpp file.

extern lookup_tables g_tables;


#ifdef MAC_VERSION
#pragma mark -
#pragma mark Signal Routing Base Class
#endif


/// The signal_routing_base provides the basic facilities for mixing or distributing
/// audio samples using a function (e.g. equal-power or linear) and potentially a lookup table for performance.
/// Inheriting from this base class will provide your object with attributes for
/// 'mode', 'shape', and 'position' as well as the 'number' message.

template<class derived_min_class_type>
class signal_routing_base : public object<derived_min_class_type> {
private:
	bool attributes_initialized = false;    // must be initialized first, thus coming first in the class order (see below).

public:
	// attributes are initialized in the order in which they are defined
	// in this case it is very important that shape be defined first so that the `table` member will be initialized
	// prior to accessing the table in the following attribute definitions
	//
	// additionally, it is important to think through what this initialization means for members besides other
	// attributes. for example, this attribute initialization will set the private `table` pointer which is declared at
	// the end of this class. if that member were to be initialized at that point ( e.g. `lookup_table*	table =
	// nullptr;` ) then that will override the work we do here because that comes later in the file.

	attribute<symbol> shape {this, "shape", shapes::equal_power,
		setter { MIN_FUNCTION {
			table = g_tables.get(args[0]);
			if (attributes_initialized)
				std::tie(weight1, weight2) = calculate_weights(mode, position);
			return args;
		}},
		title {"Shape of Crossfade Function"},
		description {"Shape of function. Transition across the position using one of several shapes: 'linear', "
					"'equal_power', or 'square_root'."},
		range {shapes::linear, shapes::equal_power, shapes::square_root}};


	attribute<symbol> mode {this, "mode", "fast", setter { MIN_FUNCTION {
							   if (attributes_initialized)
								   std::tie(weight1, weight2) = calculate_weights(args[0], position);
							   return args;
						   }},
		title {"Calculation Modality"},
		description {"Calculation Modality. Choose whether to perform calculations on-the-fly for greater accuracy or "
					"use a lookup table for greater speed."},
		range {"fast", "precision"}};


	attribute<number> position {this, "position", 0.5,
		setter { MIN_FUNCTION {
			auto n = MIN_CLAMP(double(args[0]), 0.0, 1.0);
			// don't need to check that our class is initialized because the two dependencies this calls has
			// come first in the initialization order (unlike the two attributes above)
			std::tie(weight1, weight2) = calculate_weights(mode, n);
			attributes_initialized     = true;    // this is the last attribute to be allocated and initialized
			return {n};
		}},
		title {"Normalized Position"},
		description {"Normalized position. This is the position within the function defined by the 'shape' attribute."}, range {0.0, 1.0}};


	message<threadsafe::yes> number {this, "number", "Set the normalized position in the function.",
		MIN_FUNCTION {
			position = args;
			return {};
		}};

protected:
	lookup_table* table;
	double        weight1;
	double        weight2;

	std::pair<double, double> calculate_weights(symbol mode, double position) {
		if (position < 0.0 || position > 1.0)    // if position is out of range then we must not have initialized position yet
			return std::make_pair(0.0, 0.0);     // so we bail...

		double weight1;
		double weight2;

		if (mode == "fast") {
			auto index1 = size_t((1.0 - position) * (lookup_tables::size - 1));
			auto index2 = size_t(position * (lookup_tables::size - 1));

			weight1 = (*table)[index1];
			weight2 = (*table)[index2];
		}
		else {
			symbol shape = this->shape;

			if (shape == shapes::equal_power) {
				auto rad_position = position * M_PI_2;
				weight1           = cos(rad_position);
				weight2           = sin(rad_position);
			}
			else if (shape == shapes::square_root) {
				weight1 = sqrt(1.0 - position);
				weight2 = sqrt(position);
			}
			else {    // linear
				weight1 = 1.0 - position;
				weight2 = position;
			}
		}
		return std::make_pair(weight1, weight2);
	}
};
