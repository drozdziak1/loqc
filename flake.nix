{
  description = "LOw-effort Question Contraption";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/release-21.05;
    rust-overlay.url = github:oxalica/rust-overlay;
    flake-utils.url = github:numtide/flake-utils;
    cargo2nix = {
      url = github:cargo2nix/cargo2nix;
      flake = false;
    };
  };
  outputs = { self, nixpkgs, rust-overlay, flake-utils, cargo2nix }:
    flake-utils.lib.eachDefaultSystem (
      system:
        let
          c2n-olay = import "${cargo2nix}/overlay";
          pkgs = import nixpkgs {
            overlays = [ rust-overlay.overlay c2n-olay ];
            inherit system;
            config.allowUnfree = true;
          };
        in
          rec {
            devShell = pkgs.mkShell {
              nativeBuildInputs = with pkgs; [
                (callPackage cargo2nix {}).package
                rust-bin.stable."1.55.0".default
              ];
            };
            packages = rec {};
          }
    );

}
