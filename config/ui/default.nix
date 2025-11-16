{
  lib,
  config,
  ...
}:
{
  imports = [
    ./dressing-nvim.nix
    ./grug-far.nix
    ./image-nvim.nix
    ./noice.nix
    ./nui.nix
    ./utility.nix
    ./web-devicons.nix
  ];

  options = {
    ui.enable = lib.mkEnableOption "Enable ui module";
  };
  config = lib.mkIf config.ui.enable {
    dressing-nvim.enable = lib.mkDefault false;
    grug-far.enable = lib.mkDefault true;
    image-nvim.enable = lib.mkDefault false;
    noice.enable = lib.mkDefault true;  # LazyVim core plugin
    nui.enable = lib.mkDefault true;
    utility.enable = lib.mkDefault true;
    web-devicons.enable = lib.mkDefault true;
  };
}
