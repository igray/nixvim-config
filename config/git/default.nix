{
  lib,
  config,
  ...
}:
{
  imports = [
    ./gitsigns.nix
  ];

  options = {
    git.enable = lib.mkEnableOption "Enable git module";
  };
  config = lib.mkIf config.git.enable {
    gitsigns.enable = lib.mkDefault true;
  };
}
