/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class lores : public object, perform_operator {
public:
	
	inlet	input				= { this, "(signal) Input" };
	inlet	frequency_control	= { this, "(signal/float) Cutoff Frequency" };
	inlet	resonance_control	= { this, "(signal/float) Resonance Control (0-1)" };
	outlet	output				= { this, "(signal) Output", "signal" };

	
	lores(atoms args) {
		if (args.size() > 0)
			frequency = args[0];
		if (args.size() > 1)
			resonance = args[1];
		calculate_coefficients();
	}
	
	
	~lores() {}
	
	
	/// The 'number' method is called for both ints and floats coming into the object
	METHOD (number) {
		if (current_inlet() == 1) {
			frequency = args[0];
			calculate_coefficients();
		}
		else if (current_inlet() == 2) {
			resonance = args[0];
			calculate_coefficients();
		}
	}
	END


	/// Clear sample memory, e.g. to recover from a blowup
	METHOD (clear) { y_1 = y_2 = 0.0; } END


	/// The 'dspsetup' method is called any time the audio signal chain is re-compiled
	METHOD (dspsetup) {
		double samplerate = args[0];
		
		two_pi_over_sr = M_2_PI / samplerate;
		calculate_coefficients();
		clear();
	}
	END


	/// The 'perform' function is called at each signal vector when the audio signal chain is running
	/// Note: this is not exposed as a METHOD
	void perform(audio_bundle input, audio_bundle output) {
		auto in = input.samples[0];
		auto out = output.samples[0];
		auto freq = inlets[1]->has_signal_connection() ? input.samples[1][0] : frequency;
		auto reso = inlets[2]->has_signal_connection() ? input.samples[2][0] : resonance;
		
		// do we need to recompute coefficients?
		if (freq != frequency || reso != resonance)	{
			frequency = freq;
			resonance = reso;
			calculate_coefficients();
		}

		// cache vars locally for performance
		auto a1 = a_1;
		auto a2 = a_2;
		auto y1 = y_1;
		auto y2 = y_2;
		auto scale = 1.0 + a1 + a2;
		
		for (auto i=0; i<input.frame_count; ++i) {
			auto temp = y1;
			y1 = scale * in[i] - a1 * y1 - a2 * y2;
			y2 = temp;
			out[i] = y1;
		}
		
		// update state with cached vars before returning
		y_1 = y1;
		y_2 = y2;
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
	void calculate_coefficients() {
		resonance = c74::max::clamp(resonance, 0.0, 1.0 - 1E-20);
		double resterm = exp(resonance * 0.125) * 0.882497;
		a_1 = -2. * resterm * cos(two_pi_over_sr * frequency);
		a_2 = resterm * resterm;
	}

};

MIN_EXTERNAL(lores);
