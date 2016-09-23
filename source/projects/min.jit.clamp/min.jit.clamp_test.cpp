// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License

#include "c74_min_unittest.h"	// required unit test header
#include "min.jit.clamp.cpp"	// need the source of our object so that we can access it

// Unit tests are written using the Catch framework as described at
// https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

SCENARIO( "object produces correct output" ) {
	ext_main(nullptr);	// every unit test must call ext_main() once to configure the class
	
	GIVEN( "An instance of xfade~" ) {

//		test_wrapper<jit_clamp> an_instance;
//		jit_clamp& my_object = an_instance;
		jit_clamp my_object;

		// check that default attr values are correct
		atoms min = my_object.min;
		REQUIRE( double(min[0]) == Approx(0.0) );

		atoms max = my_object.max;
		REQUIRE( double(max[0]) == Approx(1.0) );

		// check that the custom attr getters are called correctly
		// we do this by setting the value and then getting it to see that it is correctly quantized

		{
			my_object.min = 0.823961;

			atoms	result = my_object.min;
			double	fresult = result[0];

			REQUIRE( fresult != Approx(0.823961) );
			REQUIRE( fresult == Approx(0.823529) );
		}


		{
			my_object.max = 0.823961;

			atoms	result = my_object.max;
			double	fresult = result[0];

			REQUIRE( fresult != Approx(0.823961) );
			REQUIRE( fresult == Approx(0.823529) );
		}

	}
}
