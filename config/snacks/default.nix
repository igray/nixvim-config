{
  lib,
  config,
  ...
}:
{
  imports = [
    ./snacks-nvim.nix
  ];

  options = {
    snacks.enable = lib.mkEnableOption "Enable snacks module";
  };
  config = lib.mkIf config.snacks.enable {
    snacks-nvim.enable = lib.mkDefault true;
  };
}
