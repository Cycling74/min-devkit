/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2017, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;



std::string min_devkit_path() {
#ifdef WIN_VERSION
	char	path[4096];
	HMODULE	hm = nullptr;

	if (!GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, (LPCSTR)&min_devkit_path, &hm)) {
		int ret = GetLastError();
		fprintf(stderr, "GetModuleHandle() returned %d\n", ret);
	}
	GetModuleFileNameA(hm, path, sizeof(path));

	// path now is the path to this external's binary, including the binary filename.
	auto filename = strrchr(path, '\\');
	if (filename)
		*filename = 0;
	auto externals = strrchr(path, '\\');
	if (externals)
		*externals = 0;

	// TODO: chop off the /externals/min.project.mxe64
	// TODO: which direction are the slashes?

	return path;
#endif // WIN_VERSION

	// TODO: Mac version

}



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
			auto devkit_path { min_devkit_path() };
			cout << devkit_path << endl;

			#ifdef MAC_VERSION
				string cmake_path	{ "/script/cmake.app/Contents/bin/cmake" };
			#else // WIN_VERSION
				string cmake_path{ "/script/CMake/bin/cmake.exe" };
			#endif
			string build_path	{ "/build" };
			string log_path		{ "/tmp/min-cmake-log.txt" };


			std::stringstream mkdir_command; 
			mkdir_command << "mkdir \"" << devkit_path<<"\\tmp\"";
			cout << mkdir_command.str() << endl;
			auto result = std::system(mkdir_command.str().c_str());
			cout << "MKDIR RESULT " << result << endl;

			std::stringstream cmake_command;
			cmake_command << "cd \"" << devkit_path<<build_path << "\" && \"" << devkit_path<<cmake_path;
			#ifdef MAC_VERSION
				cmake_command << "\" -G Xcode .. > " << devkit_path<<log_path << " 2>&1";
			#else // WIN_VERSION
				cmake_command << "\" -G \"Visual Studio 15 2017 Win64\" .. > \"" << devkit_path<<log_path << "\" 2>&1";
			#endif

			cout << cmake_command.str() << endl;

			result = std::system(cmake_command.str().c_str());
			cout << "RESULT " << result << endl;
//			cout << std::ifstream("~/Documents/Max/min-cmake-log.txt").rdbuf() << endl;
			if (result == 0) {
				std::stringstream open_command;
				open_command << "cd " << devkit_path<<build_path << " && " << "open " << devkit_path<<build_path << "/Min-DevKit.xcodeproj";
				cout << open_command.str() << endl;
				result = std::system(open_command.str().c_str());
			}
			output.send(result);

			return {};
		}
	};

};

MIN_EXTERNAL(project);
