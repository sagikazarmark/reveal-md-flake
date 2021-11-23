> # ⚠️ Deprecated: reveal-md is now available in nixpkgs. ⚠️

# Nix flake for [reveal-md](https://github.com/webpro/reveal-md)

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/sagikazarmark/reveal-md-flake/CI?style=flat-square)
[![built with nix](https://img.shields.io/badge/builtwith-nix-7d81f7?style=flat-square)](https://builtwithnix.org)


## Usage

In the shell:

```shell
$ nix shell github:sagikazarmark/reveal-md-flake
$ which reveal-md
/nix/store/y0yqmnk8js2k9rbaakcr3sfyhfq0fd7l-reveal-md/bin/reveal-md
```

In your own `flake.nix`:

```nix
  # define an input
  reveal-md-flake.url = "github:sagikazarmark/reveal-md-flake";

  # Option 1: as an overlay
  pkgs = import nixpkgs {
    inherit system;
    overlays = [
      reveal-md-flake.overlay
    ];
  };

  # Option 2: directly
  devShell = pkgs.mkShell { buildInputs = with pkgs; [ reveal-md-flake.defaultPackage."${system}" ]; };
```


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
