/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class stress : public object<stress>, public vector_operator<> {
public:

	MIN_DESCRIPTION { "Eat up a specified percentage of processor time to stress the computer." };
	//MIN_TAGS		{ "analysis" };
	MIN_AUTHOR		{ "Timothy Place, Rob Sussman" };
	//MIN_RELATED		{ "edge~, snapshot~, ==~" };
	
	//inlet<>		input	{ this, "(signal) dummy" };


	attribute<number, threadsafe::yes, limit::clamp> target { this, "target", 0.0,
		range { 0.0, 100.0 },
		description { "Percentage of the CPU to burn." }
	};


	void operator()(audio_bundle input, audio_bundle output) {
		auto	svtime_ms	{ vector_size() / samplerate() * 1000.0 };
		auto	spintime	{ svtime_ms * target / 100.0 };
		auto	intime		{ c74::max::systimer_gettime() };
		auto	outtime		{ intime + spintime };
		size_t	spincount	{};

		while (c74::max::systimer_gettime() < outtime)
			++spincount;
	}
};

MIN_EXTERNAL(stress);
