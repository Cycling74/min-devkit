/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2020 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;


class patcher_control : public object<patcher_control> {
public:
    MIN_DESCRIPTION	{ "Control or query a patcher" };
    MIN_TAGS		{ "developer" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "pcontrol, thispatcher" };

    inlet<>  m_in	{ this, "(anything) query or control the patcher" };
    outlet<> m_out	{ this, "(anything) query responses" };


    message<> m_box_count { this, "box_count", "Return the total number of boxes in this patcher.",
        MIN_FUNCTION {
            auto p = patcher();
            auto boxes = p.boxes();
            
            m_out.send(boxes.size());
            return {};
        }
    };
    
    message<> m_classnames { this, "classnames", "Return the classnames of all boxes in this patcher.",
        MIN_FUNCTION {
            auto p = patcher();
            auto boxes = p.boxes();
            atoms as {};
            
            for (const auto& b : boxes)
                as.push_back(b.classname());
            m_out.send(as);
            return {};
        }
    };
   
    message<> m_boxpaths { this, "boxpaths", "Return the paths of all boxes in this patcher.",
        MIN_FUNCTION {
            auto p = patcher();
            auto boxes = p.boxes();
            atoms as {};
            
            for (const auto& b : boxes)
                as.push_back(b.path());
            m_out.send(as);
            return {};
        }
    };


    
private:
    
};

MIN_EXTERNAL(patcher_control);
