{inputs, ...}: {
  flake.homeModules.apps = {...}: {
    imports = [inputs.zen-browser.homeModules.beta];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      languagePacks = ["en-GB"];

      policies = {
        DisableAppUpdate = true;
        DisableTelemetry = true;
        DisablePocket = true;

        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          };
          "ClearURLs@gofoss.org" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          };
          "CanvasBlocker@kkapsner.de" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/latest.xpi";
          };
        };
      };

      profiles.mari = {
        id = 0;
        name = "mari";

        bookmarks = {
          force = true;
          settings = [
            {
              name = "General Links";
              toolbar = true;
              bookmarks = [
                {
                  name = "YouTube";
                  url = "https://www.youtube.com";
                }
                {
                  name = "Reddit";
                  url = "https://www.reddit.com";
                }
              ];
            }
            {
              name = "Code Links";
              bookmarks = [
                {
                  name = "GitHub";
                  url = "https://github.com";
                }
                {
                  name = "Claude";
                  url = "https://claude.ai";
                }
              ];
            }
            {
              name = "Nix Links";
              bookmarks = [
                {
                  name = "Nix Search";
                  url = "https://search.nixos.org";
                }
                {
                  name = "MyNixos";
                  url = "https://mynixos.com";
                }
              ];
            }
          ];
        };

        spacesForce = true;
        spaces = {
          "General" = {
            id = "c6de089c-410d-4206-961d-ab11f988d40a";
            position = 1000;
            icon = "🏠";
          };
          "Code" = {
            id = "b3fca217-1d37-4d9a-8869-7ee4a1792fa2";
            position = 2000;
            icon = "💻";
          };
          "Nix" = {
            id = "e4b52b21-fa43-4e4b-9721-cda3bb6bdf8a";
            position = 3000;
            icon = "❄️";
          };
        };

        settings = {
          "browser.startup.page" = 3;
          "zen.workspaces.continue-where-left-off" = true;

          "privacy.firstparty.isolate" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "network.cookie.cookieBehavior" = 5;

          "media.peerconnection.enabled" = false;
          "network.prefetch-next" = false;
          "network.dns.disablePrefetch" = true;
          "network.predictor.enabled" = false;
          "network.captive-portal-service.enabled" = false;

          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_everwhere" = true;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.speculativeConnect.enabled" = false;
        };
      };
    };
  };
}
