
#include "c74_min.h"
#include <random>

using namespace c74::min;


class pedro : public object {
public:

	inlet	input			= { this, "(toggle) on/off" };
	outlet	bang_out		= { this, "(bang) triggers at randomized interval" };
	outlet	interval_out	= { this, "(float) the interval for the current bang" };

	pedro(atoms args) {

	}


	~pedro() {}


	CLOCK (metro) {
		//auto interval = generate_random_number();
        std::vector<float> sequence = {250,250,250,250,500,500,500,500};
        
        interval =sequence[index];

        
		
        interval_out.send(interval);
		bang_out.send("bang");
		
		metro.delay(interval);
        
        index += 1;
    
        if (index == sequence.size())
            index = 0.0;
        
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
	

private:
	


    int index = 0;
    float interval = 0;
		
};


MIN_EXTERNAL(pedro, "pedro");
