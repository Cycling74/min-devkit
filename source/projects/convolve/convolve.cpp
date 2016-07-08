/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;
using namespace std;


class convolve : public object<convolve> {
public:

	inlet	input	= { this, "(list) values to convolve" };
	outlet	output	= { this, "(list) result of convolution" };

	
	convolve(const atoms& args = {}) {}

	
	method list = { this, "list", MIN_FUNCTION {
		const vector<double>&	kernel = this->kernel;
		atoms					result(args.size() + kernel.size()-1);
#ifdef OLD
		for (auto i=0; i<result.size(); ++i) {
			size_t	end = args.size()-1;
			double	y = 0.0;
			
			for (auto k=0; k<kernel.size(); ++k) {
				auto	index = i+k;
				double	x;
				
				if (index > end) x = 0.0;
				else x = (double)args[index];
				
				y += kernel[k] * x;
			}
			result[i] = y;
		}
#endif // OLD
		
		
		for (auto i=0; i<args.size(); ++i) {
			double y = 0.0;

			for (auto k=0; k<kernel.size(); ++k ) {
				double x;
				
				x = args[i-k];
				y += x * kernel[k];    // convolve: multiply and accumulate
			}
			result[i] = y;
		}
		
		output.send(result);
		return {};
	}};
	

	attribute<vector<double>> kernel = { this, "kernel", {1.0, 0.0} };
};


MIN_EXTERNAL(convolve);
