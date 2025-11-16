{ lib, config, ... }:
{
  options = {
    which-key.enable = lib.mkEnableOption "Enable which-key module";
  };
  config = lib.mkIf config.which-key.enable {
    plugins.which-key = {
      enable = true;
      settings = {
        icons = {
          breadcrumb = "»";
          group = "+";
          separator = ""; # ➜
        };
        spec = [
          # LazyVim which-key groups
          {
            __unkeyed-1 = "<leader>a";
            mode = [ "n" "v" ];
            group = "+ai";
            icon = "󰧑";
          }
          {
            __unkeyed-1 = "<leader>b";
            mode = "n";
            group = "+buffer";
            icon = "󰓩";
          }
          {
            __unkeyed-1 = "<leader>c";
            mode = [ "n" "v" ];
            group = "+code";
            icon = "󰅩";
          }
          {
            __unkeyed-1 = "<leader>f";
            mode = "n";
            group = "+file/find";
            icon = "󰈞";
          }
          {
            __unkeyed-1 = "<leader>g";
            mode = [ "n" "v" ];
            group = "+git";
            icon = "";
          }
          {
            __unkeyed-1 = "<leader>q";
            mode = "n";
            group = "+quit/session";
            icon = "󰗼";
          }
          {
            __unkeyed-1 = "<leader>s";
            mode = [ "n" "v" ];
            group = "+search";
            icon = "";
          }
          {
            __unkeyed-1 = "<leader><tab>";
            mode = "n";
            group = "+tabs";
            icon = "󰓩";
          }
          {
            __unkeyed-1 = "<leader>u";
            mode = "n";
            group = "+ui";
            icon = "󰙵";
          }
          {
            __unkeyed-1 = "<leader>w";
            mode = "n";
            group = "+windows";
            icon = "";
          }
          {
            __unkeyed-1 = "<leader>x";
            mode = "n";
            group = "+diagnostics/quickfix";
            icon = "󱖫";
          }
          {
            __unkeyed-1 = "[";
            mode = "n";
            group = "+prev";
          }
          {
            __unkeyed-1 = "]";
            mode = "n";
            group = "+next";
          }
          {
            __unkeyed-1 = "g";
            mode = [ "n" "v" ];
            group = "+goto";
          }
          {
            __unkeyed-1 = "gs";
            mode = [ "n" "v" ];
            group = "+surround";
          }
          {
            __unkeyed-1 = "z";
            mode = "n";
            group = "+fold";
          }
        ];
        win = {
          border = "none";
          wo.winblend = 0;
        };
      };
    };
  };
}
