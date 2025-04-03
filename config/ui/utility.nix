{
  lib,
  config,
  ...
}:

{
  options = {
    utility.enable = lib.mkEnableOption "Enable utility module";
  };
  config = lib.mkIf config.utility.enable {
    extraConfigLua = ''
      function ToggleLineNumber()
        if vim.wo.number then
          vim.wo.number = false
          vim.notify("Line numbers disabled", "info")
        else
          vim.wo.number = true
          vim.wo.relativenumber = false
          vim.notify("Line numbers enabled", "info")
        end
      end

      function ToggleRelativeLineNumber()
        if vim.wo.relativenumber then
          vim.wo.relativenumber = false
          vim.notify("Relative line numbers disabled", "info")
        else
          vim.wo.relativenumber = true
          vim.wo.number = false
          vim.notify("Relative line numbers enabled", "info")
        end
      end

      function ToggleWrap()
        if vim.wo.wrap then
         vim.wo.wrap = false
          vim.notify("Wrap disabled", "info")
        else
          vim.wo.wrap = true
          vim.wo.number = false
          vim.notify("Wrap enabled", "info")
        end
      end

      function ToggleInlayHints()
        local is_enabled = vim.lsp.inlay_hint.is_enabled()
        vim.lsp.inlay_hint.enable(not is_enabled)
        if is_enabled then
          vim.notify("Inlay Hints disabled", "info")
        else
          vim.notify("Inlay Hints enabled", "info")
        end
      end

      vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function()
          local current_dir = vim.fn.getcwd()
          local is_nixpkgs = current_dir:match("nixpkgs$")
          if is_nixpkgs then
            vim.b.disable_autoformat = true
            vim.notify("Autoformat-on-save disabled for nixpkgs", "info")
          else
            vim.b.disable_autoformat = false
          end
        end,
      })

      vim.api.nvim_create_user_command("FormatToggle", function(args)
        local is_global = not args.bang
        local current_dir = vim.fn.getcwd()
        local is_nixpkgs = current_dir:match("nixpkgs$")

        if is_global then
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          if vim.g.disable_autoformat then
            vim.notify("Autoformat-on-save disabled globally", "info")
          else
            vim.notify("Autoformat-on-save enabled globally", "info")
          end
        elseif is_nixpkgs then
          vim.b.disable_autoformat = not vim.b.disable_autoformat
          if vim.b.disable_autoformat then
            vim.notify("Autoformat-on-save disabled for nixpkgs", "info")
          else
            vim.notify("Autoformat-on-save enabled for nixpkgs", "info")
          end
        else
          vim.b.disable_autoformat = not vim.b.disable_autoformat
          if vim.b.disable_autoformat then
            vim.notify("Autoformat-on-save disabled for this buffer", "info")
          else
            vim.notify("Autoformat-on-save enabled for this buffer", "info")
          end
        end
      end, {
        desc = "Toggle autoformat-on-save",
        bang = true,
      })
    '';
  };
}
