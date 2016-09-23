// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License

#include "c74_min_unittest.h"	// required unit test header
#include "min.hello-world.cpp"	// need the source of our object so that we can access it

// Unit tests are written using the Catch framework as described at
// https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

SCENARIO( "object produces correct output" ) {

	GIVEN( "An instance of our object" ) {
		ext_main(nullptr);
		auto o = (c74::min::minwrap<hello_world>*)c74::min::wrapper_new<hello_world>(symbol("min.hello-world"), 0, nullptr);
		hello_world& my_object = o->min_object;

		// check that default attr values are correct
		
		REQUIRE(( my_object.greeting == symbol("hello world") ));

		// now proceed to testing various sequences of events
		WHEN( "a 'bang' is received" ) {
			my_object.bang();
			THEN( "our greeting is produced at the outlet" ) {
				auto output = c74::max::object_getoutput(my_object, 0);
				REQUIRE(( output.size() == 1 ));
				REQUIRE(( output[0].size() == 1 ));
				REQUIRE(( output[0][0] == symbol("hello world") ));
			}
		}
	}
}
