{
  flake.homeModules.shell = {...}: {
    programs.git = {
      enable = true;
      userName = "mari";
      userEmail = "mari@lua.sea";

      extraConfig = {
        init.defaultBranch = "master";
        pull.rebase = true;
        color.ui = true;
      };

      ignores = ["*.o" "*.out" "*.DS_Store" "result"];

      delta = {
        enable = true;
        options = {
          navigate = true;
          line-numbers = true;
          side-by-side = true;
        };
      };
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
