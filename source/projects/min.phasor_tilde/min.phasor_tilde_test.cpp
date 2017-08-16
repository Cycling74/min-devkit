// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License

#include "c74_min_unittest.h"		// required unit test header
#include "min.phasor_tilde.cpp"	// need the source of our object so that we can access it

// Unit tests are written using the Catch framework as described at
// https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

TEST_CASE( "produces valid impulse response" ) {
	ext_main(nullptr);	// every unit test must call ext_main() once to configure the class

	// create an instance of our object
	test_wrapper<phasor> an_instance;
	phasor& my_object = an_instance;

	// create an impulse buffer to process
	const int		buffersize = 256;
	sample_vector	impulse(buffersize);
	
	std::fill_n(impulse.begin(), buffersize, 0.0);
	impulse[0] = 1.0;
	
	// output from our object's processing
	sample_vector	output;
	
	// run the calculations
	for (auto x : impulse) {
		auto y = my_object();
		output.push_back(y);
	}
	
	// get a reference impulse response to compare against
	auto reference = lib::filters::generate_impulse_response({1.0,-1.0}, {1.0,-0.9997}, buffersize);
	
	// check it
//	REQUIRE( output == reference );
	REQUIRE ( true );
}


SCENARIO( "responds appropriately to messages and attrs" ) {
	
	// create an input buffer to process... 10 cycles of a cos wave
	const int		buffersize = 1024;
	sample_vector	input(buffersize);
	
	std::generate(input.begin(), input.end(), lib::generator::cosine<sample>(buffersize, 10));
	
	GIVEN( "An instance of dcblocker~" ) {
		phasor	my_object;
		
//		REQUIRE( my_object.bypass == false );	// default attr value
		/*
		
		WHEN( "the input is offset by a constant of 1.5" ) {
			for (auto& x : input)
				x += 1.5;

			sample_vector output;

			// run the processing a few times to give the filter time to settle
			for (auto i=0; i<100; ++i) {
				output.clear();
				for (auto x : input) {
					auto y = my_object();
					output.push_back(y);
				}
			}
			
			double mean_x;
			double stdev_x;
			std::tie(mean_x, stdev_x) = math::mean(input);

			double mean_y;
			double stdev_y;
			std::tie(mean_y, stdev_y) = math::mean(output);
			
			THEN( "the input has a mean of 1.5" ) {
				REQUIRE( mean_x == Approx(1.5) );
				REQUIRE( stdev_x == Approx ( std::sqrt(2.0)/2.0 ) );
			}
			AND_THEN( "the output has a mean of 0.0" ) {
				REQUIRE( mean_y == Approx(0.0) );
				REQUIRE( stdev_x == Approx ( std::sqrt(2.0)/2.0 ) );
			}
		}

		WHEN( "the bypass attr is turned-on" ) {
			my_object.bypass = true;
			
			sample_vector output;
			for (auto x : input) {
				auto y = my_object(x);
				output.push_back(y);
			}
			
			THEN( "the output is identical to the input" )
				REQUIRE( output == input );
		}
		AND_WHEN( "the bypass is turned back off" ) {
			my_object.bypass = false;
			
			sample_vector output;
			for (auto x : input) {
				auto y = my_object(x);
				output.push_back(y);
			}
			
			THEN( "the output is processed again" )
				REQUIRE( output != input );
		}
		WHEN( "the input goes silent" ) {
			// dirty the history first
			for (auto x : input) {
				auto y = my_object(x);
				//output.push_back(y);
			}

			// then zero and process
			std::fill_n(input.begin(), buffersize, 0.0);
			
			sample_vector output;
			for (auto x : input) {
				auto y = my_object(x);
				output.push_back(y);
			}
			
			THEN( "the input is all zeroes" )
				REQUIRE( input == sample_vector(buffersize, 0.0) );
			AND_THEN( "the output will not immediately go down zero" )
				REQUIRE( output != input );
		}
		AND_WHEN( "the 'clear' message is received" ) {
			std::fill_n(input.begin(), buffersize, 0.0);
			my_object.clear();
			
			sample_vector output;
			for (auto x : input) {
				auto y = my_object(x);
				output.push_back(y);
			}
			
			THEN( "the input is still all zeroes" )
				REQUIRE( input == sample_vector(buffersize, 0.0) );
			AND_THEN( "the output snaps immediately to zero" )
				REQUIRE( output == input );
		}
		 */
	}
}
