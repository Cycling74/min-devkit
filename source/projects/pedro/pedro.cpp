/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Andrew Pask, Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"
#include <random>

using namespace c74::min;

class pedro : public object<pedro> {
public:
	
	MIN_DESCRIPTION { "Bang at random intervals." };
	MIN_TAGS		{ "time" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "banger, link.beat, metro, tempo, drunk" };

	inlet	input			{ this, "(toggle) on/off" };
	outlet	bang_out		{ this, "(bang) triggers at according to specified pattern" };
	outlet	interval_out	{ this, "(float) the interval for the current bang" };

	
	timer	metro			{this, MIN_FUNCTION {
		double interval = sequence[index];
		
        interval_out.send(interval);
		bang_out.send("bang");
		
		metro.delay(interval);
        
        index += 1;
    
        if (index == sequence.size())
            index = 0;
		return {};
	}};


	attribute<bool> on { this, "on", false,
		description { "Turn on/off the internal timer." },
		setter { MIN_FUNCTION {
			if (args[0] == true)
				metro.delay(0.0);	// fire the first one straight-away
			else
				metro.stop();
			return args;
		}}
	};
	
	
	message toggle { this, "int", "Turn on/off the internal timer.",
		MIN_FUNCTION {
			on = args[0];
			return {};
		}
	};
	
	
	message dictionary { this, "dictionary", "Use a dictionary to define the pattern of bangs produced.",
		MIN_FUNCTION {
			dict d{ args[0] };

			sequence = d["pattern"];
			return {};
		}
	};


private:
	int		index { 0 };
	atoms	sequence { 250.0, 250.0, 250.0, 250.0, 500.0, 500.0, 500.0, 500.0 };
};

MIN_EXTERNAL(pedro);
