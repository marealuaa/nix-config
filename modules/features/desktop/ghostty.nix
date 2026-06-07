{ self, ... }: {
  flake.homeModules.terminal = { pkgs, ... }: {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        window-decoration = false;
        window-padding-x = 12;
        window-padding-y = 12;

        gtk-single-instance = true;
      };
    };

    systemd.user.services.ghostty-daemon = {
      Unit = {
        Description = "Ghostty Terminal Quick-Launch Daemon Wrapper";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.ghostty}/bin/ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}

