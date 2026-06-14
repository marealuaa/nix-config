{inputs, ...}: {
  flake.homeModules.editor = {...}: {
    imports = [inputs.nvf.homeManagerModules.default];

    programs.nvf = {
      enable = true;
      settings.vim = {
        viAlias = true;
        vimAlias = true;

        undoFile.enable = true;

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };

        opts = {
          expandtab = true;
          shiftwidth = 2;
          tabstop = 2;
          softtabstop = 2;
          termguicolors = true;
        };

        globals.mapleader = " ";

        keymaps = [
          # diagnostics
          {
            key = "<leader>d";
            mode = "n";
            silent = true;
            action = "<cmd>lua vim.diagnostic.open_float()<cr>";
          }
          # neo-tree
          {
            key = "<leader>e";
            mode = "n";
            silent = true;
            action = "<cmd>Neotree toggle<cr>";
          }

          # toggleterm
          {
            key = "<C-t>";
            mode = "n";
            silent = true;
            action = "<cmd>ToggleTerm<cr>";
          }

          # trouble
          {
            key = "<leader>xx";
            mode = "n";
            silent = true;
            action = "<cmd>Trouble diagnostics toggle<cr>";
          }
          {
            key = "<leader>xb";
            mode = "n";
            silent = true;
            action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
          }

          # diffview
          {
            key = "<leader>gd";
            mode = "n";
            silent = true;
            action = "<cmd>DiffviewOpen<cr>";
          }
          {
            key = "<leader>gh";
            mode = "n";
            silent = true;
            action = "<cmd>DiffviewFileHistory<cr>";
          }

          # mini.pick
          {
            key = "<leader>ff";
            mode = "n";
            action = "<cmd>Pick files<cr>";
          }
          {
            key = "<leader>fg";
            mode = "n";
            silent = true;
            action = "<cmd>Pick grep_live<cr>";
          }
          {
            key = "<leader>fb";
            mode = "n";
            silent = true;
            action = "<cmd>Pick buffers<cr>";
          }
          # Bufferline
          {
            key = "<Tab>";
            mode = "n";
            action = "<cmd>BufferLineCycleNext<cr>";
          }
          {
            key = "<S-Tab>";
            mode = "n";
            action = "<cmd>BufferLineCyclePrev<cr>";
          }
          # Typst preview
          {
            key = "<leader>tp";
            mode = "n";
            action = "<cmd>TypstPreviewToggle<cr>";
          }
          {
            key = "<leader>tu";
            mode = "n";
            action = "<cmd>TypstPreviewUpdate<cr>";
          }
        ];

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
            lsp.servers = ["nixd"];
          };

          bash.enable = true;
          fish.enable = true;
          clang.enable = true;
          python.enable = true;
          typst = {
            enable = true;
            extensions.typst-preview-nvim = {
              enable = true;
              setupOpts = {
                open_cmd = "zen-beta %s";
              };
            };
          };

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

        mini.pick = {
          enable = true;
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
