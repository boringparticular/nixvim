{
  keymaps = [
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

  plugins.conform-nvim = {
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
      python = ["isort" "black"];
      javascript = ["prettierd"];
      typescript = ["prettierd"];
      go = [["gofumpt" "gofmt"]];
      just = ["just"];
      "*" = ["injected"];
      _ = ["trim_whitespace"];
    };
  };
}
