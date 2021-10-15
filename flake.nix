{
  description = "reveal.js on steroids!";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    reveal-md-src = {
      url = "github:webpro/reveal-md?rev=06b9605bd9cf7bb2186b263df141d76d50aa09ac"; # 5.1.3
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, reveal-md-src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in rec {
        packages.reveal-md = pkgs.mkYarnPackage {
          name = "reveal-md";
          src = reveal-md-src;
          packageJSON = ./package.json;
          yarnLock = ./yarn.lock;
        };
        defaultPackage = packages.reveal-md;

        devShell = pkgs.mkShell { buildInputs = [packages.reveal-md]; };
      });
}
