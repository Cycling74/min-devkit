/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


class jit_stencil : public object<jit_stencil>, matrix_operator {
public:
	
	inlet	input	= { this, "(matrix) Input", "matrix" };
	outlet	output	= { this, "(matrix) Output", "matrix" };
	
	
	jit_stencil(const atoms& args = {}) {}

	
	// TODO: mode attr for how to handle the edges
	

	attribute<long> x = { this, "x", 0, MIN_FUNCTION {
		double value = args[0];
		
		if (value < 0)
			value = 0;
		return {value};
	}};
	
	
	attribute<long> y = { this, "y", 0, MIN_FUNCTION {
		double value = args[0];
		
		if (value < 0)
			value = 0;
		return {value};
	}};

	
	template<class matrix_type, size_t planecount>
	cell<matrix_type,planecount> calc_cell(cell<matrix_type,planecount> input, const matrix_info& info, matrix_coord& position) {
		cell<matrix_type,planecount> output;

		auto c1 = get_cell<matrix_type,planecount>(info, position.x()+0, position.y()-y);
		auto c2 = get_cell<matrix_type,planecount>(info, position.x()+x, position.y()+0);
		auto c3 = get_cell<matrix_type,planecount>(info, position.x()+0, position.y()+y);
		auto c4 = get_cell<matrix_type,planecount>(info, position.x()-x, position.y()+0);
		
		for (auto plane=0; plane<info.planecount(); ++plane)
			output[plane] = (input[plane] + c1[plane] + c2[plane] + c3[plane] + c4[plane]) / 5.0;
		
		return output;
	}
	
	
private:
	template<class matrix_type, size_t planecount>
	cell<matrix_type,planecount> get_cell(const matrix_info& info, int x, int y) {
		auto x1 = MIN_CLAMP(x, 0, info.width()-1);
		auto y1 = MIN_CLAMP(y, 0, info.height()-1);
		auto c = info.in_cell<matrix_type,planecount>(x1, y1);
		return c;
	}

};


MIN_EXTERNAL(jit_stencil);
