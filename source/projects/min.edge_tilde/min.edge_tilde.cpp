/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class edge : public object<edge>, sample_operator<1,0> {
public:

	inlet<>		input			{ this, "(signal) Input" };
	outlet<>	output_true		{ this, "(bang) input is non-zero" };
	outlet<>	output_false	{ this, "(bang) input is zero" };

	timer deliverer { this, MIN_FUNCTION {
		bool state;
		while (transitions.try_dequeue(state)) {
			if (state)
				output_true.send("bang");
			else
				output_false.send("bang");
		}
		return {};
	}};

	void operator()(sample x) {
		if (x != 0.0 && prev == 0.0) { // change from zero to non-zero
			transitions.try_enqueue(true);
			deliverer.delay(0);
		}
		else if (x == 0.0 && prev != 0.0) { // change from non-zero to zero
			transitions.try_enqueue(false);
			deliverer.delay(0);
		}
		prev = x;
	}

private:
	sample		prev { 0.0 };
	fifo<bool>	transitions { 100 };
};


MIN_EXTERNAL(edge);
