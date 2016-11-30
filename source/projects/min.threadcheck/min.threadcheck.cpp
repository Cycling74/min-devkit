/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"
#include <random>

using namespace c74::min;

class threadcheck : public object<threadcheck> {
public:

	MIN_DESCRIPTION { "Report the thread of execution for a message." };
	MIN_TAGS		{ "developer" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "dspstress~" };

	inlet<>		input			{ this, "(anything) message to check" };
	outlet<>	outlet_main		{ this, "(bang) message received on main thread" };
	outlet<>	outlet_sched	{ this, "(bang) message received on scheduler thread" };
	outlet<>	outlet_audio	{ this, "(bang) message received on audio thread" };
	outlet<>	outlet_other	{ this, "(bang) message received on unknown thread" };

	c74::min::function check = MIN_FUNCTION {
		 // check scheduler last because it might be running in main or audio threads depending on settings
		if ( c74::max::systhread_ismainthread() )			outlet_main.send(k_sym_bang);
		else if ( c74::max::systhread_isaudiothread() )		outlet_audio.send(k_sym_bang);
		else if ( c74::max::systhread_istimerthread() )		outlet_sched.send(k_sym_bang);
		else												outlet_other.send(k_sym_bang);
		return {};
	};

	message<threadsafe::yes> list		{ this, "list",		"Message to check.", check };
	message<threadsafe::yes> anything	{ this, "anything",	"Message to check.", check };
	message<threadsafe::yes> number		{ this, "number",	"Message to check.", check };
	message<threadsafe::yes> bang		{ this, "bang",		"Message to check.", check };
};

MIN_EXTERNAL(threadcheck);
