// Copyright (c) 2016, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License

#define CATCH_CONFIG_MAIN
#include "catch.hpp"
#include "c74_mock.h"

#include "dcblocker_tilde.cpp"

TEST_CASE( "dcblocker~ object", "[audio]" ) {

    SECTION("symbol assignments") {
		atoms		as;
		dcblocker	my_object(as);
		double		y = my_object.calculate(0.0);
		
		REQUIRE( y == Approx(0.0) );
	}

}
