{
  lib,
  config,
  ...
}:
{
  imports = [
    ./avante.nix
    ./cmp.nix
    ./codeium.nix
    ./copilot.nix
    ./lspkind.nix
  ];

  options = {
    completion.enable = lib.mkEnableOption "Enable completion module";
  };
  config = lib.mkIf config.completion.enable {
    avante.enable = lib.mkDefault true;
    cmp.enable = lib.mkDefault true;
    codeium.enable = lib.mkDefault false;
    copilot.enable = lib.mkDefault true;
    lspkind.enable = lib.mkDefault true;
  };
}
