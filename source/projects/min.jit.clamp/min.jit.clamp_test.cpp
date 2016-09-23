// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License


// 0. Include the test framework we use, which is Catch from
//    https://github.com/philsquared/Catch

#define CATCH_CONFIG_MAIN
#include "catch.hpp"


// 1. Include the source of our object so that we can access it

#include "min.jit.clamp.cpp"


// 2. Now write a Catch unit test as described at
//    https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

SCENARIO( "object produces correct output" ) {
	
	GIVEN( "An instance of xfade~" ) {
		jit_clamp	my_object;
		
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
