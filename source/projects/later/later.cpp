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

	MIN_DESCRIPTION { "Delay any type of message into the future. The time at which to delay may be quantized to the beat." };
	MIN_TAGS		{ "time" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "delay, speedlim, note.make" };
	
	inlet	in		{ this, "(anything) message to be delayed" };
	outlet	out		{ this, "(anything) delayed message" };


	later (const atoms& args = {}) {
		if (!atoms.empty())
			delay = args;
	}


	attribute<time_value> delay = { this, "delay", 0.0 };


	message number { this, "number", "A number to be delayed.",
		MIN_FUNCTION {
			return {};
		}
	};


private:
	notes		m_notes;
	pitch		m_pitch;
	velocity	m_velocity;
	duration	m_duration;

	void start() {
		velocity_out.send(m_velocity);
		pitch_out.send(m_pitch);
		m_notes.push_back( std::make_unique<note>(this, m_pitch, m_duration) );
	}

	void remove(long note_id) {
		bool note_removed = false;

		for (auto iter = m_notes.begin(); iter != m_notes.end(); ++iter) {
			const auto& stored_note = (*iter).get();

			if (stored_note->id() == note_id) {
				m_notes.erase(iter);
				note_removed = true;
				break;
			}
		}
		assert(note_removed); // post-condition: if a note wasn't removed we have serious problems.
	}
};


MIN_EXTERNAL(later);
