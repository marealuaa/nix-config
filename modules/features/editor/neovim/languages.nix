{
  flake.homeModules.neovim = {...}: {
    programs.nvf.settings.vim = {
      lsp = {
        enable = true;
        formatOnSave = true;
        #	lspkind.enable = true;
        lightbulb.enable = true;
        trouble.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;

        clang.enable = true;
        rust.enable = true;
        python.enable = true;

        typst.enable = true;
      };
    };
  };
}
