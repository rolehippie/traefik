{
  description = "Nix flake for development";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    devenv = {
      url = "github:cachix/devenv";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devenv.flakeModule
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        let
          plugins = pkgs.python313Packages.molecule-plugins.overridePythonAttrs (old: rec {
            pname = "molecule-plugins";
            version = "25.8.12";
            src = pkgs.fetchPypi {
              inherit version;
              pname = "molecule_plugins";
              hash = "sha256-dfMnY+kCdb/CS8wNJ7m7IqyXNli/kCsuPor44qHDIIM=";
            };
          });

          molecule = pkgs.python313Packages.molecule.override {
            molecule-plugins = plugins;
          };

          dockermolecule = pkgs.python313.withPackages (
            ps: with ps; [
              docker
              molecule
              pytest
              pytest-testinfra
            ]
          );
        in
        {
          imports = [
            {
              _module.args.pkgs = import inputs.nixpkgs {
                inherit system;
                config.allowUnfree = true;
              };
            }
          ];

          devenv = {
            shells = {
              default = {
                git-hooks = {
                  hooks = {
                    nixfmt-rfc-style = {
                      enable = true;
                    };
                    ansible-lint = {
                      enable = true;
                      pass_filenames = false;
                    };
                  };
                };

                scripts = {
                  testing = {
                    exec = "${dockermolecule}/bin/molecule test --scenario-name default";
                  };
                  lint = {
                    exec = "${pkgs.ansible-lint}/bin/ansible-lint";
                  };
                  doctor = {
                    exec = "${pkgs.ansible-doctor}/bin/ansible-doctor -fv";
                  };
                };

                packages = with pkgs; [
                  ansible-doctor
                  ansible-lint
                  dockermolecule
                  nixfmt-rfc-style
                ];
              };
            };
          };
        };
    };
}
