/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


class jit_stencil : public matrix_object {
public:
	
	inlet	input	= { this, "(matrix) Input", "matrix" };
	outlet	output	= { this, "(matrix) Output", "matrix" };
	
	
	jit_stencil(atoms args) {}
	~jit_stencil() {}

	
	// TODO: mode attr for how to handle the edges
	

	ATTRIBUTE (x, long, 0) {
		double value = args[0];
		
		if (value < 0)
			value = 0;
		
		args[0] = value;
	}
	END
	
	
	ATTRIBUTE (y, long, 0) {
		double value = args[0];
		
		if (value < 0)
			value = 0;
		
		args[0] = value;
	}
	END

	
	template<typename T>
	T calc_cell(T input, const matrix_info& info, matrix_coord& position) {
		T output;

		auto x1 = MIN_CLAMP( position.x() + 0, 0, info.width());
		auto y1 = MIN_CLAMP( position.y() - y, 0, info.height());
		auto p1 = info.in_pixel(x1, y1);
		auto x2 = MIN_CLAMP( position.x() + x, 0, info.width());
		auto y2 = MIN_CLAMP( position.y() + 0, 0, info.height());
		auto p2 = info.in_pixel(x2, y2);
		auto x3 = MIN_CLAMP( position.x() + 0, 0, info.width());
		auto y3 = MIN_CLAMP( position.y() + y, 0, info.height());
		auto p3 = info.in_pixel(x3, y3);
		auto x4 = MIN_CLAMP( position.x() - x, 0, info.width());
		auto y4 = MIN_CLAMP( position.y() + 0, 0, info.height());
		auto p4 = info.in_pixel(x4, y4);

		for (auto plane=0; plane<info.planecount(); ++plane)
			output[plane] = (input[plane] + p1[plane] + p2[plane] + p3[plane] + p4[plane]) / 5.0;
		
		return output;
	}

};


MIN_EXTERNAL(jit_stencil, "jit.stencil");
