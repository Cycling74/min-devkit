/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Andrew Pask, Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


class banger : public object<banger> {
public:

	inlet	input			= { this, "(toggle) on/off" };
	outlet	bang_out		= { this, "(bang) triggers at randomized interval" };
	outlet	interval_out	= { this, "(float) the interval for the current bang" };

	banger(const atoms& args = {}) {
		if (args.size() > 0)
			min = args[0];
		if (args.size() > 1)
			max = args[1];
	}


	timer metro = { this, MIN_FUNCTION {
		auto interval = math::random(min, max);
		
		interval_out.send(interval);
		bang_out.send("bang");
		
		metro.delay(interval);
		return {};
	}};


	/// Attributes are given a name, a type, a default value, and function to be called when setting the value
	attribute<double> min = { this, "min", 250.0,
		setter { MIN_FUNCTION {
			double value = args[0];
			
			if (value < 1.0)
				value = 1.0;
			return {value};
		}}
	};


	/// The returned atoms from the function are what will actually be assigned to the variable
	attribute<double> max = { this, "max", 1500.0,
		setter { MIN_FUNCTION {
			double value = args[0];
			
			if (value < 1.0)
				value = 1.0;
			return {value};
		}}
	};


	/// The optional function is executed prior to assigning the args to slide_down so it can be used for range checking.
	attribute<bool> on = {this, "on", false,
		setter { MIN_FUNCTION {
			if (args[0] == true)
				metro.delay(0.0);	// fire the first one straight-away
			else
				metro.stop();
			return args;
		}}
	};
	
	
	/// toggle method defines an "int" input but with special metadata
	method toggle = { this, "toggle", MIN_FUNCTION {
		on = args[0];
		return {};
	}};
		
};


MIN_EXTERNAL(banger);
