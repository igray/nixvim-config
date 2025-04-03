{
  lib,
  config,
  ...
}:
{
  imports = [
    ./alpha.nix
    ./barbecue.nix
    ./dressing-nvim.nix
    ./grug-far.nix
    ./image-nvim.nix
    ./indent-blankline.nix
    ./noice.nix
    ./nui.nix
    ./notify.nix
    ./utility.nix
    ./web-devicons.nix
  ];

  options = {
    ui.enable = lib.mkEnableOption "Enable ui module";
  };
  config = lib.mkIf config.ui.enable {
    alpha.enable = lib.mkDefault false;
    barbecue.enable = lib.mkDefault true;
    dressing-nvim.enable = lib.mkDefault false;
    grug-far.enable = lib.mkDefault true;
    image-nvim.enable = lib.mkDefault false;
    indent-blankline.enable = lib.mkDefault false;
    noice.enable = lib.mkDefault false;
    notify.enable = lib.mkDefault false;
    nui.enable = lib.mkDefault true;
    utility.enable = lib.mkDefault true;
    web-devicons.enable = lib.mkDefault true;
  };
}
