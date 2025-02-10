{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    snacks-nvim.enable = lib.mkEnableOption "Enable snacks-nvim module";
  };
  config = lib.mkIf config.snacks-nvim.enable {
    plugins.snacks = {
      enable = true;
      settings = {
        bigfile.enabled = true;
        statuscolumn.enabled = true;
        words.enabled = true;
        quickfile.enabled = true;
        notifier.enabled = true;
        picker.enabled = true;
      };
    };
  };
}
