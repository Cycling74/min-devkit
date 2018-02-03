/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class edge : public object<edge>, public sample_operator<1,0> {
public:

	MIN_DESCRIPTION { "Detect logical signal transitions. Output at high priority." };
	MIN_TAGS		{ "audio" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "min.edgelow~, min.sift~, edge~" };

	inlet<>													input			{ this, "(signal) input" };
	outlet<thread_check::scheduler, thread_action::fifo>	output_true		{ this, "(bang) input is non-zero" };
	outlet<thread_check::scheduler, thread_action::fifo>	output_false	{ this, "(bang) input is zero" };

	void operator()(sample x) {
		if (x != 0.0 && prev == 0.0)
			output_true.send(k_sym_bang);	// change from zero to non-zero
		else if (x == 0.0 && prev != 0.0)
			output_false.send(k_sym_bang);	// change from non-zero to zero
		prev = x;
	}

private:
	sample		prev { 0.0 };
};

MIN_EXTERNAL(edge);
