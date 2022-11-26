{pkgs, nozzle}:

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
    hello-world = nozzle.cpp-binary {
      name = "hello-world";
      source = ./hello-world.cpp;
      dependencies = [ super.binX.print-linked-lib super.binX.print-header-only-lib ];
    };
  };
}
