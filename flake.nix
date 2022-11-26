{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nozzle.url = "github:jake-arkinstall/nozzle";
  outputs = { self, nixpkgs, flake-utils, nozzle }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (self: super: { nozzle = nozzle.lib { inherit pkgs; }; })
          ];
        };
      in {
        defaultPackage = import ./. { inherit pkgs; };
      });
}
