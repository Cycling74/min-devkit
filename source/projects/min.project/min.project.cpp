/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2017, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class project : public object<project> {
public:

	MIN_DESCRIPTION { "Get the approximate value of pi." };
	MIN_TAGS		{ "math" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "sin, cos, atan~, jit.op, gen~" };

	inlet<>		input	{ this, "(bang) get the approximate value of pi" };
	outlet<>	output	{ this, "(number) progress in percent" };


	// only open the project for hello-world, not the big container...
//	message<>	hello_world {};


	message<>	bang	{this, "bang", "Generate IDE projects for the Min-DevKit and open them in the IDE (Xcode or Visual Studio.",
		MIN_FUNCTION {


			string cmake_path	{ "~/Documents/Max/\"Max 8\"/Packages/Min-DevKit/script/cmake.app/Contents/bin/cmake" };
			string build_path	{ "~/Documents/Max/\"Max 8\"/Packages/Min-DevKit/build" };
			string log_path		{ "~/Documents/Max/min-cmake-log.txt" };

			std::stringstream cmake_command;
			cmake_command << "cd " << build_path << " && " << cmake_path << " -G Xcode .. > " << log_path << " 2>&1";

			auto result = std::system(cmake_command.str().c_str());
			cout << std::ifstream("~/Documents/Max/min-cmake-log.txt").rdbuf() << endl;
			if (result == 0) {
				std::stringstream open_command;
				open_command << "cd " << build_path << " && " << "open " << build_path << "/Min-DevKit.xcodeproj";
				cout << open_command.str() << endl;
				result = std::system(open_command.str().c_str());
			}
			output.send(result);

			return {};
		}
	};
};

MIN_EXTERNAL(project);
