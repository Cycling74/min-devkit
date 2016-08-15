/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"
#include <queue>

using namespace c74::min;


class later : public object<later> {
public:

	MIN_DESCRIPTION { "Delay number messages into the future. The time at which to delay may be quantized to the beat." };
	MIN_TAGS		{ "time" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "delay, speedlim, note.make" };
	
	inlet	in		{ this, "(number) message to be delayed" };
	outlet	out		{ this, "(number) delayed message" };


	later (const atoms& args = {}) {
		if (!args.empty())
			delay = args;
	}


	attribute<time_value> quantize = { this, "quantize", 0.0,
		description { "Boundary interval at which to quantize. Quantization is with respect to the global transport." },
		time_flags::tempo_based,
	};


	attribute<time_value> delay = { this, "delay", 0.0,
		description { "The amount by which to delay. May be any time value." },
		time_flags::tempo_based,				// only ticks, bbu, and notevalues permitted
		time_callback { later::callback },		// if a callback is present, then the time_value will be able to schedule events
		time_quantization { quantize }			// pass in an attribute to use for quantizing scheduling of the callback
	};


	message number { this, "number", "A number to be delayed.",
		MIN_FUNCTION {
			const time_value& d = delay;
			m_value = args[0];
			d.start();
			return {};
		}
	};

private:
	double m_value; // cached input value to be delayed

	void callback() {
		out.send(m_value);
	}
};

MIN_EXTERNAL(later);
