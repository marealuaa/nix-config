{
  flake.homeModules.apps = {pkgs, ...}: {
    programs.vesktop = {
      enable = true;

      settings = {
        discordBranch = "stable";
        minimizeToTray = true;
        tray = true;
        hardwareAcceleration = true;
        customTitleBar = false;
      };

      vencord = {
        settings = {
          plugins = {
            NoTrack = {enabled = true;};
            AnonymiseFileNames = {enabled = true;};
            AlwaysTrust = {enabled = true;};

            ReadAllNotificationsButton = {enabled = true;};
            FixYoutubeEmbeds = {enabled = true;};
            FixSpotifyEmbeds = {enabled = true;};
            BiggerStreamPreview = {enabled = true;};

            NoBlockedMessages = {enabled = true;};
            NoTypingAnimation = {enabled = true;};
            NewGuildSettings = {
              enabled = true;
              defaultNotificationSettings = "mentions";
              everyoneMuted = true;
              roleMuted = true;
            };

            FakeNitro = {
              enabled = true;
              transformEmojis = true;
            };
            VolumeBooster = {
              enabled = true;
              multiplier = 2;
            };
          };
        };
      };
    };
  };
}
