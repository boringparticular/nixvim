{
  plugins.neorg = {
    enable = true;
    lazyLoading = true;
    modules = {
      "core.defaults" = {
        __empty = null;
      };
      "core.concealer" = {
        config = {
          folds = false;
          icon_preset = "basic";
        };
      };
      "core.dirman" = {
        config = {
          workspaces = {
            notes = "~/Nextcloud/notes";
          };
        };
      };
      "core.completion" = {
        engine = "nvim-cmp";
        name = "[Neorg]";
      };
      "core.integrations.treesitter" = {
        configure_parsers = true;
        install_parsers = true;
      };
      "core.integrations.telescope" = {};
    };
  };
}
