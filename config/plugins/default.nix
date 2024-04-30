{pkgs, ...}: {
  imports = [
    ./cmp.nix
    ./conform.nix
    ./gitsigns.nix
    ./lsp.nix
    ./mini.nix
    ./neorg.nix
    ./sourcegraph.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  plugins = {
    comment.enable = true;
    fidget.enable = true;
    friendly-snippets.enable = true;
    sleuth.enable = true;
  };

  extraPlugins = [pkgs.vimPlugins.nvim-web-devicons];
}
