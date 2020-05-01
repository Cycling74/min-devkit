/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2020 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;
using namespace c74::min::ui;

class min_multitouch : public object<min_multitouch>, public ui_operator<140, 24> {
private:
    vector<event> m_events;
	vector<symbol> m_event_phases;

public:
    MIN_DESCRIPTION	{ "Report mouse and multitouch interactions" };
    MIN_TAGS		{ "ui, multitouch" }; // if multitouch tag is defined then multitouch is supported but mousedragdelta is not supported
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "mousestate" };

    inlet<>     m_input         { this, "(anything) ignored" };
    outlet<>    m_outlet_main   { this, "primary stuff: type phase x y modifiers"};
    outlet<>    m_outlet_pen    { this, "pen data: pressure orientation rotation tilt_x tilt_y"};
    outlet<>    m_outlet_index  { this, "int with index of the touch, not useful for mouse or pen"};

    min_multitouch(const atoms& args = {})
    : ui_operator::ui_operator {this, args} {}


    void send(symbol message_name, const event& e) {
        m_outlet_index.send( e.index() );

        if (e.type() == event::input_type::pen)
			m_outlet_pen.send(e.pen_pressure(), e.pen_orientation(), e.pen_rotation(), e.pen_tilt_x(), e.pen_tilt_y());
		else
			m_outlet_pen.send(0.0, 0.0, 0.0, 0.0, 0.0);

        symbol event_type;
        if (e.type() == event::input_type::mouse)
            event_type = c74::max::gensym("mouse");
		else if (e.type() == event::input_type::touch)
            event_type = c74::max::gensym("touch");
        else
            event_type = c74::max::gensym("pen");
        m_outlet_main.send(message_name, event_type, e.x(), e.y(), e.is_command_key_down(), e.is_shift_key_down());

        m_events.push_back(e);
		m_event_phases.push_back(message_name);
		redraw();
    }


    message<> m_clear{ this, "clear", 
        MIN_FUNCTION {
            m_events.clear();
        	redraw();
            return {};
        }
	};


    message<> m_mouseenter { this, "mouseenter",
        MIN_FUNCTION {
            send("enter", args);
            return {};
        }
    };

    message<> m_mousemove { this, "mousemove",
        MIN_FUNCTION {
            send("move", args);
            return {};
        }
    };

    message<> m_mouseleave { this, "mouseleave", 
        MIN_FUNCTION {
            send("leave", args);
            return {};
        }
    };

    message<> m_mousedown { this, "mousedown", MIN_FUNCTION {
            send("down", args);           
            return {};
        }
    };

    message<> m_mouseup { this, "mouseup",
        MIN_FUNCTION {
            send("up", args);
            return {};
        }
    };

    message<> m_mousedragdelta { this, "mousedrag",
        MIN_FUNCTION {
            send("drag", args);
            return {};
        }
    };


    message<> m_paint { this, "paint",
        MIN_FUNCTION {
            target t { args };

            rect<fill> {	// background
                t,
                color { 0.2, 0.2, 0.2, 1.0 }
            };

			for (auto i = 0; i < m_events.size(); ++i) {
				const auto& e {m_events[i]};
				const auto& phase { m_event_phases[i]};

                bool permanent = (phase == "drag") || (phase == "down") || (phase == "up");
				number brightness = permanent ? 0.8 : 1.0;

                number radius;
                if (e.type() == event::input_type::touch)
                    radius = 50;
                else if (e.type() == event::input_type::pen)
                    radius = 10;
                else // input_type::mouse
                    radius = 5;
                
                color c {brightness, 0.2, 0.2, 1.0};
				if (e.index() == 1)
					c = {0.2, brightness, 0.2, 1.0};
				else if (e.index() == 2)
					c = {0.2, 0.2, brightness, 1.0};
				else if (e.index() == 3)
					c = {brightness, 0.2, brightness, 1.0};
				else if (e.index() == 4)
					c = {0.2, brightness, brightness, 1.0};
				else if (e.index() == 5)
					c = {brightness, brightness, 0.2, 1.0};

                ellipse<fill> {
                    t,
                    color { c },
                    position { e.x() - radius, e.y() - radius },
                    size { radius * 2, radius * 2 }
                };
            }

            for (auto i = m_events.size(); i > 0; --i) {
				const auto& phase {m_event_phases[i - 1]};
				bool permanent = (phase == "drag") || (phase == "down") || (phase == "up");
				if (!permanent) {
					m_events.erase(m_events.begin() + (i - 1));
					m_event_phases.erase(m_event_phases.begin() + (i - 1));
				}
			}

            return {};
        }
    };

};


MIN_EXTERNAL(min_multitouch);
