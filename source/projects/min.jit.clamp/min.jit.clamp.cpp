/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class jit_clamp : public object<jit_clamp>, matrix_operator {
public:
	
	MIN_DESCRIPTION { "Limit matrix values to a range. The range is specified the object's min and max attributes." };
	MIN_TAGS		{ "math" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "jit.clip" };

	inlet	input	{ this, "(matrix) Input", "matrix" };
	outlet	output	{ this, "(matrix) Output", "matrix" };
	

	attribute<number> min { this, "min", 0.0,
		description { "The minimum value below which clipping occurs." },
		setter { MIN_FUNCTION {
			cmin = (uchar)MIN_CLAMP((double)args[0] * 255.0, 0.0, 255.0);
			return args;
		}},
		getter { MIN_GETTER_FUNCTION {
			return { cmin / 255.0 };
		}}
	};
	
	
	attribute<number> max { this, "max", 1.0,
		description { "The maximum value above which clipping occurs." },
		setter { MIN_FUNCTION {
			cmax = (uchar)MIN_CLAMP((double)args[0] * 255.0, 0.0, 255.0);
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
		double		fmin = min;
		double		fmax = max;
		
		for (auto plane=0; plane<info.planecount(); ++plane)
			output[plane] = MIN_CLAMP(input[plane], fmin, fmax);
		
		return output;
	}

	
	// We override the case for the char type to use the cached attribute values in the 0-255 range
		
	pixel calc_cell(pixel input, const matrix_info& info, matrix_coord& position) {
		pixel output;
		
		output[alpha]	= MIN_CLAMP(input[alpha], cmin, cmax);
		output[red]		= MIN_CLAMP(input[red], cmin, cmax);
		output[green]	= MIN_CLAMP(input[green], cmin, cmax);
		output[blue]	= MIN_CLAMP(input[blue], cmin, cmax);
		
		return output;
	}

private:
	uchar	cmin;
	uchar	cmax;
};

MIN_EXTERNAL(jit_clamp);
