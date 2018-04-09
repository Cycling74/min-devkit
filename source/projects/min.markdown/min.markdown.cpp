/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"
#include <regex>
#include "hoedown/src/html.h"
#include "hoedown/src/document.h"

using namespace c74::min;


class markdown : public object<markdown> {
public:

	MIN_DESCRIPTION { "Get the approximate value of pi." };
	MIN_TAGS		{ "math" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "sin, cos, atan~, jit.op, gen~" };

	inlet<>		input	{ this, "(bang) get the approximate value of pi" };
	outlet<>	output	{ this, "(number) approximate value of pi" };


	message<> read { this, "read", "Markdown file to read",
		MIN_FUNCTION {
			try {
				path				p			{ args };
				std::ifstream		in			{ p };
				std::string			s 			{ std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>() };
				hoedown_renderer* 	renderer	{ hoedown_html_renderer_new(static_cast<hoedown_html_flags>(0), 16) };
				hoedown_buffer* 	buffer		{ hoedown_buffer_new(100) };

				static const std::size_t nesting_depth = 16;
				int extensions = HOEDOWN_EXT_FENCED_CODE;
				auto document = hoedown_document_new(renderer, static_cast<hoedown_extensions>(extensions), nesting_depth);

				hoedown_document_render(document, buffer, reinterpret_cast<const uint8_t*>(&s[0]), s.size());

				string		out { hoedown_buffer_cstr(buffer) };
				std::regex	rex { "\\\"" };
				string 		out2 { std::regex_replace(out, rex, "'") };
				std::regex	rex2 { "src=\"" };
				string 		out3 { std::regex_replace(out2, rex2, "src='") };

				std::regex	rexp { "<p>" };
				string 		out4 { std::regex_replace(out3, rexp, "<br/>") };
				std::regex	rexp2 { "</p>" };
				string 		out5 { std::regex_replace(out4, rexp2, "<br/>") };

				auto		maxstring { c74::max::string_new(out5.c_str()) };
				atom		a { maxstring };

				output.send("set", a);

				object_free(maxstring);
				hoedown_buffer_free(buffer);
				hoedown_html_renderer_free(renderer);
			}
			catch (...) {
				cerr << "Could not read file" << endl;
			}

			return {};
		}
	};

};

MIN_EXTERNAL(markdown);
