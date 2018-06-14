/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "signal_routing_objects.h"


lookup_tables g_tables;


lookup_tables::lookup_tables() {
	linear.resize(size);
	equal_power.resize(size);
	sqrt.resize(size);

	for (auto i = 0; i < size; ++i) {
		double normalized_index = static_cast<double>(i) / (size - 1);

		linear[i]      = normalized_index;
		equal_power[i] = std::sin(normalized_index * M_PI_2);
		sqrt[i]        = std::sqrt(normalized_index);
	}
}


lookup_table* lookup_tables::get(const symbol& name) {
	if (name == shapes::equal_power)
		return &equal_power;
	else if (name == shapes::square_root)
		return &sqrt;
	else
		return &linear;
}
