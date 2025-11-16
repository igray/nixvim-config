{ lib, config, ... }:
{
  options = {
    flash.enable = lib.mkEnableOption "Enable flash.nvim for enhanced navigation";
  };
  config = lib.mkIf config.flash.enable {
    plugins.flash = {
      enable = true;
      settings = {
        # LazyVim defaults
        labels = "asdfghjklqwertyuiopzxcvbnm";
        search = {
          multi_window = true;
          forward = true;
          wrap = true;
          mode = "exact";
          incremental = false;
        };
        jump = {
          jumplist = true;
          pos = "start";
          history = false;
          register = false;
          nohlsearch = false;
          autojump = false;
        };
        label = {
          uppercase = true;
          exclude = "";
          current = true;
          after = true;
          before = false;
          style = "overlay";
          reuse = "lowercase";
          distance = true;
          min_pattern_length = 0;
          rainbow = {
            enabled = false;
            shade = 5;
          };
        };
        highlight = {
          backdrop = true;
          matches = true;
          priority = 5000;
          groups = {
            match = "FlashMatch";
            current = "FlashCurrent";
            backdrop = "FlashBackdrop";
            label = "FlashLabel";
          };
        };
        modes = {
          search = {
            enabled = true;
          };
          char = {
            enabled = true;
            keys = { };
            search = {
              wrap = false;
            };
            highlight = {
              backdrop = true;
            };
            jump = {
              register = false;
            };
          };
          treesitter = {
            labels = "abcdefghijklmnopqrstuvwxyz";
            jump = {
              pos = "range";
            };
            search = {
              incremental = false;
            };
            label = {
              before = true;
              after = true;
              style = "inline";
            };
            highlight = {
              backdrop = false;
              matches = false;
            };
          };
        };
        prompt = {
          enabled = true;
          prefix = [
            [ "⚡" "FlashPromptIcon" ]
          ];
          win_config = {
            relative = "editor";
            width = 1;
            height = 1;
            row = -1;
            col = 0;
            zindex = 1000;
          };
        };
      };
    };

    # LazyVim keymaps
    keymaps = [
      {
        mode = [ "n" "x" "o" ];
        key = "s";
        action = "<cmd>lua require('flash').jump()<cr>";
        options = {
          desc = "Flash";
        };
      }
      {
        mode = [ "n" "x" "o" ];
        key = "S";
        action = "<cmd>lua require('flash').treesitter()<cr>";
        options = {
          desc = "Flash Treesitter";
        };
      }
      {
        mode = "o";
        key = "r";
        action = "<cmd>lua require('flash').remote()<cr>";
        options = {
          desc = "Remote Flash";
        };
      }
      {
        mode = [ "o" "x" ];
        key = "R";
        action = "<cmd>lua require('flash').treesitter_search()<cr>";
        options = {
          desc = "Treesitter Search";
        };
      }
      {
        mode = [ "c" ];
        key = "<c-s>";
        action = "<cmd>lua require('flash').toggle()<cr>";
        options = {
          desc = "Toggle Flash Search";
        };
      }
    ];
  };
}
