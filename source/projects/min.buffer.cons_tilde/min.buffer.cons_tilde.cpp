#include "c74_min.h"

using namespace c74::min;

class buffer_cons : public object<buffer_cons>, public vector_operator<> {
public:
    MIN_DESCRIPTION	{ "buffer~ testing" };
    MIN_TAGS		{ "audio, sampling" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "index~, buffer~, wave~" };

//    std::vector<std::unique_ptr<buffer_reference>> buffers;
    std::vector<buffer_reference*> buffers;

    buffer_cons() {
      create();
    }

    ~buffer_cons() {
        delete buffers[0];
    }

    void operator()(audio_bundle input, audio_bundle output) {
    }

    message<> m_notify_meth { this, "notify",
        MIN_FUNCTION {
            notification n { args };
            atoms return_value { 0 };

            for (auto& b : buffers)
                return_value = b->handle_notification(this, args);
            return return_value;
       }
    };

private:
    void create() {
        for (int i = 0; i < 1; i++) {
//          buffers.emplace_back(std::make_unique<buffer_reference>(this, nullptr, false));
            buffers.push_back(new buffer_reference(this, nullptr, false));
            buffers[i]->set(symbol("test" + std::to_string(i + 1)));
        }
    }
};

MIN_EXTERNAL(buffer_cons);
