#include "c74_min.h"

using namespace c74::min;

class buffer_multi : public object<buffer_multi>, public vector_operator<> {
public:
    MIN_DESCRIPTION	{ "buffer~ testing" };
    MIN_TAGS		{ "audio, sampling" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "index~, buffer~, wave~" };

    std::vector<std::unique_ptr<buffer_reference>> buffers;

    buffer_multi(const atoms& args = {}) {
      for (int i = 0; i < 2; i++) {
        buffers.emplace_back(std::make_unique<buffer_reference>(this, nullptr, false));
        buffers[i]->set(symbol("test" + std::to_string(i + 1)));
      }
    }

    //handle the notifications for our buffer references
    message<> notify { 
      this, "notify",
      [this](const c74::min::atoms& args, const int inlet) -> c74::min::atoms {
        return buffer_reference::handle_notification(this, args, buffers.begin(), buffers.end());
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
};

MIN_EXTERNAL(buffer_multi);
