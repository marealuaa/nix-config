{
  description = "Python devshell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = inputs: let
    inherit (inputs.nixpkgs) lib;
    supportedSystems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    forEachSupportedSystem = f:
      lib.genAttrs supportedSystems (system:
        f {
          inherit system;
          pkgs = import inputs.nixpkgs {inherit system;};
        });

    version = "3.13";

    pythonAttr = "python${lib.concatStrings (lib.sublist 0 2 (lib.versions.splitVersion version))}";
  in {
    devShells = forEachSupportedSystem ({pkgs, ...}: let
      python = pkgs.${pythonAttr};
    in {
      default = pkgs.mkShellNoCC {
        venvDir = ".venv";
        packages = with python.pkgs; [
          venvShellHook
          uv
        ];
        postShellHook = ''
          local venvVer
          venvVer="$("$venvDir/bin/python" -c 'import platform; print(platform.python_version())')"
          if [[ "$venvVer" != "${python.version}" ]]; then
            echo "Warning: venv Python $venvVer != ${python.version} — delete .venv and reload"
          fi
        '';
      };
    });

    formatter = forEachSupportedSystem ({pkgs, ...}: pkgs.nixfmt-rfc-style);
  };
}
