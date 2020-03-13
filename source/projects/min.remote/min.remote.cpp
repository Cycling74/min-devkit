/// @file
/// @ingroup   minexamples
/// @copyright Copyright 2020 The Min-DevKit Authors. All rights reserved.
/// @license        Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;


class remote : public object<remote> {
public:
    MIN_DESCRIPTION { "Address an object remotely" };
    MIN_TAGS        { "developer" };
    MIN_AUTHOR      { "Cycling '74" };
    MIN_RELATED     { "thispatcher, send, forward, pattr" };

    inlet<>  m_in    { this, "(anything) send messages to an object" };
    outlet<> m_out    { this, "(anything) query responses" };


    message<> m_classnames { this, "anything",
        "Send a message to a named object. "
        "First argument is the scripting name of the object. "
        "Second argument is the name of the message to send. "
        "Any additional arguments are passed as arguments to the named object. ",

        MIN_FUNCTION {
            auto p = patcher();
            auto boxes = p.boxes();
            atoms as {};

            for (auto& b : boxes) {
                if (b.name() == args[0])
                    b(args[1], args[2]);
            }
            //m_out.send(as);
            return {};
        }
    };


private:

};

MIN_EXTERNAL(remote);
