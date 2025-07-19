{
  lib,
  config,
  ...
}:
{
  options = {
    vim-test.enable = lib.mkEnableOption "Enable vim-test module";
  };
  config = lib.mkIf config.vim-test.enable {
    plugins.vim-test = {
      enable = true;
      settings = {
        strategy = {
          file = "neovim";
          nearest = "neovim";
          suite = "neovim";
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>tt";
        action = "<cmd>TestFile<CR>";
        options = {
          desc = "Run File";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tT";
        action = "<cmd>TestSuite<CR>";
        options = {
          desc = "Run All Test Files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tr";
        action = "<cmd>TestNearest<CR>";
        options = {
          desc = "Run Nearest";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tl";
        action = "<cmd>TestLast<CR>";
        options = {
          desc = "Run Last";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tv";
        action = "<cmd>TestVisit<CR>";
        options = {
          desc = "Visit last test file";
          silent = true;
        };
      }
    ];
  };
}
