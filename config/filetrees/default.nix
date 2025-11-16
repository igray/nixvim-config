{
  lib,
  config,
  ...
}:
{
  imports = [
  ];

  options = {
    filetrees.enable = lib.mkEnableOption "Enable filetrees module";
  };
  config = lib.mkIf config.filetrees.enable {
  };
}
