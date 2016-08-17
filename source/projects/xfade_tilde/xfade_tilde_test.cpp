// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License


// 0. Include the test framework we use, which is Catch from
//    https://github.com/philsquared/Catch

#define CATCH_CONFIG_MAIN
#include "catch.hpp"


// 1. Include the source of our object so that we can access it

#include "xfade_tilde.cpp"


// 2. Now write a Catch unit test as described at
//    https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

SCENARIO( "object produces correct output" ) {
	
	GIVEN( "An instance of xfade~" ) {
		xfade	my_object;
		
		// check that default attr values are correct
		
		REQUIRE( my_object.shape == symbol("equal_power") );	// note: symbols can be compared with strings
		REQUIRE( my_object.mode == symbol("fast") );
		REQUIRE( my_object.position == Approx(0.5) );	// note: floating-point values may be subject to rounding errors
		
		// now proceed to testing various sequences of events
		
		WHEN( "the defaults are used" ) {
			THEN( "the output is equal-power" ) {
				
				// args are the audio inputs: source-1, source-2, and position (optional)
				
				auto result = my_object(0.0, 1.0);
				
				// the default mode is 'fast', which means a 512-point lookup table is used
				// thus we have 9-bits of resolution and the quantization error for that is -56 dB
				// which calculates out to approx 0.00195 -- so we use that as epsilon
				// to determine the amount of acceptable deviation in our check below
				
				REQUIRE( result == Approx ( std::sqrt(2.0)/2.0 ).epsilon(0.00195) );
			}
			AND_THEN( "verify the output is equal-power by swapping the inputs" ) {
				
				// this will make sure that both input signals are being scaled appropriately
				
				auto result = my_object(1.0, 0.0);
				
				REQUIRE( result == Approx ( std::sqrt(2.0)/2.0 ).epsilon(0.00195) );
			}
		}
		
		AND_WHEN( "The mode is set to 'precision'" ) {
			THEN ("the results are more accurate") {
				
				// set attributes, including symbol attributes, by simply assigning them
				
				my_object.mode = "precision";
				
				auto result1 = my_object(0.0, 1.0);
				auto result2 = my_object(1.0, 0.0);
			
				// and now we don't need to define a custom epsilon because there is no quantization error
				
				REQUIRE( result1 == Approx ( std::sqrt(2.0)/2.0 ) );
				REQUIRE( result2 == Approx ( std::sqrt(2.0)/2.0 ) );
			}
			AND_THEN( "due to quantization of the lookup table 'precision' won't be the same as 'fast'" ) {
				
				// this is a way we can check that the object is actually doing something different
				// internally when we change the attribute value
				
				my_object.mode = "precision";
				auto result_precision = my_object(1.0, 0.0);

				my_object.mode = "fast";
				auto result_fast = my_object(1.0, 0.0);

				REQUIRE( result_precision != Approx( result_fast ) );
			}
		}
		
		AND_WHEN ("The shape is set to 'linear'") {
			THEN ("we produce a roughly -6db downpoint in the middle of the fade for both 'fast' and 'precision' modes") {
				
				xfade a_new_xfade_object;	// make a fresh object so we don't rely on some messy state from above
				
				a_new_xfade_object.shape = "linear";
				a_new_xfade_object.mode = "precision";
				a_new_xfade_object.position = 0.5;
				
				auto result1 = a_new_xfade_object(0.0, 1.0);
				auto result2 = a_new_xfade_object(1.0, 0.0);

				REQUIRE( result1 == Approx ( 0.5 ) );
				REQUIRE( result2 == Approx ( 0.5 ) );
				
				
				a_new_xfade_object.mode = "fast";

				auto result3 = a_new_xfade_object(0.0, 1.0);
				auto result4 = a_new_xfade_object(1.0, 0.0);

				REQUIRE( result3 == Approx ( 0.5 ).epsilon(0.00195) );
				REQUIRE( result4 == Approx ( 0.5 ).epsilon(0.00195) );
			}
		}
		
		AND_WHEN ("The position is changed by attribute") {
			xfade x;
			
			x.mode = "precision";
			x.shape = "linear";
			x.position = 0.25;
			
			auto y0 = x(0.0, 1.0);
			auto y1 = x(1.0, 0.0);

			REQUIRE( y0 == Approx(0.25) );
			REQUIRE( y1 == Approx(0.75) );
		}
		AND_WHEN ("The position is changed by number message") {
			xfade x;
			
			x.mode = "precision";
			x.shape = "linear";
			x.number(0.33);
			
			auto y0 = x(0.0, 1.0);
			auto y1 = x(1.0, 0.0);
			
			REQUIRE( y0 == Approx(0.33) );
			REQUIRE( y1 == Approx(0.67) );
		}
	}
}
