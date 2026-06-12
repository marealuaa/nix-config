{
  description = "A Nix-flake-based Python development environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {self, ...} @ inputs: let
    inherit (inputs.nixpkgs) lib;

    supportedSystems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];

    forEachSupportedSystem = f:
      lib.genAttrs supportedSystems (
        system:
          f {
            inherit system;
            pkgs = import inputs.nixpkgs {inherit system;};
          }
      );

    version = "3.13";
  in {
    devShells = forEachSupportedSystem (
      {
        pkgs,
        system,
      }: let
        concatMajorMinor = v:
          lib.pipe v [
            lib.versions.splitVersion
            (lib.sublist 0 2)
            lib.concatStrings
          ];

        python = pkgs."python${concatMajorMinor version}";
      in {
        default = pkgs.mkShellNoCC {
          venvDir = ".venv";

          postShellHook = ''
            venvVersionWarn() {
            	local venvVersion
            	venvVersion="$("$venvDir/bin/python" -c 'import platform; print(platform.python_version())')"

            	[[ "$venvVersion" == "${python.version}" ]] && return

            	cat <<EOF
            Warning: Python version mismatch: [$venvVersion (venv)] != [${python.version}]
                     Delete '$venvDir' and reload to rebuild for version ${python.version}
            EOF
            }

            venvVersionWarn
          '';

          packages =
            (with python.pkgs; [
              venvShellHook
              uv
            ])
            ++ [self.formatter.${system}];
        };
      }
    );

    formatter = forEachSupportedSystem ({pkgs, ...}: pkgs.nixfmt);
  };
}
