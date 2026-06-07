{
  flake.homeModules.niri = { ... }: {
    wayland.windowManager.niri.settings = {
      prefer-no-csd = true;

      layout = {
        gaps = 16;
        center-focused-column = "never";
        default-column-width.proportion = 0.5;

        focus-ring.width = 0;
        border.width = 0;

        shadow = {
          on = true;

          softness = 18;
          spread = 2;

          offset = {
            x = 0;
            y = 6;
          };

          color = "#00000033";
        };
      };

      blur = {
        passes = 3;
        offset = 2.5;
      };

      window-rules = [
        {
          geometry-corner-radius = 20.0;
          clip-to-geometry = true;
          draw-border-with-background = false;

          background-effect = {
            blur = true;
            xray = false;
          };
        }

        {
          match.is-focused = true;
          opacity = 0.85;
        }

        {
          match.is-focused = false;
          opacity = 0.75;
        }
      ];
    };
  };
}
