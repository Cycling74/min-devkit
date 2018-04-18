/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class tap_sift_tilde : public object<tap_sift_tilde>, public sample_operator<1,0> {
public:

	MIN_DESCRIPTION { "Remove a specific sample value and convert to float output. "
					  "[min.sift~] removes a specified sample value (typically zero) as well as repeated sample values from an input signal. "
					  "It then converts the remaining samples to floating-point output at control rate." };
	MIN_TAGS		{ "analysis" };
	MIN_AUTHOR		{ "Timothy Place" };
	MIN_RELATED		{ "min.edge~, min.edgelow~, edge~, snapshot~, ==~" };
	
	inlet<>		input	{ this, "(signal) to be sifted" };
	outlet<>	output	{ this, "(numbers) remaining values after the sift" };

	argument<number> value_arg	{ this, "value", "Initial value to sift out from the incoming signal.",
		MIN_ARGUMENT_FUNCTION {
			value = arg;
		}
	};

	attribute<number,threadsafe::yes> value { this, "value", 0.0,
		description { "Value to sift out of the incoming signal." }
	};

	attribute<bool,threadsafe::yes> high_priority { this, "high_priority", true,
		description {
			"Deliver results in the high-priority scheduler thread. "
			"If set to false then deliver results in the main thread. "
		}
	};

	void operator()(sample x) {
		if (x != value && x != m_last) {
			m_fifo.try_enqueue(x);
			deliverer.delay(0);
		}
		m_last = x;
	}


	timer<> deliverer { this,
		MIN_FUNCTION {
			if (high_priority)
				drain_the_fifo();
			else
				deferrer.set();
			return {};
		}
	};


	queue<> deferrer { this,
		MIN_FUNCTION {
			drain_the_fifo();
			return {};
		}
	};

private:
	sample			m_last { 0.0 }; ///< last value output
	fifo<number>	m_fifo { 100 };	///< queue with space for 100 items

	void drain_the_fifo() {
		number x;
		while (m_fifo.try_dequeue(x))
			output.send(x);
	}
};

MIN_EXTERNAL(tap_sift_tilde);
