{...}: {
  perSystem = {pkgs, ...}: {
    packages = {
      sf-pro = pkgs.callPackage ./sf-pro/_default.nix {};
    };
  };
}
