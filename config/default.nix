{lib, ...}: {
  imports = [
    ./colorscheme.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  autoGroups = {
    kickstart-highlight-yank = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = "TextYankPost";
      group = "kickstart-highlight-yank";
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
    "after/queries/nix/injections.scm" = lib.mkDefault (lib.mkAfter ''
      ;extends
      (binding [(comment) @c (indented_string_expression) @injection.content]
        (#eq? c "pyhon")
        (#set! injection.language "python"))
    '');
  };
}
