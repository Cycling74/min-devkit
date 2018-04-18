/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;
using namespace c74::min::ui;

class min_textslider : public object<min_textslider>, public ui_operator<140,24> {
public:

	MIN_DESCRIPTION { "Display a text label" };
	MIN_TAGS		{ "ui" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "comment, umenu, textbutton" };
	
	inlet<>	input	{ this, "(number) value to set" };
	outlet<> output	{ this, "(number) value" };


	min_textslider(const atoms& args = {})
	: ui_operator::ui_operator { this, args }
	{}


	message<> m_number { this, "number",
		MIN_FUNCTION {
			set(args);
			bang();
			return {};
		}
	};


	message<> set { this, "set",
		MIN_FUNCTION {
			m_unclipped_value = args[0];
			m_value = MIN_CLAMP(m_unclipped_value, m_range[0], m_range[1]);
			bool showvalue = m_showvalue;

			if (showvalue && m_mouseover)
				update_text();
			else
				redraw();
			return {};
		}
	};


	message<> bang { this, "bang",
		MIN_FUNCTION {
			output.send(m_unclipped_value);
			return {};
		}
	};


	message<> m_notify { this, "notify",
		MIN_FUNCTION {
			symbol	s = args[1];
			symbol	msg = args[2];
			void*	sender = args[3];
			void*	data = args[4];

			if (sender == maxobj() && msg == "attr_modified") {
				update_text();
				redraw();
			}

			// TODO: the following should be baked-in for ui operators
			return { c74::max::jbox_notify((c74::max::t_jbox*)maxobj(), s, msg, sender, data) };
		}
	};


	attribute<number>	m_default	{ this, "defaultvalue", 0.0 };
	attribute<numbers>	m_range		{ this, "range", {{0.0, 1.0}},
		setter { MIN_FUNCTION {
			number low	{ args[0] };
			number high	{ args[1] };
			m_range_delta = high - low;
			return args;
		}}
	};
	attribute<numbers>	m_offset	{ this, "offset", {{10.0, 10.0}} };
	attribute<symbol>	m_label		{ this, "label", "" };
	attribute<symbol>	m_unit		{ this, "unit", "" };
	attribute<symbol>	m_fontname	{ this, "fontname", "lato-light" };
	attribute<number>	m_fontsize	{ this, "fontsize", 14.0 };
	attribute<bool>		m_showvalue	{ this, "showvalue", true };
	attribute<bool>		m_clickjump	{ this, "clickjump", true };

	enum class tracking {
		horizontal,
		vertical,
		both,
		enum_count
	};

	enum_map tracking_info = {
		"horizontal",
		"vertical",
		"both"
	};

	attribute<tracking> m_tracking { this, "tracking", tracking::horizontal, tracking_info,
		description { "Mouse tracking direction." }
	};


	attribute<color>	m_bgcolor		{ this, "bgcolor", color::black, title {"Background Color"} };
	attribute<color>	m_elementcolor	{ this, "elementcolor", color::white };
	attribute<color>	m_knobcolor		{ this, "knobcolor", color::gray, title {"Knob Color"} };


	message<> mouseenter { this, "mouseenter",
		MIN_FUNCTION {
			m_mouseover = true;
			if (m_showvalue)
				update_text();
			return {};
		}
	};

	message<> mouseleave { this, "mouseleave",
		MIN_FUNCTION {
			m_mouseover = false;
			if (m_showvalue)
				update_text();
			return {};
		}
	};

	message<> mousedown { this, "mousedown",
		MIN_FUNCTION {
			ui::target	t { args };
			number		x { args[2] };
			number		y { args[3] };
			int			modifiers { args[4] };

			// cache mouse position so we can restore it after we are done
			m_mouse_position[0] = t.x() + x;
			m_mouse_position[1] = t.y() + y;

			// Jump to new value on mouse down?
			if (m_clickjump) {
				auto delta = MIN_CLAMP((x - 1.0), 0.0, t.width() - 3.0);		// substract for borders
				delta = delta / (t.width() - 2.0) * m_range_delta + m_range[0];
				if (modifiers & c74::max::eCommandKey)
					m_number(static_cast<int>(delta));							//when command-key pressed, jump to the nearest integer-value
				else
					m_number(delta);											// otherwise jump to a float value
			}

			m_anchor = m_value;
//			c74::max::jbox_set_mousedragdelta(maxobj(), 1);
			return {};
		}
	};

	message<> mouseup { this, "mouseup",
		MIN_FUNCTION {
			ui::target	t { args };

			// restore mouse position
			c74::max::jmouse_setposition_view(args[1],
									t.x() + ((m_value - m_range[0]) / m_range_delta) * (t.width() - 2.0) + 1.0,
									m_mouse_position[1]);
			redraw();
			return {};
		}
	};

	message<> mousedragdelta { this, "mousedragdelta",
		MIN_FUNCTION {
			ui::target	t { args };
			number		x { args[2] };
			number		y { args[3] };
			int			modifiers { args[4] };
			number		factor { t.width() - 2.0 };	// how much precision (vs. immediacy) you have when dragging the knob
			number		delta;

			if (modifiers & c74::max::eCommandKey)
				factor = factor * 0.8;
			else if (modifiers & c74::max::eShiftKey)
				factor = factor * 50.0;
			factor = factor / m_range_delta;

			if (m_tracking == tracking::horizontal)
				delta = x;
			else if (m_tracking == tracking::vertical)
				delta = -y;
			else {						//  tracking::both
				if (fabs(x) > fabs(y))
					delta = x;
				else
					delta = -y;
			}

			m_anchor += delta / factor;
			m_anchor = MIN_CLAMP(m_anchor, m_range[0], m_range[1]);

			if (modifiers & c74::max::eCommandKey)
				m_number(static_cast<int>(m_anchor)); //a change in integer-steps
			else
				m_number(m_anchor);

			return {};
		}
	};

	message<> mousedoubleclick { this, "mousedoubleclick",
		MIN_FUNCTION {
			number val = m_default;
			m_number(val);
			m_anchor = val;
			return {};
		}
	};


	message<> paint { this, "paint",
		MIN_FUNCTION {
			using namespace ui;

			target t { args };




			// ALL STYLE-AWARE ATTRS MUST BE UPDATED HERE
			// TODO: BAKE THIS INTO THE WRAPPER OF THE PAINT METHOD!
			c74::max::t_jrgba elemcolor {};
			c74::max::object_attr_getjrgba(*this, symbol("elementcolor"), &elemcolor);

			long ac {};
			c74::max::t_atom* av {};
			c74::max::object_attr_getvalueof(*this, symbol("elementcolor"), &ac, &av);
			// TODO: need to free av?
			atoms a {av+0,av+1,av+2,av+3};
			m_elementcolor.set (a);

			c74::max::object_attr_getvalueof(*this, symbol("bgcolor"), &ac, &av);
			// TODO: need to free av?
			a = {av+0,av+1,av+2,av+3};
			m_bgcolor.set (a);





			

			auto value = (m_value - m_range[0]) / (m_range[1] - m_range[0]);
			auto pos =  ((t.width()-3) * value) + 1;	// one pixel for each border and -1 for counting to N-1

			rect<fill> {			// background
				t,
				color { m_bgcolor }
			};

			rect<> {				// frame
				t,
				color { {0.3, 0.3, 0.3, 1.0} },
				line_width { 3.0 }
			};

			rect<fill> {			// active part of the slider
				t,
				color { m_elementcolor },
				position { 1.0, 1.0 },
				size { pos, -2.0 }
			};

			rect<fill> {			// slider knob
				t,
				color { m_knobcolor },
				position { pos, 1.0 },
				size { 4.0, -2.0 }
			};

			text {					// text display
				t,
				color { color::white },
				position { m_offset[0], m_offset[1] + m_fontsize*0.5 },
				fontface { m_fontname },
				fontsize { m_fontsize },
				content { m_text }
			};

			return {};
		}
	};

private:
	number	m_unclipped_value {0.0};
	number	m_value;
	number	m_anchor;
	string	m_text;
	bool	m_mouseover {};
	number	m_mouse_position[2];
	number	m_range_delta {1.0};

	void update_text() {
		if (m_mouseover && m_showvalue) {
			symbol unit = m_unit;
			m_text = std::to_string(m_unclipped_value);
			if (string::npos == m_text.find('+', 0)) { // don't mangle scientific notation
				auto c = m_text.find('.');
				if (c > 0)
					m_text.resize(c+2);
			}
			m_text += " ";
			m_text += unit.c_str();
		}
		else {
			symbol label = m_label;
			m_text = label.c_str();
		}
		redraw();
	}
};


MIN_EXTERNAL(min_textslider);
