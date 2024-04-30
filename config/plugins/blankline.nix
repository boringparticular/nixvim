{
  opts = {
    list = true;
    listchars = {
      "space" = "⋅";
      "tab" = "•••";
      "eol" = "↴";
    };
    termguicolors = true;
  };
  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = ["|" "¦" "┆" "┊"];
        tab_char = ["|" "¦" "┆" "┊"];
        highlight = [
          "RainbowRed"
          "RainbowYellow"
          "RainbowBlue"
          "RainbowOrange"
          "RainbowGreen"
          "RainbowViolet"
          "RainbowCyan"
        ];
      };
      scope = {
        enabled = true;
        char = "▎";
        show_start = true;
        show_end = true;
      };
    };
  };
}
