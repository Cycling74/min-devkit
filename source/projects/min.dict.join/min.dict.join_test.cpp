/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min_unittest.h"    // required unit test header
#include "min.dict.join.cpp"     // need the source of our object so that we can access it

// Unit tests are written using the Catch framework as described at
// https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

SCENARIO("object produces correct output") {
    ext_main(nullptr);    // every unit test must call ext_main() once to configure the class

    GIVEN("An instance of dict_joiner") {

        test_wrapper<dict_join> an_instance;
        dict_join&              my_object = an_instance;

        // check that the object instantiated successfully

        REQUIRE(my_object.inlets().size() == 2);
    }
}
