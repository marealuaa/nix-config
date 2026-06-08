{
  flake.homeModules.niri = { ... }: {
    wayland.windowManager.niri.settings = {

      input = {
        keyboard.xkb = {
          layout = "it";
        };
        touchpad = {
          tap = [];
          dwt = [];
          natural-scroll = [];
          scroll-method = "two-finger";
          accel-speed = 0.2;
        };
        mouse = {
          accel-speed = 0.0;
          accel-profile = "flat";
        };
      };

      output = [
        {
          _args = [ "eDP-1" ];
          mode = "1920x1080@60";
          position._props = {
            x = 0;
            y = 0;
          };
          scale = 1.0;
        }
      ];

    };
  };
}
