{pkgs, ...}: {
  imports = [
    ./cmp.nix
    ./conform.nix
    ./gitsigns.nix
    ./lsp.nix
    ./mini.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  plugins = {
    comment.enable = true;
    fidget.enable = true;
    sleuth.enable = true;
  };

  extraPlugins = [pkgs.vimPlugins.nvim-web-devicons];
}
