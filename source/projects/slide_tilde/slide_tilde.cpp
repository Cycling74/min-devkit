#include "c74_min.h"

using namespace c74::min;

class slide : public audio_object {
public:
	
	INLET  (input, "(signal) Input");
	INLET  (frequency_control, "(float) Slide up");
	INLET  (resonance_control, "(float) Slide down");
	OUTLET (output, "(signal) Output", "signal");
	
	
	slide(atoms args) {
		if (args.size() > 0)
			slide_up = args[0];
		if (args.size() > 1)
			slide_down = args[1];
	}
	
	
	~slide() {}
	
	
	METHOD (number) {						// The 'number' method sets up bindings for both ints and floats/doubles
		switch (current_inlet()) {
			case 1:
				slide_up = args[0];
				break;
			case 2:
				slide_down = args[0];
				break;
			default:
				cur = args[0];
				break;
		}
		cur = args[0];
	}
	END


	METHOD (reset) { cur = 0.0; }};


	ATTRIBUTE (slide_up, double, 1.0) {		// Attributes are given a name, a type, a default value, and function to be called when setting the value
		double n = args[0];
		
		if (n < 0)
			n *= -1.0;
		if (n < 1.0)
			n = 1.0;
		
		args[0] = n;
		up = 1.0 / n;
	}
	END


	ATTRIBUTE (slide_down, double, 1.0) {	// The optional function is executed prior to assigning the args to slide_down so it can be used for range checking.
		double n = args[0];
		
		if (n < 0)
			n *= -1.0;
		if (n < 1.0)
			n = 1.0;

		args[0] = n;
		down = 1.0 / n;
	}
	END


	void perform(audio_bundle input, audio_bundle output) {
		double*	in = input.samples[0];
		double*	out = output.samples[0];
		int		n = input.frame_count;
		double	up_ = up;
		double	down_ = down;
		double	x0;
		double	y0;
		double	y1 = cur;
		
		while (n--) {
			x0 = *in++;
			if (x0 > y1)
				y0 = y1 + ((x0 - y1) * up_);
			else
				y0 = y1 + ((x0 - y1) * down_);
			*out++ = y1 = y0;
		}
		cur = y0;
	}


private:
	double up;			// one over the number of samples up time
	double down;		// one over the number of samples decay time
	double cur = 0.0;	// the current output sample.
};


MIN_EXTERNAL(slide, "slide~");
