
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

		if (current_inlet() == 0) {
			dict_merged = dict_right;
			dict_merged.copyunique(d);
			bang();
		}
		else {
			dict_right = d;
		}
		
		dict_merged.touch();
	}
	END
	
	
private:
	dict	dict_right = { symbol(true) };
	dict	dict_merged = { symbol(true) };
};


MIN_EXTERNAL(dict_joiner, "dict.joiner");
