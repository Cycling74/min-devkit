/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "../_shared/signal_routing_objects.h"

// The xfade~ object inherits all of it's attributes and messages from the signal_routing_base class.
// The panner~ object does exactly the same, allowing us to share the code between the two similar but opposite classes.

class panner : public signal_routing_base<panner>, public sample_operator<2,2> {
public:
	
	inlet	in1		{ this, "(signal) Input 1" };
	inlet	in_pos	{ this, "(signal) Position between them (0..1)" };
	outlet	out1	{ this, "(signal) Left Output", "signal" };
	outlet	out2	{ this, "(signal) Right Output", "signal" };
	

	/// Process one sample
	
	samples<2> operator()(sample input, sample position = 0.5) {
		auto weight1 = this->weight1;
		auto weight2 = this->weight2;
		
		if (in_pos.has_signal_connection())
			std::tie(weight1, weight2) = calculate_weights(mode, position);
		
		return {{ input * weight1, input * weight2 }};
	}
};


MIN_EXTERNAL(panner);
