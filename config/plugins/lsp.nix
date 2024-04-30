{
  autoGroups = {
    boring-lsp-attach.clear = true;
    boring-lsp-detach.clear = true;
  };

  autoCmd = [
    {
      event = "LspAttach";
      group = "boring-lsp-attach";
      callback = {
        __raw =
          /*
          lua
          */
          ''
            function(event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)

                if client and client.server_capabilities.documentHighlightProvider then
                  local highlight_augroup = vim.api.nvim_create_augroup('boring-lsp-highlight', { clear = true })
                  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                  })

                  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references,
                  })
                end
                if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                  vim.keymap.set('n', '<leader>th', function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                  end, { desc = 'LSP [T]oggle Inlay [H]ints' })
                end
            end
          '';
      };
    }
    {
      event = "LspDetach";
      group = "boring-lsp-detach";
      callback = {
        __raw =
          /*
          lua
          */
          ''
            function(event)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = 'boring-lsp-highlight', buffer = event.buf })
            end
          '';
      };
    }
  ];

  plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      gopls.enable = true;
      html.enable = true;
      htmx.enable = true;
      nixd.enable = true;
      pyright.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true;
      tsserver.enable = true;
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
        "<F2>" = {
          action = "rename";
          desc = "LSP: Rename";
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
