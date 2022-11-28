#ifndef printlib_third_party_spdlog_header
#define printlib_third_party_spdlog_header

#include <cstdio>

#include "spdlog/spdlog.h"

void print_third_party_spdlog(char const* message) {
    spdlog::info("From the third party spdlog library: {}", message);
}

#endif
