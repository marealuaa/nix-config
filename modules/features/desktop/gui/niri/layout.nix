{
  flake.homeModules.gui = {...}: {
    wayland.windowManager.niri.settings = {
      prefer-no-csd = true;

      layout = {
        gaps = 16;
        center-focused-column = "never";
        default-column-width._children = [
          {proportion = 0.5;}
        ];

        background-color = "transparent";

        focus-ring.off = [];
        border.off = [];
        shadow = {
          on = [];
          softness = 18;
          spread = 2;
          offset._props = {
            x = 0;
            y = 6;
          };
          color = "#00000033";
        };
      };

      blur = {
        passes = 4;
        offset = 2.5;
      };

      animations = {
        slowdown = 1.2;
        overview-open-close.spring._props = {
          damping-ratio = 0.9;
          stiffness = 400;
          epsilon = 0.0001;
        };
        workspace-switch.spring._props = {
          damping-ratio = 0.9;
          stiffness = 400;
          epsilon = 0.0001;
        };
        window-open.spring._props = {
          damping-ratio = 0.9;
          stiffness = 400;
          epsilon = 0.0001;
        };
        window-close.spring._props = {
          damping-ratio = 0.9;
          stiffness = 400;
          epsilon = 0.0001;
        };
        horizontal-view-movement.spring._props = {
          damping-ratio = 0.9;
          stiffness = 400;
          epsilon = 0.0001;
        };
      };

      layer-rule = [
        {
          match._props.namespace = "^noctalia-backdrop";
          place-within-backdrop = true;
        }
      ];

      window-rule = [
        {
          geometry-corner-radius = 14.0;
          clip-to-geometry = true;
          draw-border-with-background = false;
          background-effect = {
            blur = true;
            xray = false;
          };
        }
        {
          match._props.is-focused = true;
          opacity = 0.8;
        }
        {
          match._props.is-focused = false;
          opacity = 0.7;
        }
      ];
    };
  };
}
