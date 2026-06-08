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
