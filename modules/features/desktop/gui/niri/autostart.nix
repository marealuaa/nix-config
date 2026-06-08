{
  flake.homeModules.niri = {...}: {
    wayland.windowManager.niri.settings = {
      spawn-sh-at-startup = [
        ["noctalia-shell"]
      ];
    };
  };
}
