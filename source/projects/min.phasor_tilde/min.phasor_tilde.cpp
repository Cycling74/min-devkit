/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class phasor : public object<phasor>, public sample_operator<0, 1> {
private:
	lib::sync m_oscillator;    // note: must be created prior to any attributes that might set parameters below

public:
	MIN_DESCRIPTION {"A non-bandlimited sawtooth oscillator (a phasor~ in MSP parlance)."
					"This <a href='https://en.wikipedia.org/wiki/Sawtooth_wave'>sawtooth wave</a>"
					"is typically used as a control signal for <a "
					"href='https://en.wikipedia.org/wiki/Phase_(waves)'>phase</a> ramping."};
	MIN_TAGS {"audio, oscillator"};
	MIN_AUTHOR {"Cycling '74"};
	MIN_RELATED {"phasor~, saw~"};


	inlet<>  in1 {this, "(number) frequency"};
	outlet<> out1 {this, "(signal) ramp wave", "signal"};


	argument<number> frequency_arg {this, "frequency", "Initial frequency in hertz.",
		MIN_ARGUMENT_FUNCTION { frequency = arg; }};


	message<> m_number {this, "number", "Set the frequency in Hz.",
		MIN_FUNCTION {
			frequency = args;
			return {};
		}};


	attribute<number> frequency {this, "frequency", 1.0, description {"Frequency in Hz"},
		setter { MIN_FUNCTION {
			m_oscillator.frequency(args[0], samplerate());
			return args;
		}}};


	sample operator()() {
		return m_oscillator();
	}
};

MIN_EXTERNAL(phasor);
