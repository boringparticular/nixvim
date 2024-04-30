{
  plugins.oil = {
    enable = true;
    settings = {
      delete_to_trash = true;
      use_default_keymaps = true;
      lsp_file_method.autosave_changes = true;
      buf_options = {
        buflisted = true;
        bufhidden = "hide";
      };
      view_options.show_hidden = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "-";
      action = "require('oil').open";
      lua = true;
      options = {
        desc = "Open parent directory";
      };
    }
  ];
}
