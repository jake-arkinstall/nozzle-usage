#include "binX/binX/print-header-only-lib.h"
#include "binX/binX/print-linked-lib.h"
#include "binX/binX/print-third-party-fmt.h"
#include "binX/binX/print-third-party-spdlog.h"

int main() {
    print_linked("Hello, world!");
    print_header_only("Hello, world!");
    print_third_party_fmt("Hello, world!");
    print_third_party_spdlog("Hello, world!");
}
