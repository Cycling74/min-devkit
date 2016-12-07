/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class jit_clamp : public object<jit_clamp>, public matrix_operator {
public:
	
	MIN_DESCRIPTION { "Limit matrix values to a range. The range is specified the object's min and max attributes." };
	MIN_TAGS		{ "math" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "jit.clip" };

	inlet<>		input	{ this, "(matrix) Input", "matrix" };
	outlet<>	output	{ this, "(matrix) Output", "matrix" };
	

	attribute<number> min { this, "min", 0.0,
		description { "The minimum value below which clipping occurs." },
		setter { MIN_FUNCTION {
			double in = args[0];
			cmin = static_cast<uchar>(c74::max::clamp(255.0 * in, 0.0, 255.0));
			return args;
		}},
		getter { MIN_GETTER_FUNCTION {
			return { cmin / 255.0 };
		}}
	};
	
	
	attribute<number> max { this, "max", 1.0,
		description { "The maximum value above which clipping occurs." },
		setter { MIN_FUNCTION {
			double in = args[0];
			cmax = static_cast<uchar>(c74::max::clamp(255.0 * in, 0.0, 255.0));
			return args;
		}},
		getter { MIN_GETTER_FUNCTION {
			return { cmax / 255.0 };
		}}
	};


	// This object process each cell independently
	// So we define "calc_cell" instead of "calc_matrix"
	
	template<typename matrix_type>
	matrix_type calc_cell(matrix_type input, const matrix_info& info, matrix_coord& position) {
		matrix_type	output;
		double fmin = min;
		double fmax = max;
		
		for (auto plane=0; plane<info.planecount(); ++plane) {
			auto dummy = input[plane];
			output[plane] = c74::max::clamp<decltype(dummy)>(input[plane], fmin, fmax);
		}
		return output;
	}

	
	// We override the case for the char type to use the cached attribute values in the 0-255 range
		
	pixel calc_cell(pixel input, const matrix_info& info, matrix_coord& position) {
		pixel output;
		
		output[alpha]	= c74::max::clamp(input[alpha], cmin, cmax);
		output[red]		= c74::max::clamp(input[red], cmin, cmax);
		output[green]	= c74::max::clamp(input[green], cmin, cmax);
		output[blue]	= c74::max::clamp(input[blue], cmin, cmax);
		
		return output;
	}

private:
	uchar	cmin;
	uchar	cmax;
};

MIN_EXTERNAL(jit_clamp);
