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
    extraPlugins = with pkgs.vimPlugins; [
      img-clip-nvim
    ];
    plugins.avante = {
      enable = true;
      package = pkgs.vimPlugins.avante-nvim;
      settings = {
        providers = {
          copilot = {
            model = "claude-sonnet-4";
          };
        };
        behaviour = {
          auto_suggestions = false;
        };
      };
    };
  };
}
