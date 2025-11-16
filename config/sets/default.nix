{
  lib,
  config,
  ...
}:
{
  imports = [
    ./autocmds.nix
    ./set.nix
  ];

  options = {
    sets.enable = lib.mkEnableOption "Enable sets module";
  };
  config = lib.mkIf config.sets.enable {
    autocmds.enable = lib.mkDefault true;
    set.enable = lib.mkDefault true;
  };
}
