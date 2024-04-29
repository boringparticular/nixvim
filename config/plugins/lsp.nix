{
  plugins.lsp = {
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
      diagnostic = {
        "[d" = {
          action = "goto_prev";
          desc = "Go to previous [D]iagnostic message";
        };
        "]d" = {
          action = "goto_next";
          desc = "Go to next [D]iagnostic message";
        };
        "<leader>e" = {
          action = "open_float";
          desc = "Show diagnostic [E]rror messages";
        };
        "<leader>q" = {
          action = "setloclist";
          desc = "Open diagnostic [Q]uickfix list";
        };
      };
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
}
