{inputs, ...}: {
  flake.homeModules.editor = {...}: {
    imports = [inputs.nvf.homeManagerModules.default];

    programs.nvf = {
      enable = true;
      settings.vim = {
        viAlias = true;
        vimAlias = true;

        undoFile.enable = true;

        opts = {
          expandtab = true;
          shiftwidth = 2;
          tabstop = 2;
          softtabstop = 2;
          termguicolors = true;
        };

        spellcheck = {
          enable = true;
        };

        lsp = {
          enable = true;

          formatOnSave = true;
          lightbulb.enable = true;
          trouble.enable = true;
          lspSignature.enable = true; # conflicts with blink in maximal
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix = {
            enable = true;
            lsp.server = ["nixd"];
          };

          bash.enable = true;
          fish.enable = true;
          clang.enable = true;
          python.enable = true;
          typst.enable = true;
          rust = {
            enable = true;
            extensions.crates-nvim.enable = true;
          };
        };

        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;

          highlight-undo.enable = true;
          blink-indent.enable = false;
          indent-blankline.enable = true;
        };

        statusline.lualine.enable = true;

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp.enable = true;

        snippets.luasnip.enable = true;

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope = {
          enable = true;
          setupOpts = {
            defaults = {
              sorting_strategy = "ascending";
              layout_config = {
                horizontal = {
                  prompt_position = "top";
                  preview_width = 0.55;
                };
              };
            };
          };
        };

        git = {
          enable = true;
          gitsigns.enable = true;
        };

        notify = {
          nvim-notify.enable = true;
        };

        utility = {
          diffview-nvim.enable = true;
          surround.enable = true;
        };

        notes = {
          todo-comments.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              nix = "110";
              ruby = "120";
              java = "130";
              go = ["90" "130"];
            };
          };
          fastaction.enable = true;
        };

        comments = {
          comment-nvim.enable = true;
        };

        presence = {
          neocord.enable = true;
        };
      };
    };
  };
}
