/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


class dcblocker : public object<dcblocker>, sample_operator<1,1> {
public:
	MIN_AUTHOR		{	"Cycling '74"		};
	MIN_TAGS		{	"MSP", "Filters"	};
	MIN_DESCRIPTION {	"Filter out DC offset. "
						"The DC offset or <a href='https://en.wikipedia.org/wiki/DC_bias'>DC bias</a>, is removed by applying a first-order highpass filter to the input."
						""
						"This first-order highpass filter algorithm is used pretty much everywhere (STK, ChucK, RTCMix, SuperCollider, Max, Pd, etc),"
						"with the difference equation:"
						""
						"	y(n) = (1 * x(n))  +  (-1 * x(n-1))  -  (-0.9997 * y(n-1))  ,  n = 0, 1, 2, 3, ..."
						""
						"which can be simplified to:"
						""
						"	y(n) = x(n) - x(n-1) + (0.9997 * y(n-1))"
						""
						"and thus characterized by the Z-transform:"
						""
						"	Y(z) = X(z)  -  X(z) * z^(-1)  +  Y(z) * 0.9997 * z^(-1)"
						""
						"meaning the transfer function is:"
						""
						"	H(z) = [1  -  z^(-1)]  /  [1  +  0.9997 * z^(-1)]"
						""
						"and resulting in the frequency response:"
						""
						"	H( e^(i*omega*T) ) = [1  -  e^(-i * omega * T)]  /  [1  +  0.9997 * e^(-i * omega * T)]"
						""
						"where $i$ is the sqrt(-1), e is Euler's log base, T is the sampling interval, and omega is 2*pi*frequency."
						""
						"In Max, it usually shows up simply as [biquad~ 1.0 -1.0 0.0 -0.9997 0.0]."
						"In other places it usually shows up with the feedback coefficient set to -0.995"
						"(e.g in SuperCollider and in [JOS, 2007, pp 273])."
						"The higher coefficient is desirable so as to not attenuate lowish frequencies in the spectrum,"
						"but with the caveat that it also won't respond as quickly to varying amounts DC Offset."
						""
						"The power is attenuated by -3 dB at a normalized frequency of 0.1612 * pi @ 0.9997."
						"At fs=44100 this translates to cf = 22050 * 0.1612 = 3554.46 Hz."
						""
						"The power is attenuated by -3 dB at a normalized frequency of 0.1604 * pi @ 0.995."
						"At fs=44100 this translates to cf = 22050 * 0.1604 = 3536.82 Hz."
						""
						"For reference, in this last case, the power is attenuated by -6 db (magnitude attenuated by -12 dB) @ 0.0798 * pi,"
						"which at fs=44100 translates to 1759.59 Hz."
						""
	};

	inlet	input	{ this, "(signal) Input" };
	outlet	output	{ this, "(signal) Output", "signal" };
	
	
	///	Reset the DC-Blocking filter.
	/// This algorithm uses an IIR filter, meaning that it relies on feedback.
	/// If the filter should not be producing any signal (such as turning audio off and then back on in a host)
	/// or if the feedback has become corrupted (such as might happen if a NaN is fed in)
	/// then it may be neccesary to clear the filter by sending this message.
	
	message clear { this, "clear", MIN_FUNCTION {
		x_1 = y_1 = 0.0;
		return {};
	}};
	
	
	attribute<bool>	bypass { this, "bypass" , false };


	/// Process one sample
	/// Note that we don't worry about denormal values in the feedback because
	/// Max takes care of squashing them for us by setting the FTZ bit on the CPU.

	sample operator()(sample x) {
		if (bypass)
			return x;
		else {
			auto y = x - x_1 + y_1 * 0.9997;
			y_1 = y;
			x_1 = x;
			return y;
		}
	}
	

private:
	sample	x_1 { 0.0 };	///< Input history
	sample	y_1 { 0.0 };	///< Output history
};


MIN_EXTERNAL(dcblocker);
