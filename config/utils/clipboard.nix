{ lib, config, ... }:
{
  options = {
    clipboard.enable = lib.mkEnableOption "Enable clipboard module";
  };
  config = lib.mkIf config.clipboard.enable {
    clipboard.providers = {
      wl-copy.enable = true;
    };
    opts.clipboard = [ "unnamedplus" ];
  };
}
