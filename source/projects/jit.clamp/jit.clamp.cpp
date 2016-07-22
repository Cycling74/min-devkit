/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


class jit_clamp : public object<jit_clamp>, matrix_operator {
public:
	
	inlet	input	{ this, "(matrix) Input", "matrix" };
	outlet	output	{ this, "(matrix) Output", "matrix" };
	

	attribute<double> min { this, "min", 0.0,
		setter { MIN_FUNCTION {
			cmin = c74::max::clamp((double)args[0] * 255.0, 0.0, 255.0);
			return args;
		}}
	};
	
	
	attribute<double> max { this, "max", 1.0,
		setter { MIN_FUNCTION {
			cmax = c74::max::clamp((double)args[0] * 255.0, 0.0, 255.0);
			return args;
		}}
	};


	// This object process each cell independently
	// So we define "calc_cell" instead of "calc_matrix"
	
	template<typename matrix_type>
	matrix_type calc_cell(matrix_type input, const matrix_info& info, matrix_coord& position) {
		matrix_type output;
		
		for (auto plane=0; plane<info.planecount(); ++plane)
			output[plane] = MIN_CLAMP(input[plane], min, max);
		
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
