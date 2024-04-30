{pkgs, ...}: {
  imports = [
    ./blankline.nix
    ./cmp.nix
    ./conform.nix
    ./gitsigns.nix
    ./lsp.nix
    ./mini.nix
    ./neorg.nix
    ./oil.nix
    ./sourcegraph.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  plugins = {
    comment.enable = true;
    direnv.enable = true;
    emmet.enable = true;
    fidget.enable = true;
    friendly-snippets.enable = true;
    notify.enable = true;
    rainbow-delimiters.enable = true;
    sleuth.enable = true;
  };

  extraPlugins = [pkgs.vimPlugins.nvim-web-devicons];
}
