#include "c74_min.h"

using namespace c74::min;

class slide : public audio_object {
public:
	
	inlet	input				= { this, "(signal) Input" };
	inlet	slide_up_inlet		= { this, "(float) Slide up" };
	inlet	slide_down_inlet	= { this, "(float) Slide down" };
	outlet	output				= { this, "(signal) Output", "signal" };
	
	
	slide(atoms args) {
		if (args.size() > 0)
			slide_up = args[0];
		if (args.size() > 1)
			slide_down = args[1];
	}
	
	
	~slide() {}
	
	
	/// The 'number' method is called for both ints and floats coming into the object
	METHOD (number) {
		switch (current_inlet()) {
			case 1:
				slide_up = args[0];
				break;
			case 2:
				slide_down = args[0];
				break;
			default:
				y_1 = args[0];
				break;
		}
		y_1 = args[0];
	}
	END


	/// Clear sample memory, e.g. to recover from a blowup
	METHOD (reset) {
		y_1 = 0.0;
	}
	END


	/// Attributes are given a name, a type, a default value, and function to be called when setting the value
	ATTRIBUTE (slide_up, double, 1.0) {
		double n = args[0];
		
		if (n < 0)
			n *= -1.0;
		if (n < 1.0)
			n = 1.0;
		
		args[0] = n;
		up = 1.0 / n;
	}
	END


	/// The optional function is executed prior to assigning the args to slide_down so it can be used for range checking.
	ATTRIBUTE (slide_down, double, 1.0) {
		double n = args[0];
		
		if (n < 0)
			n *= -1.0;
		if (n < 1.0)
			n = 1.0;

		args[0] = n;
		down = 1.0 / n;
	}
	END


	/// The 'perform' function is called at each signal vector when the audio signal chain is running
	/// Note: this is not exposed as a METHOD
	void perform(audio_bundle input, audio_bundle output) {
		auto	in = input.samples[0];
		auto	out = output.samples[0];
		auto	up_ = up;
		auto	down_ = down;
		double	y0;
		auto	y1 = y_1;
		
		for (auto i=0; i<input.frame_count; ++i) {
			double x0 = in[i];
			
			if (x0 > y1)
				y0 = y1 + ((x0 - y1) * up_);
			else
				y0 = y1 + ((x0 - y1) * down_);
			out[i] = y1 = y0;
		}
		y_1 = y0;
	}


private:
	double up;			// one over the number of samples up time
	double down;		// one over the number of samples decay time
	double y_1 = 0.0;	// the current output sample.
};


MIN_EXTERNAL(slide, "slide~");
