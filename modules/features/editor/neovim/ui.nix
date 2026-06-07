{
  flake.homeModules.neovim = {...}: {
    programs.nvf.settings.vim = {
      statusline.lualine = {
        enable = true;

        sectionSeparator = {
          left = "";
          right = "";
        };

        componentSeparator = {
          left = "│";
          right = "│";
        };
      };

      visuals.indent-blankline.enable = true;
      mini.tabline.enable = true;

      utility.snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile.enable = true;

          dashboard = {
            enable = true;

            sections = [
              {section = "header";}
              {section = "keys";}
              {
                section = "recent_files";
                search = true;
              }
              {section = "projects";}
            ];
          };
        };
      };
    };
  };
}
