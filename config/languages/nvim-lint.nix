{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    nvim-lint.enable = lib.mkEnableOption "Enable nvim-lint module";
  };
  config = lib.mkIf config.nvim-lint.enable {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        bash = [ "shellcheck" ];
        c = [ "cpplint" ];
        cpp = [ "cpplint" ];
        eruby = [ "erb_lint" ];
        go = [ "golangci-lint" ];
        haskell = [ "hlint" ];
        java = [ "checkstyle" ];
        javascript = [ "eslint_d" ];
        javascriptreact = [ "eslint_d" ];
        json = [ "jsonlint" ];
        lua = [ "selene" ];
        nix = [ "statix" ];
        python = [ "flake8" ];
        typescript = [ "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
      };
    };
    extraPackages = with pkgs; [
      eslint_d
      statix
    ];
    extraConfigLua = ''
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    '';
  };
}
