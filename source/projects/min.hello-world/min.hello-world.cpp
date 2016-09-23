/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class hello_world : public object<hello_world> {
public:

	MIN_DESCRIPTION { "Post to the Max Console." };
	MIN_TAGS		{ "utilities" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "print, jit.print, dict.print" };
	
	inlet	input	{ this, "(bang) post greeting to the max console" };
	outlet	output	{ this, "(anything) output the message which is posted to the max console" };


	// post to max window == but only when the class is loaded the first time
	message maxclass_setup { this, "maxclass_setup",
		MIN_FUNCTION {
			cout << "hello world" << endl;
			return {};
		}
	};


	// define an optional argument for setting the message
	argument<number> greeting_arg	{ this, "greeting", "Initial value for the greeting attribute.",
		MIN_ARGUMENT_FUNCTION {
			greeting = arg;
		}
	};


	// the actual attribute for the message
	attribute<symbol> greeting { this, "greeting", "hello world",
		description {
			"Greeting to be posted. "
			"The greeting will be posted to the Max console when a bang is received."
		},
	};


	// respond to the bang message to do something
	message bang { this, "bang", "Post the greeting.",
		MIN_FUNCTION {
			symbol the_greeting = greeting; // fetch the symbol itself from the attribute named greeting

			cout << the_greeting << endl;	// post to the max console
			output.send(the_greeting);		// send out our outlet
			return {};
		}
	};

};


MIN_EXTERNAL(hello_world);
