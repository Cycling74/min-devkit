#include "c74_min.h"

using namespace c74::min;

//#define DUMB
//#define CRASH_ORDER

class buffer_cons : public object<buffer_cons>, public vector_operator<> {
public:
    MIN_DESCRIPTION	{ "buffer~ testing" };
    MIN_TAGS		{ "audio, sampling" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "index~, buffer~, wave~" };


#ifdef DUMB
    buffer_cons() {
      create();
    }

    ~buffer_cons() {
        delete buffers[0];
        delete buffers[1];
    }

    message<> m_notify_meth { this, "notify",
        MIN_FUNCTION {
            notification n { args };
            atoms return_value { 0 };

            //for (auto& b : buffers)
                //return_value = b->handle_notification(this, args);
            return return_value;
       }
    };
    std::vector<buffer_reference*> buffers;
#else

    //if you define CRASH_ORDER, it looks like the notify method gets deleted
    //and then the buffers get deleted, but deleteing the buffers calls the notify method
#ifdef CRASH_ORDER
    std::vector<std::unique_ptr<buffer_reference>> buffers;
    std::unique_ptr<message<>> m_notify_meth;
#else
    std::unique_ptr<message<>> m_notify_meth;
    std::vector<std::unique_ptr<buffer_reference>> buffers;
#endif

    buffer_cons() {
      m_notify_meth = std::make_unique<message<>>(this, "notify",
        MIN_FUNCTION {
            notification n { args };
            atoms return_value { 0 };
            //for (auto& b : buffers)
                //return_value = b->handle_notification(this, args);
            return return_value;
       });
      create();
    }
    ~buffer_cons() {
        //buffers.clear();
        //m_notify_meth.reset();
    }
#endif

    void operator()(audio_bundle input, audio_bundle output) {
    }

private:
    void create() {
        for (int i = 0; i < 2; i++) {
#ifdef DUMB
          buffers.emplace_back(new buffer_reference(this, nullptr, false));
#else
          buffers.emplace_back(std::make_unique<buffer_reference>(this, nullptr, false));
#endif
          buffers[i]->set(symbol("test" + std::to_string(i + 1)));
        }
    }
};

MIN_EXTERNAL(buffer_cons);
