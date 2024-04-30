{lib, ...}: {
  imports = [
    ./colorscheme.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  autoGroups = {
    boring-highlight-yank = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = "TextYankPost";
      group = "boring-highlight-yank";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
      desc = "Highlight when yanking (copying) text";
    }
  ];

  extraFiles = {
    "after/queries/nix/injections.scm" = lib.mkDefault (lib.mkAfter
      /*
      query
      */
      ''
        ;extends
        (binding [(comment) @c (indented_string_expression) @injection.content]
          (#eq? c "pyhon")
          (#set! injection.language "python"))
      '');
  };
}
