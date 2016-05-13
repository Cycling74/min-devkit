/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


class dict_joiner : public object {
public:
	
	inlet	left	= { this, "dictionary to combined with dictionary at right inlet",	"" };
	inlet	right	= { this, "dictionary to combined with dictionary at left inlet",	"dictionary" };
	outlet	output	= { this, "dictionary of entries combined from both inlets",		"dictionary" };
	
	
	dict_joiner(atoms args) {
		if (!args.empty())
			dict_right = dict(args);
	}
	
	
	~dict_joiner() {}
	
	
	METHOD (bang) {
		output.send("dictionary", dict_merged.name());
	}
	END
	
	
	METHOD (dictionary) {
		dict d = { args[0] };

		if (!d.valid()) {				// make sure we have a legit dictionary before proceeding
			c74::max::object_error(nullptr, "mf");
			return;
		}
		
		if (current_inlet() == 0) {
			dict_merged = dict_right;	// start with our stored dict contents
			dict_merged.copyunique(d);	// now merge in any keys that are not duplicated in the incoming dict
			bang();						// send the dictionary name out the outlet
			dict_merged.touch();		// notify anything listening remotely (e.g. dict.view objects) that we changed
		}
		else {
			dict_right = d;
		}
		
	}
	END
	
	
private:
	dict	dict_right = { symbol(true) };
	dict	dict_merged = { symbol(true) };
};


MIN_EXTERNAL(dict_joiner);
