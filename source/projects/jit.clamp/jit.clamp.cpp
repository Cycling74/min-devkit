#include "c74_min.h"

using namespace c74::min;


class jit_clamp : public matrix_object {
public:
	
	inlet	input	= { this, "(matrix) Input", "matrix" };
	outlet	output	= { this, "(matrix) Output", "matrix" };
	
	
	jit_clamp(atoms args) {}
	~jit_clamp() {}


	ATTRIBUTE (min, double, 0.0) {
		cmin = c74::max::clamp((double)args[0] * 255.0, 0.0, 255.0);
	}
	END
	
	ATTRIBUTE (max, double, 1.0) {
		cmax = c74::max::clamp((double)args[0] * 255.0, 0.0, 255.0);
	}
	END


	// This object process each cell independently
	// So we define "calc_cell" instead of "calc_matrix"
	
	template<typename T>
	T calc_cell(const T input) {
		return c74::max::clamp<T>(input, min, max);
	}
	
	// We override the case for the char type to use the cache attribute values in the 0-255 range

	uchar calc_cell(const uchar input) {
		return c74::max::clamp(input, cmin, cmax);
	}

	
private:
	uchar	cmin;
	uchar	cmax;
};


MIN_EXTERNAL(jit_clamp, "jit.clamp");
