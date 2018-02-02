/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2018, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"
#include <regex>
#ifdef MAC_VERSION
#include <Carbon/Carbon.h>
#include <sys/utsname.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#endif // MAC_VERSION

using namespace c74::min;


class environment : public object<environment> {
public:

	MIN_DESCRIPTION { "Get the approximate value of pi." };
	MIN_TAGS		{ "math" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "sin, cos, atan~, jit.op, gen~" };

	inlet<>		in				{ this, "(bang) get info about the current max environment" };
	outlet<>	out_platform	{ this, "(symbol) platform" };
	outlet<>	out_arch		{ this, "(symbol) architecture" };
	outlet<>	out_os			{ this, "(symbol) operating system version" };


	const char *osversionstring(void)
	{
		static char version[512];
#ifdef MAC_VERSION
		SInt32 versionMajor=0, versionMinor=0, versionBugFix=0;
		struct utsname un;
		uname(&un);
		Gestalt(gestaltSystemVersionMajor, &versionMajor);
		Gestalt(gestaltSystemVersionMinor, &versionMinor);
		Gestalt(gestaltSystemVersionBugFix, &versionBugFix);
		snprintf(version, sizeof(version), "Mac OS X Version %i.%i.%i %s", (int)versionMajor, (int)versionMinor, (int)versionBugFix, un.machine);
#endif
#ifdef WIN_VERSION
		if (!GetOSDisplayString(version)) {
			// if we get here it is an unexpected version of windows
			snprintf_zero(version, sizeof(version), "Unexpected version of Microsoft Windows");
		}
#endif
		return version;
	}


	message<> bang { this, "bang", "Get info about the current max environment.",
		MIN_FUNCTION {

			out_os.send(osversionstring());

			#ifdef C74_X64
				out_arch.send("x86_64");
			#else // 32-bit
				out_arch.send("i386");
			#endif

			#ifdef MAC_VERSION
				out_platform.send("mac");
			#else // WIN_VERSION
				out_platform.send("win");
			#endif
			return {};
		}
	};


};

MIN_EXTERNAL(environment);
