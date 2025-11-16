{ lib, config, ... }:
{
  options = {
    lspkind.enable = lib.mkEnableOption "Enable lspkind module";
  };
  config = lib.mkIf config.lspkind.enable {

    plugins.lspkind = {
      enable = true;
      # Disable cmp integration since we're using blink.cmp
      cmp.enable = false;
      settings = {
        symbolMap = {
          Copilot = "";
        };
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}
