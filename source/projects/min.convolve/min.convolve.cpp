/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;
using std::vector;

class convolve : public object<convolve> {
public:

	MIN_DESCRIPTION { "Perform convolution on a list. For more details on convolution see https://en.wikipedia.org/wiki/Convolution." };
	MIN_TAGS		{ "math, lists, operators" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "buffir~, jit.convolve" };

	inlet<>			input	{ this, "(list) values to convolve" };
	outlet<>		output	{ this, "(list) result of convolution" };


	using fvec = vector<double>;
	attribute<fvec>	kernel	{ this, "kernel", {1.0, 0.0},
		description { "The convolution kernel." }
	};


	message<> list { this, "list",
		"Input to the convolution function.",
		MIN_FUNCTION {
			// here we make a local *copy* of the kernel for thread-safety
			// it looks great because we do one operation and then require locks on the shared data
			// but this is *wrong*
			// std::vector is not trivially copyable...
			// this copy assignment involved multiple operation internally, both memory allocation and copying
			// thus the following is not thread-safe!
			// as such, we have not marked this message as being thread-safe, and thus it will always execute in the main thread.
			//
			// const vector<double>	kernel = this->kernel;

			const fvec&	kernel = this->kernel;
			atoms		result(args.size());
			
			for (auto i=0; i<args.size(); ++i) {
				double y = 0.0;

				for (auto k=0; k<kernel.size(); ++k ) {
					auto	index = i-k;
					double	x;
					
					if (index < 0)
						x = 0.0;
					else
						x = args[index];
					
					y += x * kernel[k];    // convolve: multiply and accumulate
				}
				result[i] = y;
			}
			
			output.send(result);
			return {};
		}
	};
};

MIN_EXTERNAL(convolve);
