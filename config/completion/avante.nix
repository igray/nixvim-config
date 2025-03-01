{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    avante.enable = lib.mkEnableOption "Enable avante module";
  };
  config = lib.mkIf config.avante.enable {
    extraPackages = with pkgs; [
      curl
    ];
    extraPlugins = with pkgs.vimPlugins; [
      img-clip-nvim
    ];
    plugins.avante = {
      enable = true;
      package = pkgs.vimPlugins.avante-nvim;
      settings = {
        claude.model = "claude-3-7-sonnet-20250219";
        behaviour = {
          auto_suggestions = false;
        };
      };
    };
  };
}
