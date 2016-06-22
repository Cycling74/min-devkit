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

	randfloat(atoms args) {
		if (args.size() > 0)
			min = args[0];
		if (args.size() > 1)
			max = args[1];
	}


	~randfloat() {}


	METHOD (bang) {
        /// using math::random(), which is defined in c74_min_accessories.h (along with some other useful functions)
        double value = math::random(min,max);
		output.send(value);
	}
	END

    /// Attributes are given a name, a type, a default value, and function to be called when setting the value
    ATTRIBUTE (min, double, 0.0) {
		double value = args[0];
		args[0] = value;
    }
    END

    ATTRIBUTE (max, double, 1.0) {
		double value = args[0];
		args[0] = value;
    }
    END
};


MIN_EXTERNAL(randfloat);
