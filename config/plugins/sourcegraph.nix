{pkgs, ...}: {
  keymaps = [
    {
      mode = "n";
      key = "<Leader>tc";
      action = "<cmd>CodyToggle<CR>";
      options.desc = "[T]oggle [C]ody chat";
    }
  ];
  extraPlugins = [
    pkgs.vimPlugins.sg-nvim
  ];

  extraConfigLua = ''
    require('sg').setup({
        accept_tos = true,
        enable_cody = true,
        download_binaries = false,
    })
  '';
}
