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

namespace modes {
	static const symbol precision = "precision";
	static const symbol fast = "fast";
}

//enum modes : size_t {
//	precision = (size_t)c74::max::gensym("precision")
//};


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


class xfade : public object, sample_operator<3,1> {
public:
	
	// above we inherited from sample_operator<3,1> which means 3 inputs and 1 output for our calculate method
	// we still need to create the interface for the object though, which includes the assistance strings...
	
	inlet	in1		= { this, "(signal) Input 1" };
	inlet	in2		= { this, "(signal) Input 2" };
	inlet	in_pos	= { this, "(signal) Position between them (0..1)" };
	outlet	output	= { this, "(signal) Output", "signal" };

	
	xfade(atoms args={}) {}
	~xfade() {}
	
	
	ATTRIBUTE (shape, symbol, shapes::equal_power) {
		table = tables.get(args[0]);
		std::tie(weight1, weight2) = calculate_weights(mode, position);
	}
	END

	
	ATTRIBUTE (mode, symbol, modes::fast) {
		std::tie(weight1, weight2) = calculate_weights(args[0], position);
	}
	END

	
	ATTRIBUTE (position, double, 0.5) {
		double n = c74::max::clamp<double>(args[0], 0.0, 1.0);
		args[0] = n;
		
		std::tie(weight1, weight2) = calculate_weights(mode, n);
	}
	END

	
	METHOD (number) { position = args[0]; } END
	

	/// Process one sample
	/// Note: it takes three samples as input because we defined this class to inherit from sample_operator<3,1>
	
	sample calculate(sample in1, sample in2, sample position = 0.5) {
		auto weight1 = this->weight1;
		auto weight2 = this->weight2;
		
		if (in_pos.has_signal_connection())
			std::tie(weight1, weight2) = calculate_weights(mode, position);
		return in1*weight1 + in2*weight2;
	}

	
private:
	
	auto calculate_weights(symbol mode, double position)
	-> std::pair<double,double> {
		double weight1;
		double weight2;

		if (mode == "fast") {
			size_t index1 = (1.0 - position) * (lookup_tables::size-1);
			size_t index2 = position * (lookup_tables::size-1);
		
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


MIN_EXTERNAL(xfade);
