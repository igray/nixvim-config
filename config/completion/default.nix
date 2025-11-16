{
  lib,
  config,
  ...
}:
{
  imports = [
    ./blink.nix
    ./claudecode.nix
    ./cmp.nix
    ./copilot.nix
    ./lspkind.nix
  ];

  options = {
    completion.enable = lib.mkEnableOption "Enable completion module";
  };
  config = lib.mkIf config.completion.enable {
    # Use blink.cmp instead of nvim-cmp (LazyVim blink extra)
    blink.enable = lib.mkDefault true;
    claudecode.enable = lib.mkDefault true;
    cmp.enable = lib.mkDefault false;
    copilot.enable = lib.mkDefault true;
    lspkind.enable = lib.mkDefault true;
  };
}
