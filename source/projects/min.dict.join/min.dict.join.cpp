/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class dict_join : public object<dict_join> {
public:
	
	MIN_DESCRIPTION { "Merge the content of two dictionaries." };
	MIN_TAGS		{ "dictionary" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "min.beat.pattern, dict.join" };

	inlet<>		left	{ this, "dictionary to combined with dictionary at right inlet",	"" };
	inlet<>		right	{ this, "dictionary to combined with dictionary at left inlet",	"dictionary" };
	outlet<>	output	{ this, "dictionary of entries combined from both inlets",		"dictionary" };
	

	argument<anything> name_arg { this, "dictionary-syntax", "Define an initial dictionary for joining." };

	dict_join(const atoms& args = {}) {
		if (!args.empty())
			dict_right = dict(args);

		if (k_sym__pound_d)
			cout << "We were created by Max" << endl;
		else
			cout << "We were not created by Max" << endl;
	}
		
	
	message<> bang { this, "bang", "Resend the most recently combined dictionary",
		MIN_FUNCTION {
			output.send("dictionary", dict_merged.name());
			return {};
		}
	};
	
	
	message<> dictionary { this, "dictionary",
		"Dictionary from the second inlet is combined with the dictionary from the first inlet and a new dictionary is sent",
		MIN_FUNCTION {
			try {
				dict d = { args[0] };
				
				if (inlet == 0) {
					dict_merged = dict_right;	// start with our stored dict contents
					dict_merged.copyunique(d);	// now merge in any keys that are not duplicated in the incoming dict
					bang();						// send the dictionary name out the outlet
					dict_merged.touch();		// notify anything listening remotely (e.g. dict.view objects) that we changed
				}
				else {
					dict_right = d;
				}
			}
			catch (std::runtime_error& e) {
				cerr << e.what() << endl;
			}
			return {};
		}
	};

private:
	dict	dict_right { symbol(true) };
	dict	dict_merged { symbol(true) };
};

MIN_EXTERNAL(dict_join);
