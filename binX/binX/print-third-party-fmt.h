#ifndef printlib_third_party_fmt_header
#define printlib_third_party_fmt_header

#include <cstdio>

#include "fmt/format.h"

void print_third_party_fmt(char const* message) {
    fmt::print("From the third party fmt library: {}\n", message);
}

#endif
