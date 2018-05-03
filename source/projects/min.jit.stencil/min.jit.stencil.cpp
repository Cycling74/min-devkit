/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class jit_stencil : public object<jit_stencil>, public matrix_operator<> {
public:
	MIN_DESCRIPTION {"Apply a 5-point stencil operation to a matrix. See "
					"https://en.wikipedia.org/wiki/Five-point_stencil for more information."};
	MIN_TAGS {"video, blur/sharpen"};
	MIN_AUTHOR {"Cycling '74"};
	MIN_RELATED {"jit.avg4"};

	inlet<>  input {this, "(matrix) Input", "matrix"};
	outlet<> output {this, "(matrix) Output", "matrix"};


	// TODO: mode attr for how to handle the edges


	attribute<int> x {this, "x", 0,
		description {"The horizontal distance from each incoming cell to the source cells used for averaging."},
		setter { MIN_FUNCTION {
			double value = args[0];

			if (value < 0)
				value = 0;
			return {value};
		}}};


	attribute<int> y {this, "y", 0,
		description {"The vertical distance from each incoming cell to the source cells used for averaging."},
		setter { MIN_FUNCTION {
			double value = args[0];

			if (value < 0)
				value = 0;
			return {value};
		}}};


	template<class matrix_type, size_t plane_count>
	cell<matrix_type, plane_count> calc_cell(
		cell<matrix_type, plane_count> input, const matrix_info& info, matrix_coord& position) {
		cell<matrix_type, plane_count> output;

		auto c1 = get_cell<matrix_type, plane_count>(info, position.x() + 0, position.y() - y);
		auto c2 = get_cell<matrix_type, plane_count>(info, position.x() + x, position.y() + 0);
		auto c3 = get_cell<matrix_type, plane_count>(info, position.x() + 0, position.y() + y);
		auto c4 = get_cell<matrix_type, plane_count>(info, position.x() - x, position.y() + 0);

		for (auto plane = 0; plane < info.plane_count(); ++plane)
			output[plane]
				= static_cast<matrix_type>((input[plane] + c1[plane] + c2[plane] + c3[plane] + c4[plane]) / 5.0);

		return output;
	}

private:
	template<class matrix_type, size_t plane_count>
	cell<matrix_type, plane_count> get_cell(const matrix_info& info, int x, int y) {
		auto x1 = clamp<decltype(x)>(x, 0, info.width() - 1);
		auto y1 = clamp<decltype(y)>(y, 0, info.height() - 1);
		auto c  = info.in_cell<matrix_type, plane_count>(x1, y1);
		return c;
	}
};

MIN_EXTERNAL(jit_stencil);
