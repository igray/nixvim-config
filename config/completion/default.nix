{
  lib,
  config,
  ...
}:
{
  imports = [
    ./claudecode.nix
    ./cmp.nix
    ./copilot.nix
    ./lspkind.nix
  ];

  options = {
    completion.enable = lib.mkEnableOption "Enable completion module";
  };
  config = lib.mkIf config.completion.enable {
    claudecode.enable = lib.mkDefault true;
    cmp.enable = lib.mkDefault true;
    copilot.enable = lib.mkDefault true;
    lspkind.enable = lib.mkDefault true;
  };
}
