{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      term_colors = true;
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
}
