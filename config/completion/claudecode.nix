{ lib, config, pkgs, ... }:
{
  options = {
    claudecode.enable = lib.mkEnableOption "Enable claudecode.nvim for Claude Code integration";
  };
  config = lib.mkIf config.claudecode.enable {
    # claudecode.nvim requires the extraPlugins approach as it's not in nixpkgs yet
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "claudecode.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "anthropics";
          repo = "claudecode.nvim";
          rev = "main";  # Pin to a specific commit in production
          sha256 = lib.fakeSha256;  # Replace with actual sha256 after first build
        };
      })
    ];

    extraConfigLua = ''
      -- claudecode.nvim LazyVim configuration
      require('claudecode').setup({
        -- LazyVim defaults
        provider = "anthropic",
        auto_start = false,
        show_diff = true,
        keymap_accept = "<leader>aa",
        keymap_reject = "<leader>ad",
      })
    '';

    # LazyVim Claudecode keymaps
    keymaps = [
      {
        mode = "n";
        key = "<leader>ac";
        action = "<cmd>ClaudeCode<cr>";
        options = {
          desc = "Toggle Claude Code";
        };
      }
      {
        mode = "n";
        key = "<leader>af";
        action = "<cmd>ClaudeCodeFocus<cr>";
        options = {
          desc = "Focus Claude Code";
        };
      }
      {
        mode = "n";
        key = "<leader>ar";
        action = "<cmd>ClaudeCodeResume<cr>";
        options = {
          desc = "Resume Claude Code";
        };
      }
      {
        mode = "n";
        key = "<leader>aC";
        action = "<cmd>ClaudeCodeContinue<cr>";
        options = {
          desc = "Continue Claude Code";
        };
      }
      {
        mode = "n";
        key = "<leader>ab";
        action = "<cmd>ClaudeCodeAddBuffer<cr>";
        options = {
          desc = "Add buffer to Claude Code";
        };
      }
      {
        mode = [ "v" "n" ];
        key = "<leader>as";
        action = "<cmd>ClaudeCodeSend<cr>";
        options = {
          desc = "Send to Claude Code";
        };
      }
      {
        mode = "n";
        key = "<leader>aa";
        action = "<cmd>ClaudeCodeAccept<cr>";
        options = {
          desc = "Accept Claude Code diff";
        };
      }
      {
        mode = "n";
        key = "<leader>ad";
        action = "<cmd>ClaudeCodeReject<cr>";
        options = {
          desc = "Reject Claude Code diff";
        };
      }
    ];
  };
}
