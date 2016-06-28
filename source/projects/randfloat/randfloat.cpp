/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Ben Bracken
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


class randfloat : public object<randfloat> {
public:

	inlet	input	= { this, "(bang) generate random floating point number" };
	outlet	output	= { this, "(float) random floating point number output" };

	randfloat(const atoms& args = {}) {
		if (args.size() > 0)
			min = args[0];
		if (args.size() > 1)
			max = args[1];
	}


	~randfloat() {}


	method bang = { this, "bang", MIN_FUNCTION {
        // using math::random(), which is defined in c74_min_accessories.h (along with some other useful functions)
        double value = math::random(min,max);
		output.send(value);
		return {};
	}};

    // Attributes are given a pointer to an owner (this, a name, and a default value.
	// Here the optional function argument has been omitted because there is nothing special to do.
	attribute<double> min = { this, "min", 0.0 };
	attribute<double> max = { this, "max", 1.0 };
};


MIN_EXTERNAL(randfloat);
