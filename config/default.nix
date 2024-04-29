{pkgs, ...}: {
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      termcolors = true;
      integrations = {
        cmp = true;
        gitsigns = true;
        flash = true;
        mini = {
          enabled = true;
          indentscope_color = "lavender";
        };
        telescope.enabled = true;
        treesitter = true;
        which_key = true;
      };
    };
  };

  globals.mapleader = " ";
  globals.maplocalleader = " ";

  opts = {
    number = true;
    relativenumber = true;
    mouse = "a";
    showmode = false;
    clipboard = "unnamedplus";
    breakindent = true;
    undofile = true;
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";
    updatetime = 250;
    timeoutlen = 300;
    splitright = true;
    splitbelow = true;
    list = true;
    listchars = {
      tab = "» ";
      trail = "·";
      nbsp = "␣";
    };
    inccommand = "split";
    cursorline = true;
    scrolloff = 10;
    hlsearch = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    {
      mode = "n";
      key = "[d";
      action = "vim.diagnostic.goto_prev";
      lua = true;
      options.desc = "Go to previous [D]iagnostic message";
    }
    {
      mode = "n";
      key = "]d";
      action = "vim.diagnostic.goto_next";
      lua = true;
      options.desc = "Go to next [D]iagnostic message";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "vim.diagnostic.open_float";
      lua = true;
      options.desc = "Show diagnostic [E]rror messages";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "vim.diagnostic.setloclist";
      lua = true;
      options.desc = "Open diagnostic [Q]uickfix list";
    }

    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }

    {
      mode = "n";
      key = "<left>";
      action = "<cmd>echo 'Use h to move !! '<CR>";
    }
    {
      mode = "n";
      key = "<right>";
      action = "<cmd>echo 'Use l to move !! '<CR>";
    }
    {
      mode = "n";
      key = "<up>";
      action = "<cmd>echo 'Use k to move !! '<CR>";
    }
    {
      mode = "n";
      key = "<down>";
      action = "<cmd>echo 'Use j to move !! '<CR>";
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options.desc = "Move focus to the left window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options.desc = "Move focus to the right window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options.desc = "Move focus to the lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options.desc = "Move focus to the upper window";
    }

    # Telescope
    {
      mode = "n";
      key = "<leader>/";
      action = ''
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = false,
          }))
        end
      '';
      lua = true;
      options.desc = "[/] Fuzzily search in current buffer";
    }
    {
      mode = "n";
      key = "<leader>s/";
      action = ''
        function()
          require("telescope.builtin").live_grep({
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          })
        end
      '';
      lua = true;
      options.desc = "[S]earch [/] in Open Files";
    }

    # conform.nvim
    {
      mode = "";
      key = "<leader>f";
      action = ''
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end
      '';
      lua = true;
      options.desc = "[F]ormat buffer";
    }
  ];

  autoGroups = {
    kickstart-highlight-yank = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = "TextYankPost";
      group = "kickstart-highlight-yank";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
      desc = "Highlight when yanking (copying) text";
    }
  ];

  plugins = {
    sleuth.enable = true;
    comment.enable = true;
    gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "+";
        change.text = "~";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
      };
    };

    which-key = {
      enable = true;
      registrations = {
        "<leader>c" = "[C]ode";
        "<leader>d" = "[D]ocument";
        "<leader>r" = "[R]ename";
        "<leader>s" = "[S]earch";
        "<leader>w" = "[W]orkspace";
        "<leader>t" = "[T]oggle";
        "<leader>h" = {
          name = "Git [H]unk";
          mode = [
            "n"
            "v"
          ];
        };
      };
    };

    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        ui-select = {
          enable = true;
        };
      };
      keymaps = {
        "<leader>sh" = {
          action = "help_tags";
          options.desc = "[S]earch [H]elp";
        };
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "[S]earch [K]eymaps";
        };
        "<leader>sf" = {
          action = "find_files";
          options.desc = "[S]earch [F]iles";
        };
        "<leader>ss" = {
          action = "builtin";
          options.desc = "[S]earch [S]elect Telescope";
        };
        "<leader>sw" = {
          action = "grep_string";
          options.desc = "[S]earch current [W]ord";
        };
        "<leader>sg" = {
          action = "live_grep";
          options.desc = "[S]earch by [G]rep";
        };
        "<leader>sd" = {
          action = "diagnostics";
          options.desc = "[S]earch [D]iagnostics";
        };
        "<leader>sr" = {
          action = "resume";
          options.desc = "[S]earch [R]esume";
        };
        "<leader>s." = {
          action = "oldfiles";
          options.desc = "[S]earch Recent Files ('.' for repeat)";
        };
        "<leader><leader>" = {
          action = "buffers";
          options.desc = "[ ] Find existing buffers";
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        lua-ls = {
          enable = true;
          extraOptions.settings = {
            Lua.completion.callSnippet = "Replace";
          };
        };
      };
      keymaps = {
        lspBuf = {
          "<leader>rn" = {
            action = "rename";
            desc = "LSP: [R]e[n]ame";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "LSP: [C]ode [A]ction";
          };
          "K" = {
            action = "hover";
            desc = "LSP: Hover Documentation";
          };
          "gD" = {
            action = "declaration";
            desc = "LSP: [G]oto [D]eclaration";
          };
        };
        extra = [
          # LSPAttach kickstart-lsp-attach
          {
            key = "gd";
            action = "require('telescope.builtin').lsp_definitions";
            lua = true;
            options.desc = "LSP: [G]oto [D]efinition";
          }
          {
            key = "gr";
            action = "require('telescope.builtin').lsp_references";
            lua = true;
            options.desc = "LSP: [G]oto [R]eferences";
          }
          {
            key = "gI";
            action = "require('telescope.builtin').lsp_implementations";
            lua = true;
            options.desc = "LSP: [G]oto [I]implementation";
          }
          {
            key = "<leader>D";
            action = "require('telescope.builtin').lsp_type_definitions";
            lua = true;
            options.desc = "LSP: Type [D]efinition";
          }
          {
            key = "<leader>ds";
            action = "require('telescope.builtin').lsp_document_symbols";
            lua = true;
            options.desc = "LSP: [D]ocument [S]ymbols";
          }
          {
            key = "<leader>ws";
            action = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
            lua = true;
            options.desc = "LSP: [W]orkspace [S]ymbols";
          }
        ];
      };
    };

    fidget.enable = true;

    conform-nvim = {
      enable = true;
      notifyOnError = false;
      formatOnSave = ''
        function(bufnr)
          local disable_filetypes = { c = true, cpp = true, }
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
          }
        end
      '';
      formattersByFt = {
        lua = ["stylua"];
        nix = ["alejandra"];
      };
    };

    cmp = {
      enable = true;
      settings = {
        completion.completeopt = "menu,menuone,noinsert";
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";

          # "<CR>" = "cmp.mapping.confirm({ select = true })";
          # "<Tab>" = "cmp.mapping.select_next_item()";
          # "<S-Tab>" = "cmp.mapping.select_prev_item()";

          "<C-Space>" = "cmp.mapping.complete()";

          "<C-l>" = ''
            cmp.mapping(function()
              if require('luasnip').expand_or_locally_jumpable() then
                require('luasnip').expand_or_jump()
              end
            end, { 'i', 's' })
          '';
          "<C-h>" = ''
            cmp.mapping(function()
              if require('luasnip').locally_jumpable(-1) then
                require('luasnip').jump(-1)
              end
            end, { 'i', 's' })
          '';
        };
        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
        ];
      };
    };
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;

    todo-comments = {
      enable = true;
      signs = false;
    };

    mini = {
      enable = true;
      modules = {
        # Better Around/Inside textobjects
        # Examples:
        #  - va)  - [V]isually select [A]round [)]paren
        #  - yinq - [Y]ank [I]nside [N]ext [']quote
        #  - ci'  - [C]hange [I]nside [']quote
        ai = {n_lines = 500;};
        # Add/delete/replace surroundings (brackets, quotes, etc.)
        #
        # - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        # - sd'   - [S]urround [D]elete [']quotes
        # - sr)'  - [S]urround [R]eplace [)] [']
        surround = {};
        statusline = {
          use_icons = true;
        };
      };
    };

    treesitter = {
      enable = true;
      nixvimInjections = true;
      indent = true;
    };
  };

  extraPlugins = [pkgs.vimPlugins.nvim-web-devicons];
}
