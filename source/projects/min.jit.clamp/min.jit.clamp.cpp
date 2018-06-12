/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class jit_clamp : public object<jit_clamp>, public matrix_operator<> {
public:
	MIN_DESCRIPTION {"Limit matrix values to a range. The range is specified the object's min and max attributes."};
	MIN_TAGS {"math"};
	MIN_AUTHOR {"Cycling '74"};
	MIN_RELATED {"jit.clip"};

	inlet<>  input {this, "(matrix) Input", "matrix"};
	outlet<> output {this, "(matrix) Output", "matrix"};


	attribute<number> min {this, "min", 0.0, description {"The minimum value below which clipping occurs."},
		setter { MIN_FUNCTION {
			double in = args[0];
			cmin      = static_cast<uchar>(clamp(255.0 * in, 0.0, 255.0));
			return args;
		}},
		getter { MIN_GETTER_FUNCTION { return {cmin / 255.0}; }}};


	attribute<number> max {this, "max", 1.0, description {"The maximum value above which clipping occurs."},
		setter { MIN_FUNCTION {
			double in = args[0];
			cmax      = static_cast<uchar>(clamp(255.0 * in, 0.0, 255.0));
			return args;
		}},
		getter { MIN_GETTER_FUNCTION { return {cmax / 255.0}; }}};


	// This object process each cell independently
	// So we define "calc_cell" instead of "calc_matrix"

	template<typename matrix_type>
	matrix_type calc_cell(matrix_type input, const matrix_info& info, matrix_coord& position) {
		matrix_type output;
		double      fmin = min;
		double      fmax = max;

		for (auto plane = 0; plane < info.plane_count(); ++plane) {
			auto dummy    = input[plane];
			output[plane] = clamp<decltype(dummy)>(input[plane], static_cast<decltype(dummy)>(fmin), static_cast<decltype(dummy)>(fmax));
		}
		return output;
	}


	// We override the case for the char type to use the cached attribute values in the 0-255 range

	pixel calc_cell(pixel input, const matrix_info& info, matrix_coord& position) {
		pixel output;

		output[alpha] = clamp(input[alpha], cmin, cmax);
		output[red]   = clamp(input[red], cmin, cmax);
		output[green] = clamp(input[green], cmin, cmax);
		output[blue]  = clamp(input[blue], cmin, cmax);

		return output;
	}

private:
	uchar cmin;
	uchar cmax;
};

MIN_EXTERNAL(jit_clamp);
