// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License


// 0. Include the test framework we use, which is Catch from
//    https://github.com/philsquared/Catch

#define CATCH_CONFIG_MAIN
#include "catch.hpp"

#ifdef DOESNT_WORK_YET

// 1. Include the source of our object so that we can access it

#include "min.note.make.cpp"


// 1.5  We need special test stuff
// TODO: where do we put this stuff?

// mock lib

// Special stuff for the mocked testing environment

namespace c74 {
namespace max {
		

	/**	A vector of atoms.	*/
	typedef std::vector<c74::max::t_atom>	t_atom_vector;

	/** A sequence of atom vectors.
		Used to log inlet and outlet activity in the mock environment.
		We can use logging of inlet and outlet sequences for BDD.
		We can also do more traditional state-based testing.
		Or mix-n-match as we see fit...
	 
		@remark		should sequences have time-stamps?
	 */
	typedef std::vector<t_atom_vector>	t_sequence;


	t_sequence& object_getoutput(void *o, int outletnum);

}}

using namespace std;
using namespace std::chrono_literals;




// 2. Now write a Catch unit test as described at
//    https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

SCENARIO( "object produces correct output" ) {
	
	using namespace std::chrono_literals;
//	std::cout << "Hello waiter" << std::endl;
//	auto start = std::chrono::high_resolution_clock::now();
//	std::this_thread::sleep_for(2s);
//	auto end = std::chrono::high_resolution_clock::now();
//	std::chrono::duration<double, std::milli> elapsed = end-start;
//	std::cout << "Waited " << elapsed.count() << " ms\n";

	GIVEN( "An instance of our object" ) {
		banger	my_object;
		
		// check that default attr values are correct
		
		REQUIRE( my_object.on == false );
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
		
/*
		AND_WHEN( "The mode is set to 'precision'" ) {
			THEN ("the results are more accurate") {
				
				// set attributes, including symbol attributes, by simply assigning them
				
				my_object.mode = "precision";
				
				auto result1 = my_object.calculate(0.0, 1.0);
				auto result2 = my_object.calculate(1.0, 0.0);
			
				// and now we don't need to define a custom epsilon because there is no quantization error
				
				REQUIRE( result1 == Approx ( std::sqrt(2.0)/2.0 ) );
				REQUIRE( result2 == Approx ( std::sqrt(2.0)/2.0 ) );
			}
			AND_THEN( "due to quantization of the lookup table 'precision' won't be the same as 'fast'" ) {
				
				// this is a way we can check that the object is actually doing something different
				// internally when we change the attribute value
				
				my_object.mode = "precision";
				auto result_precision = my_object.calculate(1.0, 0.0);

				my_object.mode = "fast";
				auto result_fast = my_object.calculate(1.0, 0.0);

				REQUIRE( result_precision != Approx( result_fast ) );
			}
		}
		
		AND_WHEN ("The shape is set to 'linear'") {
			THEN ("we produce a roughly -6db downpoint in the middle of the fade for both 'fast' and 'precision' modes") {
				
				xfade a_new_xfade_object;	// make a fresh object so we don't rely on some messy state from above
				
				a_new_xfade_object.shape = "linear";
				a_new_xfade_object.mode = "precision";
				a_new_xfade_object.position = 0.5;
				
				auto result1 = a_new_xfade_object.calculate(0.0, 1.0);
				auto result2 = a_new_xfade_object.calculate(1.0, 0.0);

				REQUIRE( result1 == Approx ( 0.5 ) );
				REQUIRE( result2 == Approx ( 0.5 ) );
				
				
				a_new_xfade_object.mode = "fast";

				auto result3 = a_new_xfade_object.calculate(0.0, 1.0);
				auto result4 = a_new_xfade_object.calculate(1.0, 0.0);

				REQUIRE( result3 == Approx ( 0.5 ).epsilon(0.00195) );
				REQUIRE( result4 == Approx ( 0.5 ).epsilon(0.00195) );
			}
		}
 */
	}
}

#endif // DOESNT_WORK_YET
