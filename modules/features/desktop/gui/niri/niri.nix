{inputs, ...}: {
  flake.nixosModules.niri = {pkgs, ...}: {
    programs.niri = {
      enable = true;
      useNautilus = true;
    };
    services.gvfs.enable = true;
    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };

  flake.homeModules.niri = {pkgs, ...}: {
    imports = [inputs.niri-nix.homeModules.default];

    wayland.windowManager.niri = {
      enable = true;
      validation.enable = true;
    };

    xdg.portal = {
      enable = true;
      config.niri = {
        default = ["gnome" "gtk"];
        "org.freedesktop.impl.portal.FileChooser" = ["gnome"];
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
      XDG_SESSION_TYPE = "wayland";
    };

    home.packages = with pkgs; [
      wl-clipboard
    ];
  };
}
