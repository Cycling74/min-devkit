#include "c74_min.h"

using namespace c74::min;

#define INCONSTRUCTOR

class buffer_lck : public object<buffer_lck>, public vector_operator<> {
public:
    MIN_DESCRIPTION	{ "buffer~ testing" };
    MIN_TAGS		{ "audio, sampling" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "index~, buffer~, wave~" };

    std::vector<std::unique_ptr<buffer_reference>> buffers;

    virtual ~buffer_lck() {
      buffers.clear();
    }

    message<> dspsetup { this, "dspsetup",
      MIN_FUNCTION {
        create();
        return {};
      }
    };

    void operator()(audio_bundle input, audio_bundle output) {
      for (auto& b: buffers) {
        if (*b) {
          buffer_lock l(*b);
          l.dirty();
        }
      }
    }

private:
    void create() {
        for (int i = 0; i < 2; i++) {
          buffers.emplace_back(std::make_unique<buffer_reference>(this));
          buffers[i]->set(symbol("test" + std::to_string(i + 1)));
        }
    }
};

MIN_EXTERNAL(buffer_lck);
