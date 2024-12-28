{ lib, config, ... }:
{
  options = {
    image-nvim.enable = lib.mkEnableOption "Enable image-nvim module";
  };
  config = lib.mkIf config.image-nvim.enable {
    plugins = {
      image = {
        enable = true;
      };
    };
  };
}
