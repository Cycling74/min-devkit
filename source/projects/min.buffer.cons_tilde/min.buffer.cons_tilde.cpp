#include "c74_min.h"

using namespace c74::min;

class buffer_cons : public object<buffer_cons>, public vector_operator<> {
public:
    MIN_DESCRIPTION	{ "buffer~ testing" };
    MIN_TAGS		{ "audio, sampling" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "index~, buffer~, wave~" };

    std::vector<std::unique_ptr<buffer_reference>> buffers;

    virtual ~buffer_cons() {
      buffers.clear();
    }

    buffer_cons() {
      create();
    }

    void operator()(audio_bundle input, audio_bundle output) {
    }

private:
    void create() {
        for (int i = 0; i < 2; i++) {
          buffers.emplace_back(std::make_unique<buffer_reference>(this));
          buffers[i]->set(symbol("test" + std::to_string(i + 1)));
        }
    }
};

MIN_EXTERNAL(buffer_cons);
