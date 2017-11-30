/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


class slope {
	const int k_power_multiplier = 3.0; // higher number yields more extreme curves
public:

	void operator = (number percentage) {
		m_is_linear = fabs(percentage) < 0.001;
		if (m_is_linear)
			m_k = 1.0;
		else
			m_k = pow(2, (-percentage/100.0) * k_power_multiplier);
	}


	number operator()(number x) {
		// Profile this: What's worse? branching or calculating even when linear?
		return pow(x, m_k);
	}

private:
	number	m_k			{ 1.0 };
	bool	m_is_linear	{ true };
};


class adsr_tilde : public object<adsr_tilde>, public sample_operator<0,1> {
public:

	MIN_DESCRIPTION { "ADSR envelope generator" };
	MIN_TAGS		{ "synthesis" };
	MIN_AUTHOR		{ "Timothy Place" };
	MIN_RELATED		{ "adsr~" };
	
	inlet<>		m_inlet		{ this, "(int) trigger" };
	outlet<>	m_outlet	{ this, "(signal) envelope", "signal" };


	attribute<number,threadsafe::yes> m_initial { this, "initial", 0.0,
		title { "Initial Value" },
		description { "The value of the envelope at the moment it is triggered." },
		setter { MIN_FUNCTION {
			m_initial_cached = args[0];
			recalc();
			return args;
		}}
	};


	attribute<number,threadsafe::yes> m_peak { this, "peak", 1.0,
		title { "Peak Value" },
		description { "The value which marks the end of the @attack stage, and the beginning of the @decay stage." },
		setter { MIN_FUNCTION {
			m_peak_cached = args[0];
			recalc();
			return args;
		}}
	};


	attribute<number,threadsafe::yes> m_sustain { this, "sustain", 1.0,
		title { "Sustain Level" },
		description {
			"The level reached at the end of the @decay stage. "
			"The value will remain at this level until triggered off (e.g. by a MIDI noteoff) "
			"unless it is in loop, sync, or beat @mode."
		},
		setter { MIN_FUNCTION {
			m_sustain_cached = args[0];
			recalc();
			return args;
		}}
	};


	attribute<number,threadsafe::yes> m_end { this, "end", 0.0,
		title { "End Value" },
		description { "The value of the envelope at the end of the @release stage." },
		setter { MIN_FUNCTION {
			m_end_cached = args[0];
			recalc();
			return args;
		}}
	};


	attribute<number,threadsafe::yes,limit::clamp> m_attack_time { this, "attack_time", 0.0,
		title { "Attack Time" },
		description { "Attack time in milliseconds. The time needed to travel from the @initial value to the @peak value." },
		range { 0.0, 20000.0 },
		category { "Duration" },
		setter { MIN_FUNCTION {
			auto attack_ms = static_cast<number>(args[0]);
			m_attack_step_count = (attack_ms / 1000.0) * samplerate();
			m_attack_step_count = std::max(m_attack_step_count, 1);
			recalc();
			return args;
		}}
	};


	attribute<number,threadsafe::yes,limit::clamp> m_attack_slope { this, "attack_slope", 0.0,
		title { "Attack Slope" },
		description { "The shape of the @attack envelope segment. Positive and negative values create steep curves. A value of 0 is linear." },
		range { -100.0, 100.0 },
		category { "Duration" },
		setter { MIN_FUNCTION {
			m_attack_exp = args[0];
			return args;
		}}
	};


	attribute<number,threadsafe::yes,limit::clamp> m_decay_time { this, "decay_time", 600.0,
		title { "Decay Time" },
		range { 1.0, 60000.0 },
		description { "Decay time in milliseconds. The time needed to travel from the peak value to the sustain level." },
		category { "Duration" },
		setter { MIN_FUNCTION {
			auto decay_ms = static_cast<number>(args[0]);
			m_decay_step_count = (decay_ms / 1000.0) * samplerate();
			recalc();
			return args;
		}}
	};


	attribute<number,threadsafe::yes,limit::clamp> m_decay_slope { this, "decay_slope", 0.0,
		title { "Decay Slope" },
		description { "The shape of the @decay envelope segment. Positive and negative values create steep curves. A value of 0 is linear." },
		range { -100.0, 100.0 },
		category { "Duration" },
		setter { MIN_FUNCTION {
			m_decay_exp = args[0];
			return args;
		}}
	};


	attribute<number,threadsafe::yes,limit::clamp> m_release_time { this, "release_time", 50.0,
		title { "Release Time" },
		description {
			"Release time in milliseconds. "
			"The time needed to travel to the end value after the trigger is turned off (e.g. a MIDI noteoff message is received)."
		},
		range { 1.0, 60000.0 },
		category { "Duration" },
		setter { MIN_FUNCTION {
			auto release_ms = static_cast<number>(args[0]);
			m_release_step_count = (release_ms / 1000.0) * samplerate();
			recalc();
			return args;
		}}
	};


	attribute<number,threadsafe::yes,limit::clamp> m_release_slope { this, "release_slope", 0.0,
		title { "Release Slope" },
		description { "The shape of the @release envelope segment. Positive and negative values create steep curves. A value of 0 is linear." },
		range { -100.0, 100.0 },
		category { "Duration" },
		setter { MIN_FUNCTION {
			m_release_exp = args[0];
			return args;
		}}
	};


	message<> m_trigger { this, "int", "Trigger on/off an envelope.",
		MIN_FUNCTION {
			m_active = args[0];

			if (m_active) {
				m_state = adsr_state::attack;
				m_index = 0;
				m_attack_current = 0.0;
			}
			else {
				m_state = adsr_state::release;
				m_index = 0;
				m_release_current = 0.0;
			}
			return {};
		}
	};


	sample operator()() {
		sample output;

		switch (m_state) {
			case adsr_state::attack:
				m_attack_current += m_attack_step;
				++m_index;
				if (m_index == m_attack_step_count) {
					output = m_peak_cached;
					m_state = adsr_state::decay;
					m_index = 0;
					m_decay_current = 0.0;
				}
				else
					output = m_attack_exp(m_attack_current) * (m_peak_cached - m_initial_cached) + m_initial_cached;
				break;
			case adsr_state::decay:
				m_decay_current += m_decay_step;
				++m_index;
				if (m_index == m_decay_step_count) {
					output = m_sustain_cached;
					m_state = adsr_state::sustain;
					m_index = 0;
				}
				else
					output = m_decay_exp(m_decay_current) * (m_sustain_cached - m_peak_cached) + m_peak_cached;
				break;
			case adsr_state::sustain:
				output = m_sustain_cached;
				break;
			case adsr_state::release:
				m_release_current += m_release_step;
				++m_index;
				if (m_index >= m_release_step_count)
					output = m_end_cached;
				else
					output = m_release_exp(m_release_current) * (m_end_cached - m_sustain_cached) + m_sustain_cached;
				break;
		}
		return output;
	}


private:
	slope	m_attack_exp;
	number	m_attack_step;
	int		m_attack_step_count;
	sample	m_attack_current;

	slope	m_decay_exp;
	number	m_decay_step;
	int		m_decay_step_count;
	sample 	m_decay_current;

	slope	m_release_exp;
	number	m_release_step;
	int		m_release_step_count;
	sample 	m_release_current { 0.0 };

	number	m_initial_cached;
	number	m_peak_cached;
	number	m_sustain_cached;
	number	m_end_cached;

	int	m_index { 0xFFFFFF };

	enum class adsr_state {
		attack,
		decay,
		sustain,
		release
	};
	adsr_state m_state { adsr_state::release };

	bool	m_active		{ false };


	void recalc() {
		m_attack_step = 1.0 / m_attack_step_count;
		m_decay_step = 1.0 / m_decay_step_count;
		m_release_step = 1.0 / m_release_step_count;
	}

};

MIN_EXTERNAL(adsr_tilde);
