// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License

#include "c74_min_unittest.h"	// required unit test header
#include "min.convolve.cpp"		// need the source of our object so that we can access it

// Unit tests are written using the Catch framework as described at
// https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

SCENARIO( "object produces correct output" ) {
	ext_main(nullptr);	// every unit test must call ext_main() once to configure the class

	GIVEN( "An instance of our object" ) {

		test_wrapper<convolve> an_instance;
		convolve& my_object = an_instance;

		// check that default attr values are correct
		std::vector<double> initial_kernel = my_object.kernel;
		std::vector<double> reference_kernel {1.0, 0.0};
		REQUIRE(( initial_kernel.size() == reference_kernel.size() ));
		for (auto i=0; i<initial_kernel.size(); ++i) {
			REQUIRE(( initial_kernel[i] == Approx(reference_kernel[i]) ));
		}

		// now proceed to testing various sequences of events
		WHEN( "the defaults are used" ) {
			THEN( "the input is the same as the output" ) {
				atoms input { 1.0, 2.0, 3.0, 4.0 };

				my_object.list( input );
				auto output = c74::max::object_getoutput(my_object, 0);
				REQUIRE(( output.size() == 1 ));
				REQUIRE(( output[0].size() == input.size() ));
				for (auto i=0; i<output.size(); ++i) {
					REQUIRE(( output[0][i] == Approx(input[i]) ));
				}
			}
		}
	}
}
