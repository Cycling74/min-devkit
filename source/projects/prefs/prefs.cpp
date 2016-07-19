/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"
#include <random>

using namespace c74::min;


class prefs : public object<prefs> {
public:

	inlet	input	{ this, "(bang) get the path to the preferences folder" };
	outlet	output	{ this, "(symbol) preferences folder path" };
	
	method	bang	{this, "bang", MIN_FUNCTION {
		std::string str = p;
		output.send(str);
		return {};
	}};
	
private:
	path	p { path::system::preferences };
};


MIN_EXTERNAL(prefs);
