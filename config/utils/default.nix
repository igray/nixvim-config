{
  lib,
  config,
  ...
}:
{
  imports = [
    ./clipboard.nix
    ./colorizer.nix
    ./flash.nix
    ./mini.nix
    ./persistence.nix
    ./plenary.nix
    ./snacks.nix
    ./tmux-navigator.nix
    ./todo-comments.nix
    ./vim-test.nix
    ./which-key.nix
    ./zk.nix
  ];

  options = {
    utils.enable = lib.mkEnableOption "Enable utils module";
  };
  config = lib.mkIf config.utils.enable {
    clipboard.enable = lib.mkDefault true;
    colorizer.enable = lib.mkDefault true;
    flash.enable = lib.mkDefault true;
    mini.enable = lib.mkDefault true;
    persistence.enable = lib.mkDefault true;
    plenary.enable = lib.mkDefault true;
    snacks.enable = lib.mkDefault true;
    tmux-navigator.enable = lib.mkDefault true;
    todo-comments.enable = lib.mkDefault true;
    vim-test.enable = lib.mkDefault true;
    which-key.enable = lib.mkDefault true;
    zk.enable = lib.mkDefault true;
  };
}
