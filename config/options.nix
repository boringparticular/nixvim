{
  globals.mapleader = " ";
  globals.maplocalleader = " ";

  opts = {
    fileformat = "unix";
    number = true;
    relativenumber = true;
    mouse = "a";
    showmode = false;
    clipboard = "unnamedplus";
    breakindent = true;
    swapfile = false;
    undofile = true;
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";
    updatetime = 250;
    timeoutlen = 300;
    splitright = true;
    splitbelow = true;
    list = true;
    listchars = {
      tab = "» ";
      trail = "·";
      nbsp = "␣";
    };
    inccommand = "split";
    cursorline = true;
    cursorcolumn = true;
    scrolloff = 10;
    sidescrolloff = 5;
    hlsearch = true;
    foldcolumn = "auto";
  };
}
