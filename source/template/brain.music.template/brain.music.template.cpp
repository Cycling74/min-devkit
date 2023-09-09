/*
This file serves as a template and basic guide to creating Max objects with the Min-Devkit. Anytime the 
documentation is referenced, see http://cycling74.github.io/min-devkit/guide/writingobjects. This template is
based off of the min.beat.random object found at 
https://github.com/Cycling74/min-devkit/blob/main/source/projects/min.beat.random/min.beat.random.cpp
*/
#include "c74_min.h"

namespace mindev = c74::min;  /*C74 just uses 'using namespace c74::min'.I like this alternattive because
                              it forces some necessary (in my opinion) verbosity. */


// using namespace std;  <-- DO NOT EVER PUT THIS IN YOUR CODE! Why? Look up namespace collisions.


/* To create a Min object you define a class that inherits from a specialization of the min::object class.
You then wrap this class with the MIN_EXTERNAL macro that exposes the class to Max. */
class example : public mindev::object<example> {
public:

    /* Constructors and Destructors are optional. Use them if there is any custom initialization and/or destruction to perform. 
    See the documentation for more information. */

    MIN_DESCRIPTION	{ "" };  // Description of the object
    MIN_TAGS		{ "" };  // Any tags to include
    MIN_AUTHOR		{ "" };  // Author of the objectcmake 
    MIN_RELATED		{ "" };  // Related Max Objects


    /* Inlets and outlets take three arguments inside the curly braces
    - An owner object (typically this)
    - A description
    - A type (as a string).
    See documentation for more info. */

    mindev::inlet<>  input  /*inlet 0*/ {this, "(toggle) on/off", "int"};  // int represents toggle (0 or 1)
    mindev::inlet<>  input2 /*inlet 1*/ {this, "(bang) say hi", "bang"};
    mindev::outlet<> bang_out		    { this, "(bang) triggers at randomized interval", "bang" };
    mindev::outlet<> interval_out	    { this, "(float) the interval for the current bang", "float"};

    /* Messages are the most basic functional unit. They take four arguments
    - An owner object (typically this)
    - A type (as a string)
    - A description
    - A function (typically MIN_FUNCTION)
    See documentation for information on MIN_FUNCTION 
    
    Write your functionality within the MIN_FUNCTION curly braces. An important thing to remember about 
    messages is that only one message of each type should be included. You could include the following 
    messages:
    
    message<> msg1 {this, "int", "message1", some_function};
    message<> msg2 {this, "float", "message2", another_function};
    message<> msg3 {this, "bang", "message3", yet_another_function};
    
    The important notes here are that the first message triggers when an inlet receives an int, the second a
    float, and the third a bang. Use a switch statement to decide what to do based on what inlet the
    information came from as demonstrated below. Also note how to send data to the outlets. Note that the
    switch statements here are a bit overkill since the inlets take specific types. They would be more 
    necessary if, for example, there were two inlets that accepted integers. */
    mindev::message<> toggle{ this, "int", "Toggle the state of the timer.",
        MIN_FUNCTION {
            switch (inlet)
            {
            case 0:
                on = args[0];  // A message has the variable args. How many depends on how many items are 
                break;         // sent in the message

            case 1:
                break;
            }
            return {};
        }
    };

    mindev::message<> say_something{ this, "bang", "Say Hi!",
        MIN_FUNCTION {
            switch (inlet)
            {
            case 0:
                break;

            case 1:
                cout << "Hi!" << mindev::endl;  // Note that cout here is not std::cout. It is a member
                break;                          // variable of the parent class.
            }
            return {};
        }
    };

    /* Create an Argument.
    They need a templated type, an owner, name, description, and function(MIN_ARGUMEN_FUNCTION)
    */
    mindev::argument<mindev::number> minimum_arg { this, "minimum", "Initial lower-bound of generated random interval.",
        MIN_ARGUMENT_FUNCTION {
            min = arg;  // arg is the argument value
        }
    };

    mindev::argument<mindev::number> maximum_arg{ this, "maximum", "Initial upper-bound of generated random interval.",
        MIN_ARGUMENT_FUNCTION {
            max = arg;
        }
    };

    /* Create an attribute.They need a templated type, an owner, name, description, and function(MIN_FUNCTION)
    See the attributes section of the documentation for infomration on optional arguments such as mindev::title,
    mindev::description, and mindev::setter. */
    mindev::attribute<mindev::number> min { this, "min", 250.0, mindev::title {"Minimum Interval"},
        mindev::description {"Lower-bound of generated random interval."},
        mindev::setter { MIN_FUNCTION {
            UNUSED(this);   // silences compiler warning since we don't access class members
 
            double value = args[0];  // Attributes have args too
            if (value < 1.0)
                value = 1.0;
            return {value};
        }},
        mindev::category {"Range"}, mindev::order {1}
    };

    mindev::attribute<mindev::number> max{ this, "max", 1500.0, mindev::title {"Maximum Interval"},
        mindev::description {"Upper-bound of generated random interval."},
        mindev::setter { MIN_FUNCTION {
            UNUSED(this);   // silences compiler warning since we don't access class members

            double value = args[0];
            if (value < 1.0)
                value = 1.0;
            return {value};
        }},
        mindev::category {"Range"}, mindev::order {2}
    };

    mindev::attribute<bool> on{ this, "on", false, mindev::title {"On/Off"},
        mindev::description {"Activate the timer."},
        mindev::setter { MIN_FUNCTION {
            if (args[0] == true)
                metro.delay(0.0);    // fire the first one straight-away
            else
                metro.stop();
            return args;
        }}
    };

    /* Scheule an event to happen in the future. A timer needs an owner object and a function. */
    mindev::timer<> metro{ this,
        MIN_FUNCTION {
            auto interval = mindev::lib::math::random(min, max);

            interval_out.send(interval);
            bang_out.send("bang");

            metro.delay(interval);
            return {};
        }
    };
};


MIN_EXTERNAL(example);  // Wrap the class name in the MIN_EXTERNAL macro
