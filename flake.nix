{
  description = "Nix flake for development";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    devenv = {
      url = "github:cachix/devenv";
    };

    pre-commit-hooks-nix = {
      url = "github:cachix/pre-commit-hooks.nix";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devenv.flakeModule
        inputs.pre-commit-hooks-nix.flakeModule
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
          imports = [
            {
              _module.args.pkgs = import inputs.nixpkgs {
                inherit system;
                config.allowUnfree = true;
              };
            }
          ];

          pre-commit = {
            settings = {
              hooks = {
                nixpkgs-fmt = {
                  enable = true;
                };
                later = {
                  enable = true;
                  name = "ansible-later";
                  description = "Run ansible-later on all files in the project";
                  files = "\\.(yml|yaml)$";
                  entry = "${pkgs.podman}/bin/podman run --pull newer -ti --rm -v $(pwd):$(pwd):Z -w $(pwd) ghcr.io/toolhippie/ansible-later ansible-later";
                };
              };
            };
          };

          devenv = {
            shells = {
              default = {
                languages = {
                  python = {
                    enable = true;
                    package = pkgs.python312;
                  };
                };

                scripts = {
                  testing = {
                    exec = "${pkgs.molecule}/bin/molecule test --scenario-name default";
                  };
                  later = {
                    exec = "${pkgs.podman}/bin/podman run --pull newer -ti --rm -v $(pwd):$(pwd):Z -w $(pwd) ghcr.io/toolhippie/ansible-later ansible-later";
                  };
                  doctor = {
                    exec = "${pkgs.podman}/bin/podman run --pull newer -ti --rm -v $(pwd):$(pwd):Z -w $(pwd) ghcr.io/toolhippie/ansible-doctor ansible-doctor -fv";
                  };
                };

                packages = with pkgs; [
                  nixpkgs-fmt
                ];
              };
            };
          };
        };
    };
}
