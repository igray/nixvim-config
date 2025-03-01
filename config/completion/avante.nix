{
  lib,
  config,
  unstable,
  ...
}:
{
  options = {
    avante.enable = lib.mkEnableOption "Enable avante module";
  };
  config = lib.mkIf config.avante.enable {
    plugins.avante = {
      enable = true;
      package = unstable.vimPlugins.avante-nvim;
      settings = {
        claude.model = "claude-3-7-sonnet-20250219";
        behaviour = {
          auto_suggestions = false;
        };
      };
    };
  };
}
