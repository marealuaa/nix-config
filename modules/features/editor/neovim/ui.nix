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
	  dashboard.enable = true;
	  bigfile.enable = true;
	};
      };

    };
  };
}
