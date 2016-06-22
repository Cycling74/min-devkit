/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class buffer_index : public object<buffer_index>, perform_operator {
public:
	
	inlet				index_inlet		= { this, "(signal) Sample index" };
	inlet				channel_inlet	= { this, "(float) Audio channel to use from buffer~" };
	outlet				output			= { this, "(signal) Sample value at index", "signal" };
	buffer_reference	buffer			= { this };
	
	
	buffer_index(atoms args) {
		if (args.size() > 0)
			buffer.set(args[0]);
		if (args.size() > 1)
			channel = args[1];
	}
	
	
	~buffer_index() {}
	

	ATTRIBUTE (channel, int, 1) {
		int n = args[0];
		if (n < 1)
			n = 1;
		args[0] = n;
	}
	END


	void perform(audio_bundle input, audio_bundle output) {
		auto		in = input.samples[0];
		auto		out = output.samples[0];
		buffer_lock	b(buffer);
		auto		chan = std::min<int>(channel-1, b.channelcount());
		
		if (b.valid()) {
			for (auto i=0; i<input.frame_count; ++i) {
				auto frame = in[i] + 0.5;
				out[i] = b.lookup(frame, chan);
			}
		}
		else {
			for (auto i=0; i<input.frame_count; ++i)
				out[i] = 0.0;
		}
	}
	
};


MIN_EXTERNAL(buffer_index);
