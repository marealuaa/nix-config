{
  flake.homeModules.shell = {...}: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "mari";
          email = "mari@lua.sea";
        };
      };

      extraConfig = {
        init.defaultBranch = "master";
        pull.rebase = true;
        color.ui = true;
      };

      ignores = ["*.o" "*.out" "*.DS_Store" "result"];
    };

    programs.lazygit = {
      enable = true;
      settings = {
        gui = {
          mouseEvents = true;
          showIcons = true;
        };
      };
    };
  };
}
