{ lib, config, ... }:
{
  options = {
    autocmds.enable = lib.mkEnableOption "Enable LazyVim auto-commands";
  };
  config = lib.mkIf config.autocmds.enable {
    autoGroups = {
      lazyvim_auto_create_dir = {
        clear = true;
      };
      lazyvim_close_with_q = {
        clear = true;
      };
      lazyvim_highlight_yank = {
        clear = true;
      };
      lazyvim_resize_splits = {
        clear = true;
      };
      lazyvim_wrap_spell = {
        clear = true;
      };
      lazyvim_last_loc = {
        clear = true;
      };
    };

    autoCmd = [
      # Auto create directories when saving files
      {
        event = [ "BufWritePre" ];
        group = "lazyvim_auto_create_dir";
        callback.__raw = ''
          function(event)
            if event.match:match("^%w%w+:[\\/][\\/]") then
              return
            end
            local file = vim.uv.fs_realpath(event.match) or event.match
            vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
          end
        '';
        desc = "Auto create dir when saving a file";
      }

      # Close certain filetypes with <q>
      {
        event = [ "FileType" ];
        group = "lazyvim_close_with_q";
        pattern = [
          "PlenaryTestPopup"
          "checkhealth"
          "dbout"
          "gitsigns.blame"
          "grug-far"
          "help"
          "lspinfo"
          "neotest-output"
          "neotest-output-panel"
          "neotest-summary"
          "notify"
          "qf"
          "snacks_win"
          "spectre_panel"
          "startuptime"
          "tsplayground"
        ];
        callback.__raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
            vim.keymap.set("n", "q", "<cmd>close<cr>", {
              buffer = event.buf,
              silent = true,
              desc = "Quit buffer",
            })
          end
        '';
        desc = "Close with q";
      }

      # Highlight text on yank
      {
        event = [ "TextYankPost" ];
        group = "lazyvim_highlight_yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank({ timeout = 200 })
          end
        '';
        desc = "Highlight on yank";
      }

      # Resize splits on window resize
      {
        event = [ "VimResized" ];
        group = "lazyvim_resize_splits";
        callback.__raw = ''
          function()
            local current_tab = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. current_tab)
          end
        '';
        desc = "Resize splits on window resize";
      }

      # Enable wrap and spell check for certain filetypes
      {
        event = [ "FileType" ];
        group = "lazyvim_wrap_spell";
        pattern = [ "text" "plaintex" "typst" "gitcommit" "markdown" ];
        callback.__raw = ''
          function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
          end
        '';
        desc = "Wrap and check for spell in text filetypes";
      }

      # Go to last location when opening a buffer
      {
        event = [ "BufReadPost" ];
        group = "lazyvim_last_loc";
        callback.__raw = ''
          function(event)
            local exclude = { "gitcommit" }
            local buf = event.buf
            if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
              return
            end
            vim.b[buf].lazyvim_last_loc = true
            local mark = vim.api.nvim_buf_get_mark(buf, '"')
            local lcount = vim.api.nvim_buf_line_count(buf)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
        desc = "Go to last location when opening a buffer";
      }
    ];
  };
}
