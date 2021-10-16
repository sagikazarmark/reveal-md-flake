{
  description = "reveal.js on steroids!";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    reveal-md-src = {
      url = "github:webpro/reveal-md/5.1.3";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, reveal-md-src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        };
      in rec {
        packages.reveal-md = pkgs.reveal-md;

        defaultPackage = pkgs.reveal-md;

        devShell = pkgs.mkShell { buildInputs = [ pkgs.reveal-md ]; };
      }) // {
        overlay = (final: prev: {
          reveal-md = prev.mkYarnPackage {
            name = "reveal-md";
            src = reveal-md-src;
            packageJSON = ./package.json;
            yarnLock = ./yarn.lock;
          };
        });
      };
}
