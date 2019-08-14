/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;


class edgelow : public object<edgelow>, public sample_operator<1, 0> {
public:
	MIN_DESCRIPTION	{ "Detect logical signal transitions. Output at low priority." };
	MIN_TAGS		{ "audio" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "min.edge~, min.sift~, edge~" };

	inlet<>                                         input			{ this, "(signal) input" };
	outlet<thread_check::main, thread_action::fifo>	output_true		{ this, "(bang) input is non-zero" };
	outlet<thread_check::main, thread_action::fifo>	output_false	{ this, "(bang) input is zero" };

	void operator()(sample x) {
		if (x != 0.0 && prev == 0.0)
			output_true.send(k_sym_bang);    // change from zero to non-zero
		else if (x == 0.0 && prev != 0.0)
			output_false.send(k_sym_bang);    // change from non-zero to zero
		prev = x;
	}

private:
	sample prev { 0.0 };
};

MIN_EXTERNAL(edgelow);
