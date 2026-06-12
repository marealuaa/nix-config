{
  description = "Rust devshell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    forEachSupportedSystem = f:
      inputs.nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          inherit system;
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [self.overlays.default];
          };
        });
  in {
    overlays.default = _final: prev: {
      rustToolchain = inputs.fenix.packages.${prev.stdenv.hostPlatform.system}.combine (
        with inputs.fenix.packages.${prev.stdenv.hostPlatform.system}.stable; [
          clippy
          rustc
          cargo
          rustfmt
          rust-src
          rust-analyzer
        ]
      );
    };

    devShells = forEachSupportedSystem ({pkgs, ...}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          rustToolchain
          openssl
          pkg-config
          cargo-deny
          cargo-edit
          cargo-watch
        ];
        env.RUST_SRC_PATH = "${pkgs.rustToolchain}/lib/rustlib/src/rust/library";
      };
    });

    formatter = forEachSupportedSystem ({pkgs, ...}: pkgs.nixfmt-rfc-style);
  };
}
