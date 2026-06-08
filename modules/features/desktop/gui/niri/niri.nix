{ inputs, ... }: {
  flake.nixosModules.niri = {...}: {
    programs.niri.enable = true;
  };

  flake.homeModules.niri = {...}: {
    imports = [ inputs.niri-nix.homeModules.default ];
    wayland.windowManager.niri = {
      enable = true;
      validation.enable = true;
    };
  };
}
