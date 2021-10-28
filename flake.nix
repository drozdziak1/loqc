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
          rustChannel = "1.55.0";
          rustPkgs = pkgs.rustBuilder.makePackageSet' {
            inherit rustChannel;
            packageFun = import ./Cargo.nix;
            packageOverrides = pkgs: pkgs.rustBuilder.overrides.all;
          };
        in
          rec {
            devShell = pkgs.mkShell {
              nativeBuildInputs = with pkgs; [
                (callPackage cargo2nix {}).package
                kubectl
                minikube
                (
                  rust-bin.stable."${rustChannel}".default.override {
                    extensions = [ "rust-src" ];
                  }
                )
                rust-analyzer
                tilt
              ];
              DOCKER_BUILDKIT = 1;
            };
            packages = rec {
              loqc-container-image = pkgs.dockerTools.buildImage {
                name = "loqc/app";
                tag = "latest";
                config = {
                  Cmd = "${loqc}/bin/loqc";
                };
              };
              loqc = rustPkgs.workspace.loqc {};
            };
          }
    );

}
