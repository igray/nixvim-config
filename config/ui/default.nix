{
  lib,
  config,
  ...
}:
{
  imports = [
    ./barbecue.nix
    ./grug-far.nix
    ./noice.nix
    ./nui.nix
    ./utility.nix
    ./web-devicons.nix
  ];

  options = {
    ui.enable = lib.mkEnableOption "Enable ui module";
  };
  config = lib.mkIf config.ui.enable {
    barbecue.enable = lib.mkDefault true;
    grug-far.enable = lib.mkDefault true;
    noice.enable = lib.mkDefault true; # LazyVim core plugin
    nui.enable = lib.mkDefault true;
    utility.enable = lib.mkDefault true;
    web-devicons.enable = lib.mkDefault true;
  };
}
