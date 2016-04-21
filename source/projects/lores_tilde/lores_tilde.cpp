#include "c74_min.h"

using namespace c74::min;

class lores : public audio_object {
public:
	
	INLET  (input, "(signal) Input");
	INLET  (frequency_control, "(signal/float) Cutoff Frequency");
	INLET  (resonance_control, "(signal/float) Resonance Control (0-1)");
	OUTLET (output, "(signal) Output", "signal");
	
	
	lores(atoms args) {
		if (args.size() > 0)
			frequency = args[0];
		if (args.size() > 1)
			resonance = args[1];
		calc();
	}
	
	
	~lores() {}
	
	
	METHOD (number) {
		if (current_inlet() == 1) {
			frequency = args[0];
			calc();
		}
		else if (current_inlet() == 2) {
			resonance = args[0];
			calc();
		}
	}
	END


	METHOD (clear) { y_1 = y_2 = 0.0; } END			// clear sample memory to recover from blowup


	METHOD (dspsetup) {
		double samplerate = args[0];
		
		two_pi_over_sr = M_2_PI / samplerate;
		calc();
		clear();
	}
	END


	void perform(audio_bundle input, audio_bundle output) {
		double*	in = input.samples[0];
		double*	out = output.samples[0];
		double	freq = inlets[1]->has_signal_connection() ? *input.samples[1] : frequency;
		double	reso = inlets[2]->has_signal_connection() ? *input.samples[2] : resonance;
		int		n = input.frame_count;
		
		if (freq != frequency || reso != resonance)	{	// do we need to recompute coefficients?
			frequency = freq;
			resonance = reso;
			calc();
		}

		double	a1 = a_1;
		double	a2 = a_2;
		double	ym1 = y_1;
		double	ym2 = y_2;
		double	scale = 1.0 + a1 + a2;
		
		while (n--) {
			double val = *in++;
			double temp = ym1;
			ym1 = scale * val - a1 * ym1 - a2 * ym2;
			ym2 = temp;
			*out++ = ym1;
		}
		y_1 = ym1;
		y_2 = ym2;
	}


private:
	double frequency = 0.0;		// stored cutoff frequency in Hz
	double resonance = 0.0;		// stored resonance (0-1)
	double a_1;					// computed coefficient
	double a_2;					// computer coefficient
	double y_1;					// previous output sample
	double y_2;					// previous to previous output sample
	double two_pi_over_sr = M_2_PI / c74::max::sys_getsr();


	// calculate filter coefficients from frequency and resonance
	void calc() {
		resonance = c74::max::clamp(resonance, 0.0, 1.0 - 1E-20);
		double resterm = exp(resonance * 0.125) * 0.882497;
		a_1 = -2. * resterm * cos(two_pi_over_sr * frequency);
		a_2 = resterm * resterm;
	}

};

MIN_EXTERNAL(lores, "lores~");
