
#include "c74_min.h"

using namespace c74::min;


class banger : public object {
public:
	
	inlet	left	= { this, "input on off and range attrs",	"" };
	outlet	output	= { this, "random bangs",		"" };
	
	
	banger(atoms args) {
        
        if (args.size() > 0)
            min = args[0];
        if (args.size() > 1)
            max = args[1];

	}
	
	
	~banger() {}
    
    
    ATTRIBUTE (min, double, 1.0) {
        double n = args[0];
        
        if (n < 0)
            n *= -1.0;
        if (n < 1.0)
            n = 1.0;
        
        args[0] = n;

    }
    END
    
    ATTRIBUTE (max, double, 1.0) {
        double n = args[0];
        
        if (n < 0)
            n *= -1.0;
        if (n < 1.0)
            n = 1.0;
        
        args[0] = n;

    }
    END
    
    
	
	
	METHOD (bang) {
		output.send("bang");
	}
	END
	
	

	
	
private:
	//dict	dict_right = { symbol(true) };
	//dict	dict_merged = { symbol(true) };
};


MIN_EXTERNAL(banger, "banger");
