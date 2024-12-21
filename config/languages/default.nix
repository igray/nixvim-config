{
  lib,
  config,
  ...
}:
{
  imports = [
    ./frameworks.nix
    ./treesitter-nvim.nix
    ./nvim-jdtls.nix
    ./nvim-lint.nix
  ];

  options = {
    languages.enable = lib.mkEnableOption "Enable languages module";
  };
  config = lib.mkIf config.languages.enable {
    frameworks.enable = lib.mkDefault true;
    treesitter-nvim.enable = lib.mkDefault true;
    nvim-jdtls.enable = lib.mkDefault false;
    nvim-lint.enable = lib.mkDefault true;
  };
}
