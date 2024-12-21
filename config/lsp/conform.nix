{ lib, config, ... }:
{
  options = {
    conform.enable = lib.mkEnableOption "Enable conform module";
  };
  config = lib.mkIf config.conform.enable {

    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        # default_format_opts = {
        #   lsp_format = "fallback";
        # };
        # format_after_save = {
        #   lsp_format = "fallback";
        # };
        format_on_save = ''
          function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            return { timeout_ms = 500, lsp_format = 'fallback' }
          end
        '';
        formatters_by_ft = {
          css = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          dart = [ "dart_format" ];
          elm = [ "elm_format" ];
          fish = [ "fish_indent" ];
          gleam = [ "gleam" ];
          html = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          java = [ "google-java-format" ];
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          javascriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          markdown = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          python = [ "black" ];
          roc = [ "roc" ];
          ruby = [ "rubocop" ];
          rust = [ "rustfmt" ];
          sh = [ "shfmt" ];
          sql = [ "sqlfluff" ];
          typescript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>uf";
        action = ":FormatToggle<CR>";
        options = {
          desc = "Toggle Format Globally";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>uF";
        action = ":FormatToggle!<CR>";
        options = {
          desc = "Toggle Format Locally";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cf";
        action = "<cmd>lua require('conform').format()<cr>";
        options = {
          silent = true;
          desc = "Format Buffer";
        };
      }

      {
        mode = "v";
        key = "<leader>cF";
        action = "<cmd>lua require('conform').format()<cr>";
        options = {
          silent = true;
          desc = "Format Lines";
        };
      }
    ];
  };
}
