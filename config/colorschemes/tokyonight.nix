{ lib, config, ... }:
{
  options = {
    tokyonight.enable = lib.mkEnableOption "Enable tokyonight colorscheme (LazyVim default)";
  };
  config = lib.mkIf config.tokyonight.enable {
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        # LazyVim uses tokyonight-moon style
        style = "moon";
        transparent = false;
        terminal_colors = true;
        styles = {
          comments = { italic = true; };
          keywords = { italic = true; };
          functions = { };
          variables = { };
          sidebars = "dark";
          floats = "dark";
        };
        sidebars = [ "qf" "help" ];
        day_brightness = 0.3;
        hide_inactive_statusline = false;
        dim_inactive = false;
        lualine_bold = false;

        # LazyVim customizations
        on_colors = ''
          function(colors) end
        '';
        on_highlights = ''
          function(highlights, colors) end
        '';
      };
    };
  };
}
