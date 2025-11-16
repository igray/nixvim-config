{ lib, config, ... }:
{
  options = {
    mini.enable = lib.mkEnableOption "Enable mini module";
  };
  config = lib.mkIf config.mini.enable {
    plugins.mini = {
      enable = true;
      modules = {
        comment = {
          options = {
            customCommentString = ''
              <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
            '';
          };
        };
        cursorword = {
          opts = {
            delay = 100;
          };
        };
        # LazyVim core - Enhanced text objects (aa/ia for arguments, function calls, etc.)
        ai = {
          n_lines = 500;
          custom_textobjects = null;
        };
        # LazyVim core - Auto-pairing brackets, quotes, etc.
        pairs = { };
        # LazyVim core - Surround text objects with brackets, quotes, etc.
        surround = { };
      };
    };
  };
}
