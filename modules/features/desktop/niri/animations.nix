{
  flake.homeModules.niri = { ... }: {
    wayland.windowManager.niri.settings.animations = {
      slowdown = 0.75; 

      toggle-overview = {
        spring = {
          damping-ratio = 0.85; 
          stiffness = 900;      
        };
      };

      workspace-switch = {
        spring = {
          damping-ratio = 0.8;
          stiffness = 800;
        };
      };

      window-open = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 1000;
        };
      };

      window-close = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 1000;
        };
      };

      horizontal-view-movement = {
        spring = {
          damping-ratio = 0.8;
          stiffness = 800;
        };
      };
    };
  };
}

