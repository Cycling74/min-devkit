/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

const char* min_environment_osversionstring();
const char* min_environment_macaddr();
std::string min_environment_uniqueid();

using namespace c74::min;


class environment : public object<environment> {
public:
    MIN_DESCRIPTION	{ "Get info about the current max environment." };
    MIN_TAGS		{ "math" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "gestalt" };

    inlet<>		in				{ this, "(bang) get info about the current max environment" };
    outlet<>	out_platform	{ this, "(symbol) platform" };
    outlet<>	out_arch		{ this, "(symbol) architecture" };
    outlet<>	out_os			{ this, "(symbol) operating system version" };
    outlet<>	out_macaddr		{ this, "(symbol) primary MAC address" };
    outlet<>	out_id			{ this, "(symbol) unique identifier" };

    message<> bang {this, "bang", "Get info about the current max environment.",
        MIN_FUNCTION {
            out_id.send( min_environment_uniqueid() );
            out_macaddr.send( min_environment_macaddr() );
            out_os.send( min_environment_osversionstring() );

            #ifdef C74_X64
                out_arch.send("x86_64");
            #else    // 32-bit
                out_arch.send("i386");
            #endif

            #ifdef MAC_VERSION
                out_platform.send("mac");
            #else    // WIN_VERSION
                out_platform.send("win");
            #endif

            return {};
        }
    };
};

MIN_EXTERNAL(environment);
