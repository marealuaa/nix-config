{inputs, ...}: {
  flake.homeModules.apps = {...}: {
    imports = [inputs.zen-browser.homeModules.beta];

    programs.zen-browser = {
      enable = true;
      languagePacks = ["en-GB"];

      profiles.mari = {
        id = 0;
        name = "mari";
      };
    };
  };
}
