{
  description = "C/C++ devshell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    forEachSupportedSystem = f:
      inputs.nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          inherit system;
          pkgs = import inputs.nixpkgs {inherit system;};
        });
  in {
    devShells = forEachSupportedSystem ({pkgs, ...}: {
      default = pkgs.mkShell {
        # stdenv = pkgs.clangStdenv;
        packages = with pkgs;
          [
            clang-tools
            cmake
            codespell
            cppcheck
            doxygen
            gtest
            lcov
          ]
          ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [gdb];
      };
    });

    formatter = forEachSupportedSystem ({pkgs, ...}: pkgs.nixfmt-rfc-style);
  };
}
