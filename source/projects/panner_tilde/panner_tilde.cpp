/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;
using namespace std;

// TODO: all of this can be shared with the xfade~ object...

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


class panner : public object<panner>, public sample_operator<2,2> {
public:
	
	inlet	in1		{ this, "(signal) Input 1" };
	inlet	in_pos	{ this, "(signal) Position between them (0..1)" };
	outlet	out1	{ this, "(signal) Left Output", "signal" };
	outlet	out2	{ this, "(signal) Right Output", "signal" };
	
	
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
		range {"fast", "precision"}
	};
	
	
	attribute<double> position {
		this,
		"position",
		0.5,
		setter { MIN_FUNCTION {
			auto n = c74::max::clamp<double>(args[0], 0.0, 1.0);
			std::tie(weight1, weight2) = calculate_weights(mode, n);
			return {n};
		}},
		title {"Normalized Position"},
		range { 0.0, 1.0}
	};

	
	method number {this, "number", MIN_FUNCTION {
		position = args;
		return {};
	}};
	

	/// Process one sample
	
	samples<2> operator()(sample input, sample position = 0.5) {
		auto weight1 = this->weight1;
		auto weight2 = this->weight2;
		
		if (in_pos.has_signal_connection())
			std::tie(weight1, weight2) = calculate_weights(mode, position);
		
		return {{ input * weight1, input * weight2 }};
	}

	
private:
	
	auto calculate_weights(symbol mode, double position)
	-> std::pair<double,double> {

		if (position < 0.0 || position > 1.0)	// if position is out of range then we must not have initialized position yet
			return std::make_pair(0.0, 0.0);	// so we bail...

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


MIN_EXTERNAL(panner);
