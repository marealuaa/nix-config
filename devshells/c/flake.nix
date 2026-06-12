{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {self, ...} @ inputs: let
    supportedSystems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];
    forEachSupportedSystem = f:
      inputs.nixpkgs.lib.genAttrs supportedSystems (
        system:
          f {
            inherit system;
            pkgs = import inputs.nixpkgs {inherit system;};
          }
      );
  in {
    devShells = forEachSupportedSystem (
      {
        pkgs,
        system,
      }: {
        default =
          pkgs.mkShell.override
          {
          }
          {
            packages = with pkgs;
              [
                clang-tools
                cmake
                codespell
                cppcheck
                doxygen
                gtest
                lcov
                self.formatter.${system}
              ]
              ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [gdb];
          };
      }
    );

    formatter = forEachSupportedSystem ({pkgs, ...}: pkgs.nixfmt);
  };
}
