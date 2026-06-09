{
  flake.homeModules.gui = {...}: {
    wayland.windowManager.niri.settings = {
      spawn-sh-at-startup = [
        ["noctalia-shell"]
        ["xwayland-satellite"]
      ];
    };
  };
}
