{ lib, config, ... }:
{
  options = {
    copilot.enable = lib.mkEnableOption "Enable copilot module";
  };
  config = lib.mkIf config.copilot.enable {
    plugins.copilot-lua = {
      enable = true;
      settings = {
        panel = {
          enabled = false;
          autoRefresh = true;
          keymap = {
            jumpPrev = "[[";
            jumpNext = "]]";
            accept = "<CR>";
            refresh = "gr";
            open = "<M-CR>";
          };
          layout = {
            position = "bottom"; # | top | left | right
            ratio = 0.4;
          };
        };
        suggestion = {
          enabled = false;
          autoTrigger = true;
          debounce = 75;
          keymap = {
            accept = "<M-l>";
            acceptWord = false;
            acceptLine = false;
            next = "<M-]>";
            prev = "<M-[>";
            dismiss = "<C-]>";
          };
        };
        filetypes = {
          # LazyVim enables markdown and help
          yaml = false;
          markdown = true;
          help = true;
          gitcommit = false;
          gitrebase = false;
          hgcommit = false;
          svn = false;
          cvs = false;
          "." = false;
        };
        copilotNodeCommand = "node"; # Node.js version must be > 18.x
        serverOptsOverrides = { };
      };
    };
    plugins.copilot-chat = {
      enable = true;
      settings = {
        model = "gemini-2.5-pro";
        # LazyVim configuration
        auto_insert_mode = true;
        show_help = true;
        question_header = "## User ";
        answer_header = "## Copilot ";
        window = {
          layout = "float";
          width = 0.8;
          height = 0.6;
        };
      };
    };

    # LazyVim Copilot Chat keymaps
    keymaps = [
      {
        mode = [ "n" "v" ];
        key = "<leader>aa";
        action = "<cmd>CopilotChatToggle<cr>";
        options = {
          desc = "Toggle Copilot Chat";
        };
      }
      {
        mode = [ "n" "v" ];
        key = "<leader>ax";
        action = "<cmd>CopilotChatReset<cr>";
        options = {
          desc = "Clear Copilot Chat";
        };
      }
      {
        mode = [ "n" "v" ];
        key = "<leader>aq";
        action = ''
          function()
            local input = vim.fn.input("Quick Chat: ")
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end
        '';
        options = {
          desc = "Quick Chat";
        };
      }
      {
        mode = [ "n" "v" ];
        key = "<leader>ap";
        action = "<cmd>CopilotChatCommitStaged<cr>";
        options = {
          desc = "Generate commit message";
        };
      }
    ];
    extraLuaPackages = p: [
      p.tiktoken_core
    ];
  };
}
