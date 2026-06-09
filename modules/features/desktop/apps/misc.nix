{
  flake.homeModules.apps = {pkgs, ...}: {
    home.packages = with pkgs; [
      nautilus
      wl-clipboard
      upower
      power-profiles-daemon
    ];
  };
}
