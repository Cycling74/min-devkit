/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2020 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;
using namespace c74::min::ui;

class min_multitouch : public object<min_multitouch>, public ui_operator<140, 24> {
private:
 //   bool	m_bang_on_change { true };
 //   number	m_unclipped_value { 0.0 };
 //   number	m_anchor;
 //   string	m_text;
 //   bool	m_mouseover {};
 //   number	m_mouse_position[2];
 //   number	m_range_delta { 1.0 };
    vector<event> m_events;

public:
    MIN_DESCRIPTION	{ "Report mouse and multitouch interactions" };
    MIN_TAGS		{ "ui, multitouch" }; // if multitouch tag is defined then multitouch is supported but mousedragdelta is not supported
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "mousestate" };

    inlet<>     m_input         { this, "(anything) ignored" };
    outlet<>    m_outlet_main   { this, "primary stuff: type phase xpos ypos modifiers"};
    outlet<>    m_outlet_extra  { this, "extra info: pressure orientation rotation tiltX tiltY"};
    outlet<>    m_outlet_index  { this, "int with index of the touch, not useful for mouse or pen"};

    min_multitouch(const atoms& args = {})
    : ui_operator::ui_operator {this, args} {}

    void send(symbol message_name, const event& e) {

 //       m_outlet_index.send( e.index );
 //       m_outlet_extra.send(e->pressure, e->orientation, e->rotation, e->tiltX, e->tiltY);

        symbol event_type;
        if (e.type() == event::input_type::mouse)
            event_type = c74::max::gensym("mouse");
		else if (e.type() == event::input_type::touch)
            event_type = c74::max::gensym("touch");
        else
            event_type = c74::max::gensym("pen");

        m_outlet_main.send(message_name, event_type, e.x(), e.y(), e.is_command_key_down(), e.is_shift_key_down());
    }

/*
    message<> m_notify { this, "notify",
        MIN_FUNCTION {
            notification n { args };
            symbol attr_name { n.attr_name() };

            if (attr_name != k_sym__empty) {
 //               if (m_bang_on_change) {
 //                   if (attr_name == k_sym_value)
 //                       bang();
 //               }
                update_text();
                redraw();
            }
            return {};
        }
    };
*/

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
            
  /*          event   e { args };
            auto    t { e.target() };
            auto    x { e.x() };
            auto    y { e.y() };

            // cache mouse position so we can restore it after we are done
            m_mouse_position[0] = t.x() + x;
            m_mouse_position[1] = t.y() + y;

            // Jump to new value on mouse down?
            if (m_clickjump) {
                auto delta = MIN_CLAMP((x - 1.0), 0.0, t.width() - 3.0);    // substract for borders
                delta      = delta / (t.width() - 2.0) * m_range_delta + m_range[0];
                if (e.is_command_key_down())
                    m_number(static_cast<int>(delta));    // when command-key pressed, jump to the nearest integer-value
                else
                    m_number(delta);    // otherwise jump to a float value
            }

            m_anchor = m_value;
    */        return {};
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
  /*          event   e { args };
            auto    x { e.x() };
            auto    y { e.y() };
            number  factor { e.target().width() - 2.0 };    // how much precision (vs. immediacy) you have when dragging the knob
            number  delta;

            if (e.is_command_key_down())
                factor = factor * 0.8;
            else if (e.is_shift_key_down())
                factor = factor * 50.0;
            factor = factor / m_range_delta;

            if (m_tracking == tracking::horizontal)
                delta = x;
            else if (m_tracking == tracking::vertical)
                delta = -y;
            else {    //  tracking::both
                if (fabs(x) > fabs(y))
                    delta = x;
                else
                    delta = -y;
            }

            m_anchor += delta / factor;
            m_anchor = MIN_CLAMP(m_anchor, m_range[0], m_range[1]);

            if (e.is_command_key_down())
                m_number(static_cast<int>(m_anchor));    // a change in integer-steps
            else
                m_number(m_anchor);
*/
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

            for (const auto& e : m_events) {
                number radius;

                if (e.type() == event::input_type::touch)
                    radius = 50;
                else if (e.type() == event::input_type::pen)
                    radius = 10;
                else // input_type::mouse
                    radius = 5;

                ellipse<fill> {
                    t,
                    color { 0.8, 0.2, 0.2, 1.0 },
                    position { e.x() - radius, e.y() - radius },
                    size { radius * 2, radius * 2 }
                };
            }
            return {};
        }
    };

};


MIN_EXTERNAL(min_multitouch);
