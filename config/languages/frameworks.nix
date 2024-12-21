{ pkgs, lib, config, ... }:
{
  options = {
    frameworks.enable = lib.mkEnableOption "Enable frameworks module";
  };
  config = lib.mkIf config.frameworks.enable {
    extraPlugins = with pkgs.vimPlugins; [
      flutter-tools-nvim
      vim-rails
    ];
    extraConfigLua = ''
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "eruby.yaml",
        command = "set filetype=yaml",
      })
    '';
  };
}
