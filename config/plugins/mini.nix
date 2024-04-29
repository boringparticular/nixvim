{
  plugins.mini = {
    enable = true;
    modules = {
      # Better Around/Inside textobjects
      # Examples:
      #  - va)  - [V]isually select [A]round [)]paren
      #  - yinq - [Y]ank [I]nside [N]ext [']quote
      #  - ci'  - [C]hange [I]nside [']quote
      ai = {n_lines = 500;};
      # Add/delete/replace surroundings (brackets, quotes, etc.)
      #
      # - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      # - sd'   - [S]urround [D]elete [']quotes
      # - sr)'  - [S]urround [R]eplace [)] [']
      surround = {};
      statusline = {
        use_icons = true;
      };
    };
  };
}
