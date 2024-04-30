{
  plugins = {
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
          {name = "cody";}
          {name = "nvim_lsp";}
          {name = "nvim_lsp_signature_help";}
          {name = "nvim_lsp_document_symbol";}
          {name = "luasnip";}
          {name = "nvim_lua";}
          {
            name = "buffer";
            keyword_length = 5;
          }
          {name = "treesitter";}
          {
            name = "path";
            max_item_count = 5;
          }
        ];
      };
    };
    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
    cmp-treesitter.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;
    cmp-path.enable = true;
  };
}
