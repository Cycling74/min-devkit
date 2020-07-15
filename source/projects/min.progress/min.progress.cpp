/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2020 The Min-DevKit Authors. All rights reserved.
///	@license	        Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class progress : public object<progress> {
private:
    number m_current_progress {};
    number m_stepsize {};

public:
    MIN_DESCRIPTION	{ "Demonstrate display of a progress bar." };
    MIN_TAGS		{ "interface" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "stretch~" };

    inlet<> m_inlet { this, "(list) values to convolve" };


    attribute<number> m_duration { this, "duration", 3000.0, description {"Duration of the process."} };


    message<> m_bang { this, "bang", "Start process.",
        MIN_FUNCTION {
            m_current_progress = 0.0;
            m_stepsize = 1.0 / m_duration;

            auto b = box();
            b("startprogress", &m_current_progress);

            m_timer.delay(1.0);
            return {};
        }
    };


    timer<timer_options::defer_delivery> m_timer { this, MIN_FUNCTION {
        if (m_current_progress >= 1.0) {
            auto b = box();
            b("stopprogress");
        }
        else {
            m_current_progress += m_stepsize;
            m_timer.delay(1.0);
        }
        return {};
    }};
};

MIN_EXTERNAL(progress);
