{pkgs}:
let
  inherit (pkgs.lib.debug) traceSeqN;
  nozzle = pkgs.nozzle { workspace-root=./.; };
  project = nozzle.add-subdirectory ./binX;
in
  project.binX.binX.hello-world
