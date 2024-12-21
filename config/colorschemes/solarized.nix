{ pkgs, lib, config, ... }:
{
  options = {
    solarized.enable = lib.mkEnableOption "Enable solarized module";
  };
  config = lib.mkIf config.solarized.enable {
    extraPlugins = with pkgs.vimPlugins; [
      nvim-solarized-lua
    ];
    colorscheme = "solarized";
    globals = {
      solarized_visibility = "low";
    };
  };
}
