{inputs, ...}: {
  flake.homeModules.apps = {pkgs, ...}: let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    imports = [inputs.spicetify-nix.homeManagerModules.spicetify];

    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        spicyLyrics
        romajiConvert
      ];
    };
  };
}
