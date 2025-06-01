{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    plenary.enable = lib.mkEnableOption "Enable plenary module";
  };
  config = lib.mkIf config.plenary.enable {
    extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim
    ];
    extraConfigLua = ''
      -- Force plenary to use system curl
      vim.g.plenary_curl_bin_path = "${pkgs.curl}/bin/curl"
    '';
  };
}
