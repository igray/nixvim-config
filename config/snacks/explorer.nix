{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    explorer.enable = lib.mkEnableOption "Enable snacks explorer module";
  };
  config = lib.mkIf config.explorer.enable {
    plugins.snacks = {
      settings = {
        explorer = {
          enabled = true;
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = lib.nixvim.mkRaw "function() Snacks.explorer() end";
        options.desc = "File Explerer";
      }
    ];
  };
}
