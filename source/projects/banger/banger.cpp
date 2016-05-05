
#include "c74_min.h"

using namespace c74::min;


class banger : public object {
public:

	inlet	input	= { this, "(toggle) on/off" };
	outlet	output	= { this, "(bang) triggers at randomized interval" };


	banger(atoms args) {
		if (args.size() > 0)
			min = args[0];
		if (args.size() > 1)
			max = args[1];
	}


	~banger() {}


    ATTRIBUTE (min, double, 1.0) {
		if (args[0] < 1.0)
			args[0] = 1.0;
    }
    END


    ATTRIBUTE (max, double, 1.0) {
		if (args[0] < 1.0)
			args[0] = 1.0;
    }
    END


	METHOD (bang) {
		output.send("bang");
	}
	END
};


MIN_EXTERNAL(banger, "banger");
