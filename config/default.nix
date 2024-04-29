{pkgs, ...}: {
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
}
