/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2017, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"
#ifdef MAC_VERSION
#include <Carbon/Carbon.h>
#endif // MAC_VERSION

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

	return path;
#endif // WIN_VERSION

#ifdef MAC_VERSION
	CFBundleRef this_bundle = CFBundleGetBundleWithIdentifier( CFSTR("com.cycling74.min-project") );
	CFURLRef	this_url = CFBundleCopyExecutableURL(this_bundle);
	CFStringRef	this_path = CFURLCopyPath(this_url);
	string		this_path_str = CFStringGetCStringPtr(this_path, kCFStringEncodingUTF8);

	CFRelease(this_path);
	CFRelease(this_url);
	// remember: we don't want to release the bundle because Max is still using it!

	// we now have a path like this:
	// /Users/tim/Materials/min-devkit/externals/min.project.mxo/Contents/MacOS/min.project"
	// so we need to chop off 5 slashes from the end

	auto iter = this_path_str.find("/externals/min.project.mxo/Contents/MacOS/min.project");
	this_path_str.erase(iter, strlen("/externals/min.project.mxo/Contents/MacOS/min.project"));
	return this_path_str;
#endif // MAC_VERSION
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
	//message<>	hello_world {};
	message<> generate { this, "generate", "Generate IDE projects and then open the specified project only.",
		MIN_FUNCTION {
			auto devkit_path { min_devkit_path() };

#ifdef MAC_VERSION
			string	cmake_path{ "/script/cmake-mac/bin/cmake" };
			char 	separator { '/' };
#else // WIN_VERSION
			string	cmake_path{ "/script/cmake-win/bin/cmake.exe" };
			char 	separator { '\\' };
#endif
			string build_path	{ "/build" };
			string log_path		{ "/tmp/min-cmake-log.txt" };

			std::stringstream mkdir_command;
			mkdir_command << "mkdir \"" << devkit_path << separator << "tmp\"";
			std::system(mkdir_command.str().c_str());

			std::stringstream cmake_command;
			cmake_command << "cd \"" << devkit_path<<build_path << "\" && \"" << devkit_path<<cmake_path;
#ifdef MAC_VERSION
			cmake_command << "\" -G Xcode .. > " << devkit_path<<log_path << " 2>&1";
#else // WIN_VERSION
			cmake_command << "\" -G \"Visual Studio 15 2017 Win64\" .. > \"" << devkit_path<<log_path << "\" 2>&1";
#endif

			auto result = std::system(cmake_command.str().c_str());
			//			cout << "RESULT " << result << endl;
			//			cout << std::ifstream("~/Documents/Max/min-cmake-log.txt").rdbuf() << endl;
			if (result == 0) {
#ifdef MAC_VERSION
				if (args.empty()) {
					std::stringstream open_command;
					open_command << "cd " << devkit_path<<build_path << " && " << "open " << devkit_path<<build_path << "/Min-DevKit.xcodeproj";
					//cout << open_command.str() << endl;
					result = std::system(open_command.str().c_str());
				}
				else {
					string project_name = args[0];
					std::stringstream open_command;
					open_command << "cd " << devkit_path<<build_path << " && " << "open " << devkit_path << build_path << "/source/projects/" << project_name << separator << project_name << "_test.xcodeproj";
					//cout << open_command.str() << endl;
					result = std::system(open_command.str().c_str());
				}
#else // WIN_VERSION
				if (args.empty()) {
					std::stringstream vs_sln_path;
					vs_sln_path << "\"" << devkit_path << build_path << "/Min-DevKit.sln\"";
					ShellExecute(NULL, "open", "C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Community\\Common7\\IDE\\devenv.exe", vs_sln_path.str().c_str(), NULL, SW_SHOWNORMAL);
				}
				else {
					string project_name = args[0];
					std::stringstream vs_sln_path;
					vs_sln_path << "\"" << devkit_path << build_path << "/source/projects/" << project_name << separator << project_name << "_test.sln\"";
					ShellExecute(NULL, "open", "C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Community\\Common7\\IDE\\devenv.exe", vs_sln_path.str().c_str(), NULL, SW_SHOWNORMAL);
				}
#endif
			}

			output.send(result);
			return {};
		}
	};

	
	message<> bang {this, "bang", "Generate IDE projects for the Min-DevKit and open them in the IDE (Xcode or Visual Studio.",
		MIN_FUNCTION {
			return generate();
		}
	};

};

MIN_EXTERNAL(project);
