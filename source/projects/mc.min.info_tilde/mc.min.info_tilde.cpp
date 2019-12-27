/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;


class mc_info_tilde : public object<mc_info_tilde>, public mc_operator<> {
public:
    MIN_DESCRIPTION		{ "Analyze a multi-channel signal. "
                          "[mc.min.info~] provides information about what is happening in the multi-channel signal "
                          "with sample accuracy." };
    MIN_TAGS			{ "analysis" };
    MIN_AUTHOR			{ "Timothy Place" };
    MIN_RELATED			{ "info~, jit.fpsgui~, mc.channelcount~" };

    inlet<>  m_inlet 			{ this, "(multichannelsignal) input to be investigated" };
    outlet<> m_outlet_chans		{ this, "(signal) channel count", "signal", };
    outlet<> m_outlet_low_n		{ this, "(signal) signal with the lowest value", "signal", };
    outlet<> m_outlet_high_n	{ this, "(signal) signal with the highest value", "signal" };
    outlet<> m_outlet_low		{ this, "(signal) lowest value among the signals", "signal" };
    outlet<> m_outlet_high		{ this, "(signal) highest value among the signals", "signal" };

    void operator()(audio_bundle input, audio_bundle output) {
        auto	out_channels	{ output.samples(0) };
        auto	out_low_n		{ output.samples(1) };
        auto	out_high_n		{ output.samples(2) };
        auto	out_low			{ output.samples(3) };
        auto	out_high		{ output.samples(4) };

        for (auto i = 0; i < input.frame_count(); ++i) {
            sample	low_n	{ -1 };
            sample	high_n	{ -1 };
            sample	low		{ std::numeric_limits<sample>::max() };
            sample	high	{ -std::numeric_limits<sample>::max() };

            for (auto channel = 0; channel < input.channel_count(); ++channel) {
                auto in { input.samples(channel)[i] };

                if (in > high) {
                    high = in;
                    high_n = channel;
                }
                if (in < low) {
                    low = in;
                    low_n = channel;
                }
            }

            out_channels[i] = input.channel_count();
            out_low_n[i] = low_n;
            out_high_n[i] = high_n;
            out_low[i] = low;
            out_high[i] = high;
        }
    }

};

MIN_EXTERNAL(mc_info_tilde);
