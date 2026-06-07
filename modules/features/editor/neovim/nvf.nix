{ inputs, ... }: {
  flake.homeModules.neovim = {...}: {
    imports = [ inputs.nvf.homeManagerModules.default ];

    programs.nvf = {
      enable = true;
      settings.vim = {
	viAlias = true;
	vimAlias = true;

	opts = {
	  autoindent = true;
	  cursorlineopt = "both";
	  shiftwidth = 2;
	  tabstop = 2;
	  termguicolors = true;
	  wrap = true;
	};

      };
    };
  };
}
