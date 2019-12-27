/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class pi : public object<pi> {
public:
    MIN_DESCRIPTION	{ "Get the approximate value of pi." };
    MIN_TAGS		{ "math" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "sin, cos, atan~, jit.op, gen~" };

    inlet<>  input	{ this, "(bang) get the approximate value of pi" };
    outlet<> output	{ this, "(number) approximate value of pi" };

    message<> bang { this, "bang", "Return the path to the preferences folder.",
        MIN_FUNCTION {
            output.send(M_PI);
            return {};
        }
    };
};

MIN_EXTERNAL(pi);
