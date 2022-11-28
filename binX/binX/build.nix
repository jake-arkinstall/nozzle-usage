{pkgs, nozzle}:
let 
  spdlog = nozzle.pkg-wrapper {
    name=spdlog;
    derivation=pkgs.spdlog;
    cflags="-DSPDLOG_FMT_EXTERNAL";
  };
in
self: super: {
  binX = {
    print-linked-lib = nozzle.cpp-library {
      name = "print-linked-lib";
      headers = [ ./print-linked-lib.h ];
      sources = [ ./print-linked-lib.cpp ];
    };
    print-header-only-lib = nozzle.cpp-library {
      name = "print-header-only-lib";
      headers = [ ./print-header-only-lib.h ];
    };
    print-third-party-fmt = nozzle.cpp-library {
      name = "print-third-party-fmt";
      headers = [ ./print-third-party-fmt.h ];
      dependencies = [ spdlog ];
      # note: spdlog provides fmt as a dependency
    };
    print-third-party-spdlog = nozzle.cpp-library {
      name = "print-third-party-spdlog";
      headers = [ ./print-third-party-spdlog.h ];
      dependencies = [ spdlog ];
    };
    hello-world = nozzle.cpp-binary {
      name = "hello-world";
      source = ./hello-world.cpp;
      dependencies = [
        super.binX.print-linked-lib
        super.binX.print-header-only-lib
        super.binX.print-third-party-fmt
        super.binX.print-third-party-spdlog
      ];
    };
  };
}
