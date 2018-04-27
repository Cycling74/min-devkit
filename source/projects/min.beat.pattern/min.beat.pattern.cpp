/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;


class beat_pattern : public object<beat_pattern> {
public:
	
	MIN_DESCRIPTION { "Bang at intervals in a repeating pattern." };
	MIN_TAGS		{ "time" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "min.beat.random, link.beat, metro, tempo, drunk" };

	inlet<>		input			{ this, "(toggle) on/off" };
	outlet<>	bang_out		{ this, "(bang) triggers at according to specified pattern" };
	outlet<>	interval_out	{ this, "(float) the interval for the current bang" };

	
	timer<>		metro { this,
		MIN_FUNCTION {
			double interval = m_sequence[m_index];

			interval_out.send(interval);
			bang_out.send("bang");

			metro.delay(interval);

			m_index += 1;

			if (m_index == m_sequence.size())
				m_index = 0;
			return {};
		}
	};


	attribute<bool> on { this, "on", false,
		description { "Turn on/off the internal timer." },
		setter {
			MIN_FUNCTION {
				if (args[0] == true)
					metro.delay(0.0);	// fire the first one straight-away
				else
					metro.stop();
				return args;
			}
		}
	};
	
	
	message<> toggle { this, "int", "Turn on/off the internal timer.",
		MIN_FUNCTION {
			on = args[0];
			return {};
		}
	};
	
	
	message<> dictionary { this, "dictionary", "Use a dictionary to define the pattern of bangs produced.",
		MIN_FUNCTION {
			dict d{ args[0] };

			m_sequence = d["pattern"];
			return {};
		}
	};


private:
	int		m_index { 0 };
	atoms	m_sequence { 250.0, 250.0, 250.0, 250.0, 500.0, 500.0, 500.0, 500.0 };
};

MIN_EXTERNAL(beat_pattern);
