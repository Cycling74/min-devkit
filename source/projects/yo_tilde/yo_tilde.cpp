/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Andrew Benson
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;

class yo : public object<yo>, perform_operator {
public:
	
	inlet	freq_control	= { this, "(signal)/float Frequency" };
	inlet	max_control		= { this, "(signal/float) Ramp Maximum" };
    inlet   offset_control	= { this, "(signal/float) Offset" };
    outlet	output			= { this, "(signal) Output", "signal" };
    outlet  ramp            = { this, "(signal) Normalized Ramp", "signal" };

	
	yo (atoms args) {
		if (args.size() > 0)
			frequency = args[0];
		if (args.size() > 1)
			max_val = args[1];
        if (args.size() > 2)
            off_val = args[2];
        }
	
	~yo() {}
	
	
	/// The 'number' method is called for both ints and floats coming into the object
	METHOD (number) {
		switch (current_inlet()) {
			case 0: frequency = args[0];			break;
			case 1: max_val = fmax(args[0],0.0);	break;
			case 2: off_val = args[2];				break;
		}
	}
	END


	/// The 'dspsetup' method is called any time the audio signal chain is re-compiled
	METHOD (dspsetup) {
        samplerate = args[0];
	}
	END


	/// The 'perform' function is called at each signal vector when the audio signal chain is running
	/// Note: this is not exposed as a METHOD
	void perform(audio_bundle input, audio_bundle output) {
        auto freq = freq_control.has_signal_connection() ? input.samples[0][0] : frequency;
		auto out = output.samples[0];
        auto rmp = output.samples[1];
		auto maxi = max_control.has_signal_connection() ? fmax(input.samples[1][0],0.0) : max_val;
        auto offi = offset_control.has_signal_connection() ? fmax(input.samples[2][0],0.0) : off_val;


		// cache vars locally for performance
		auto fstep = freq / samplerate;
        bool siginput1 = freq_control.has_signal_connection();
        bool siginput2 = max_control.has_signal_connection();
        bool siginput3 = offset_control.has_signal_connection();
        auto current = y_1;
		
		for (auto i=0; i<input.frame_count; ++i) {
            if(siginput1){
                freq = input.samples[0][i];
                fstep = freq/samplerate;
            }
            if(siginput2) maxi = fmax(input.samples[1][i],0.0);
            //if(siginput3) offi = fmax(input.samples[2][i],0.0);
            current += fstep;
            if (maxi == 0) current = 0.0;
            else if (fstep >= 0){
                if (current>maxi){
                    while(current>maxi) {current-=maxi;};
                    if(siginput3) offi = fmax(input.samples[2][i],0.0);
                }
            }
            else if (current<0.0) while (current<0.0) {current+=maxi;};
            
            out[i] = current+offi;
            rmp[i] = current/maxi;
		}
		
		// update state with cached vars before returning
		y_1 = current;
        max_val = maxi;
        off_val = offi;
	}


private:
	double frequency = 0.0;		// stored frequency in Hz
    double max_val = 1.0;       // maximum value of ramp
    double off_val = 0.0;       // offset value
    double y_1;					// previous output sample
    double samplerate = 0.0;


};

MIN_EXTERNAL(yo);
