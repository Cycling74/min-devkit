// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License

#include "c74_min_unittest.h"	// required unit test header
#include "min.beat.random.cpp"	// need the source of our object so that we can access it

// Unit tests are written using the Catch framework as described at
// https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

SCENARIO( "object produces correct output" ) {
	ext_main(nullptr);	// every unit test must call ext_main() once to configure the class

	using namespace std::chrono_literals;
	using std::cout;
	using std::endl;

//	std::cout << "Hello waiter" << std::endl;
//	auto start = std::chrono::high_resolution_clock::now();
//	std::this_thread::sleep_for(2s);
//	auto end = std::chrono::high_resolution_clock::now();
//	std::chrono::duration<double, std::milli> elapsed = end-start;
//	std::cout << "Waited " << elapsed.count() << " ms\n";

	GIVEN( "An instance of our object" ) {

		test_wrapper<beat_random> an_instance;
		beat_random& my_object = an_instance;

		// check that default attr values are correct
		
		REQUIRE( my_object.min == Approx(250.0) );		// note: floating-point values may be subject to rounding errors
		REQUIRE( my_object.max == Approx(1500.0) );
		
		// now proceed to testing various sequences of events
		WHEN( "the defaults are used" ) {
			THEN( "nothing is produced by the object after waiting 5 seconds" ) {
			
				cout << "About to wait for 5 seconds..." << endl;
				
				// 1. Wait for 5 seconds
				std::this_thread::sleep_for(5s);
				
				cout << "done!" << endl;
				// 2. See if there was any output
				auto output = c74::max::object_getoutput(my_object, 0);
				REQUIRE( output.size() == 0 );
			}
			AND_THEN( "turning it on does produce output" ) {
				
				// 1. Wait for 5 seconds
				std::this_thread::sleep_for(5s);

				
				// 2. See if there was any output
				
				
				
			}
		}
	}
}
