/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


namespace shapes {
	static const symbol linear = "linear";
	static const symbol equal_power = "equal_power";
	static const symbol square_root = "square_root";
}


using lookup_table = std::vector<double>;

class lookup_tables {
public:
	static constexpr auto size = 512;
	
	lookup_tables() {
		linear.resize(size);
		equal_power.resize(size);
		sqrt.resize(size);
		
		for (auto i=0; i<size; ++i) {
			double normalized_index = double(i) / (size-1);
			
			linear[i]		= normalized_index;
			equal_power[i]	= std::sin(normalized_index * M_PI_2);
			sqrt[i]			= std::sqrt(normalized_index);
		}
	}
	
	auto get(const symbol& name) {
		if (name == shapes::equal_power)
			return &equal_power;
		else if (name == shapes::square_root)
			return &sqrt;
		else
			return &linear;
	}
	
private:
	lookup_table	linear;
	lookup_table	equal_power;
	lookup_table	sqrt;
};

static lookup_tables tables;


template<class derived_min_class_type>
class signal_routing_base : public object<derived_min_class_type> {
public:
	
	// attributes are initialized in the order in which they are defined
	// in this case it is very important that shape be defined first so that the `table` member will be initialized
	// prior to accessing the table in the following attribute definitions
	//
	// additionally, it is important to think through what this initialization means for members besides other attributes.
	// for example, this attribute initialization will set the private `table` pointer which is declared at the end of this class.
	// if that member were to be initialized at that point ( e.g. `lookup_table*	table = nullptr;` ) then that will override
	// the work we do here because that comes later in the file.
	
	attribute<symbol> shape {
		this,
		"shape",
		shapes::equal_power,
		setter { MIN_FUNCTION {
			table = tables.get(args[0]);
			std::tie(weight1, weight2) = calculate_weights(mode, position);
			return args;
		}},
		title {"Shape of Crossfade Function"},
		description {"Shape of function. Transition across the position using one of several shapes: 'linear', 'equal_power', or 'square_root'."},
		range {shapes::linear, shapes::equal_power, shapes::square_root}
	};
	
	
	attribute<symbol> mode {
		this,
		"mode",
		"fast",
		setter { MIN_FUNCTION {
			std::tie(weight1, weight2) = calculate_weights(args[0], position);
			return args;
		}},
		title {"Calculation Modality"},
		description {"Calculation Modality. Choose whether to perform calculations on-the-fly for greater accuracy or use a lookup table for greater speed."},
		range {"fast", "precision"}
	};
	
	
	attribute<number> position {
		this,
		"position",
		0.5,
		setter { MIN_FUNCTION {
			auto n = MIN_CLAMP(double(args[0]), 0.0, 1.0);
			std::tie(weight1, weight2) = calculate_weights(mode, n);
			return {n};
		}},
		title {"Normalized Position"},
		description {"Normalized position. This is the position within the function defined by the 'shape' attribute."},
		range { 0.0, 1.0}
	};
	
	
	message number {this, "number", "Set the normalized position in the function.",
		MIN_FUNCTION {
			position = args;
			return {};
		}
	};
	
protected:
	
	auto calculate_weights(symbol mode, double position)
	-> std::pair<double,double> {
		
		if (position < 0.0 || position > 1.0)	// if position is out of range then we must not have initialized position yet
			return std::make_pair(0.0, 0.0);	// so we bail...
		
		double weight1;
		double weight2;
		
		if (mode == "fast") {
			auto index1 = size_t((1.0 - position) * (lookup_tables::size-1));
			auto index2 = size_t(position * (lookup_tables::size-1));
			
			weight1 = (*table)[index1];
			weight2 = (*table)[index2];
		}
		else {
			symbol	shape = this->shape;
			
			if (shape == shapes::equal_power) {
				auto rad_position = position * M_PI_2;
				weight1 = cos(rad_position);
				weight2 = sin(rad_position);
			}
			else if (shape == shapes::square_root) {
				weight1 = sqrt(1.0 - position);
				weight2 = sqrt(position);
			}
			else { // linear
				weight1 = 1.0 - position;
				weight2 = position;
			}
		}
		return std::make_pair(weight1, weight2);
	}
	
	lookup_table*	table;
	double			weight1;
	double			weight2;
};

