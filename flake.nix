{
  description = "Description for the project";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
    };

    devshell = {
      url = "github:numtide/devshell";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.pre-commit-hooks.flakeModule
        inputs.devshell.flakeModule
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          python310 = pkgs.python310.withPackages (p: with p; [
            pytest
            pytest-testinfra
            molecule
            molecule-plugins
          ]);

        in
        {
          pre-commit = {
            check = {
              enable = true;
            };

            settings = {
              hooks = {
                later = {
                  enable = true;
                  name = "ansible-later";
                  description = "Run ansible-later on all files in the project";
                  files = "\\.(yml|yaml)$";
                  entry = "${pkgs.ansible-later}/bin/ansible-later";
                };
              };
            };
          };

          devshells = {
            default = {
              commands = [
                {
                  name = "later";
                  help = "execute later command";
                  command = "${pkgs.ansible-later}/bin/ansible-later";
                }
                {
                  name = "doctor";
                  help = "execute doctor command";
                  command = "${pkgs.ansible-doctor}/bin/ansible-doctor -fv";
                }
                {
                  name = "testing";
                  help = "execute molecule command";
                  command = "${pkgs.molecule}/bin/molecule test --scenario-name default";
                }
              ];

              packages = with pkgs; [
                ansible-doctor
                ansible-lint
                ansible-later

                python310
              ];
            };
          };
        };
    };
}
