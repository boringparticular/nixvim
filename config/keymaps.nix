{
  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }

    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }

    {
      mode = "n";
      key = "<left>";
      action = "<cmd>echo 'Use h to move !! '<CR>";
    }
    {
      mode = "n";
      key = "<right>";
      action = "<cmd>echo 'Use l to move !! '<CR>";
    }
    {
      mode = "n";
      key = "<up>";
      action = "<cmd>echo 'Use k to move !! '<CR>";
    }
    {
      mode = "n";
      key = "<down>";
      action = "<cmd>echo 'Use j to move !! '<CR>";
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options.desc = "Move focus to the left window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options.desc = "Move focus to the right window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options.desc = "Move focus to the lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options.desc = "Move focus to the upper window";
    }

    {
      key = "n";
      action = "nzzzv";
      mode = "n";
      options.desc = "Move to next search result and center line";
    }
    {
      key = "N";
      action = "Nzzzv";
      mode = "n";
      options.desc = "Move to previous search result and center line";
    }
    {
      key = "<C-d>";
      action = "<C-d>zz";
      mode = "n";
      options.desc = "Scroll half page down and center line";
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      mode = "n";
      options.desc = "Scroll half page up and center line";
    }
  ];
}
