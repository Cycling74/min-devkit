// Copyright (c) 2017, Cycling '74
// Timothy Place
// Usage of this file and its contents is governed by the MIT License

#include "c74_min_unittest.h"		// required unit test header
#include "min.adsr_tilde.cpp"		// need the source of our object so that we can access it

// Unit tests are written using the Catch framework as described at
// https://github.com/philsquared/Catch/blob/master/docs/tutorial.md

TEST_CASE( "slope class calculates correctly" ) {
	slope	a_slope;
	numbers	result;




	a_slope = 100.0;
	result.clear();
	result.push_back( a_slope(0.0));
	result.push_back( a_slope(0.25));
	result.push_back( a_slope(0.5));
	result.push_back( a_slope(0.75));
	result.push_back( a_slope(1.0));
	std::cout << "RESULT 3: " << result[0] << " " << result[1] << " " << result[2] << " " << result[3] << " " << result[4] << " " << std::endl;

	a_slope = 50.0;
	result.clear();
	result.push_back( a_slope(0.0));
	result.push_back( a_slope(0.25));
	result.push_back( a_slope(0.5));
	result.push_back( a_slope(0.75));
	result.push_back( a_slope(1.0));
	std::cout << "RESULT 2: " << result[0] << " " << result[1] << " " << result[2] << " " << result[3] << " " << result[4] << " " << std::endl;

	a_slope = 0.0;
	result.clear();
	result.push_back( a_slope(0.0));
	result.push_back( a_slope(0.25));
	result.push_back( a_slope(0.5));
	result.push_back( a_slope(0.75));
	result.push_back( a_slope(1.0));
	std::cout << std::endl;
	std::cout << "RESULT 1: " << result[0] << " " << result[1] << " " << result[2] << " " << result[3] << " " << result[4] << " " << std::endl;
	std::cout << std::endl;


	a_slope = -50.0;
	result.clear();
	result.push_back( a_slope(0.0));
	result.push_back( a_slope(0.25));
	result.push_back( a_slope(0.5));
	result.push_back( a_slope(0.75));
	result.push_back( a_slope(1.0));
	std::cout << "RESULT 4: " << result[0] << " " << result[1] << " " << result[2] << " " << result[3] << " " << result[4] << " " << std::endl;


	a_slope = -100.0;
	result.clear();
	result.push_back( a_slope(0.0));
	result.push_back( a_slope(0.25));
	result.push_back( a_slope(0.5));
	result.push_back( a_slope(0.75));
	result.push_back( a_slope(1.0));
	std::cout << "RESULT 5: " << result[0] << " " << result[1] << " " << result[2] << " " << result[3] << " " << result[4] << " " << std::endl;


	// check it
//	REQUIRE( output == reference );
}


