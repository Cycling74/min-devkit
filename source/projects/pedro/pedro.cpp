/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Andrew Pask, Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"
#include <random>

using namespace c74::min;


class pedro : public object {
public:

	inlet	input			= { this, "(toggle) on/off" };
	outlet	bang_out		= { this, "(bang) triggers at according to specified pattern" };
	outlet	interval_out	= { this, "(float) the interval for the current bang" };

	pedro(atoms args) {

	}


	~pedro() {}


	CLOCK (metro) {
		double interval = sequence[index];
		
        interval_out.send(interval);
		bang_out.send("bang");
		
		metro.delay(interval);
        
        index += 1;
    
        if (index == sequence.size())
            index = 0;
        
	}
	END





	ATTRIBUTE (on, bool, 0) {
		if (args[0] == true)
			metro.delay(0.0);	// fire the first one straight-away
		else
			metro.stop();
	}
	END
	
	
	METHOD (toggle) {			// toggle method defines an "int" input but with special metadata
		on = args[0];
	}
	END
	
	
	METHOD (dictionary) {
		dict d = args[0];
		sequence = d["pattern"];
	}
	END
	

private:

    int index = 0;
	atoms sequence = { 250.0, 250.0, 250.0, 250.0, 500.0, 500.0, 500.0, 500.0 };
};


MIN_EXTERNAL(pedro);
