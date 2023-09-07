/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;


class example : public object<example> {
public:
    MIN_DESCRIPTION	{ "Bang at random intervals." };
    MIN_TAGS		{ "time" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "min.beat.pattern, link.beat, metro, tempo, drunk" };


    /* === Inlets and Outlets === 
    Inlets and outlets take three arguments inside the curly braces
    - An owner object (typically this)
    - A description
    - A type (as a string). See the Min-Devkit documentation for more info.
    */

    inlet<>  input			{ this, "(toggle) on/off", "int"};  // int represents toggle (0 or 1)
    outlet<> bang_out		{ this, "(bang) triggers at randomized interval", "bang" };
    outlet<> interval_out	{ this, "(float) the interval for the current bang", "float"};

    // Create an Argument
    argument<number> minimum_arg { this, "minimum", "Initial lower-bound of generated random interval.",
        MIN_ARGUMENT_FUNCTION {
            min = arg;
        }
    };

    // Create an attribute
    attribute<number> min { this, "min", 250.0, title {"Minimum Interval"},
        description {"Lower-bound of generated random interval."},
        setter { MIN_FUNCTION {
            UNUSED(this);   // silences compiler warning since we don't access class members
 
            double value = args[0];
            if (value < 1.0)
                value = 1.0;
            return {value};
        }},
        category {"Range"}, order {1}
    };

    /* Messages
    Messages are the most basic functional unit. They take four arguments
    - An owner object (typically this)
    - A type (as a string)
    - A description
    - A function (typically MIN_FUNCTION) */
    message<> toggle { this, "int", "Toggle the state of the timer.",
        MIN_FUNCTION {
            return {};
        }
    };
};


MIN_EXTERNAL(example);
