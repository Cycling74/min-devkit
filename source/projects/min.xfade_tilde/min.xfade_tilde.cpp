/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"
#include "../shared/signal_routing_objects.h"

// The xfade~ object inherits all of it's attributes and messages from the signal_routing_base class.
// The panner~ object does exactly the same, allowing us to share the code between the two similar but opposite classes.

class xfade : public signal_routing_base<xfade>, public sample_operator<3,1> {
public:
	
	MIN_DESCRIPTION { "Crossfade between two signals." };
	MIN_TAGS		{ "audio, routing" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "panner~, matrix~" };

	// above we inherited from sample_operator<3,1> which means 3 inputs and 1 output for our calculate method
	// we still need to create the interface for the object though, which includes the assistance strings...
	
	inlet	in1		{ this, "(signal) Input 1" };
	inlet	in2		{ this, "(signal) Input 2" };
	inlet	in_pos	{ this, "(signal) Position between them (0..1)" };
	outlet	output	{ this, "(signal) Output", "signal" };
	

	/// Call operator: process a single sample
	/// Note that it takes three samples as input because we defined this class to inherit from sample_operator<3,1>
	
	sample operator()(sample in1, sample in2, sample position = 0.5) {
		auto weight1 = this->weight1;
		auto weight2 = this->weight2;
		
		if (in_pos.has_signal_connection())
			std::tie(weight1, weight2) = calculate_weights(mode, position);
		return in1*weight1 + in2*weight2;
	}
};

MIN_EXTERNAL(xfade);
