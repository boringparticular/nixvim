{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      term_colors = true;
      integrations = {
        cmp = true;
        gitsigns = true;
        rainbow_delimiters = true;
        treesitter_context = true;
        indent_blankline = {
          enable = true;
          scope_color = "lavender";
          colored_indent_levels = true;
        };
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
