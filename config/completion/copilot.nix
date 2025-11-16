{ lib, config, ... }:
{
  options = {
    copilot.enable = lib.mkEnableOption "Enable copilot module";
  };
  config = lib.mkIf config.copilot.enable {
    plugins.copilot-lua = {
      enable = true;
      settings = {
        # Disable panel, but keep suggestions enabled for inline completions
        panel.enabled = false;
        suggestion = {
          enabled = true;
          auto_trigger = true;
          debounce = 75;
          keymap = {
            accept = "<Tab>";
            accept_word = false;
            accept_line = false;
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
        copilot_node_command = "node"; # Node.js version must be > 18.x
        server_opts_override = { };
      };
    };
  };
}
