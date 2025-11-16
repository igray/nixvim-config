{
  lib,
  config,
  ...
}:
{
  imports = [
    ./clipboard.nix
    ./mini.nix
    ./nvterm.nix
    ./persistence.nix
    ./plenary.nix
    ./project-nvim.nix
    ./snacks.nix
    ./tmux-navigator.nix
    ./todo-comments.nix
    ./which-key.nix
  ];

  options = {
    utils.enable = lib.mkEnableOption "Enable utils module";
  };
  config = lib.mkIf config.utils.enable {
    clipboard.enable = lib.mkDefault true;
    mini.enable = lib.mkDefault true;
    nvterm.enable = lib.mkDefault false;
    persistence.enable = lib.mkDefault true;
    plenary.enable = lib.mkDefault true;
    project-nvim.enable = lib.mkDefault false;
    snacks.enable = lib.mkDefault true;
    tmux-navigator.enable = lib.mkDefault true;
    todo-comments.enable = lib.mkDefault true;
    which-key.enable = lib.mkDefault true;
  };
}
