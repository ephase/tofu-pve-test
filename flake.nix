{
  description = "Devshell for PVE Terraform";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ nixpkgs , flake-parts, systems, ... }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import systems;
      perSystem = { pkgs, lib, system, self', ... }:
      let
        devPkgs = with pkgs; [
          opentofu
        ];
        checkPkgs = with pkgs; [
          tflint
        ];
      in {
        apps.default = {
          type = "app";
          program = lib.getExe (pkgs.writeShellScriptBin "deploy" ''
            ${pkgs.go-task}/bin/task plan --verbose --output prefixed
          '');
        };
        devShells.default = pkgs.mkShell {
          packages = devPkgs;
        };
        checks.default = pkgs.stdenv.mkDerivation {
          name = "pve-project-checks";
          src = ./.;
          buildInputs = checkPkgs;
          buildPhase = ''
            mkdir $out
          '';
          installPhase = ''
            ${pkgs.go-task}/bin/task lint --verbose --output prefixed
          '';
        };
      };
    };
}
