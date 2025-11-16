{ lib, config, pkgs, ... }:
{
  options = {
    lazydev.enable = lib.mkEnableOption "Enable lazydev.nvim for Neovim Lua development";
  };
  config = lib.mkIf config.lazydev.enable {
    plugins.lazydev = {
      enable = true;
      settings = {
        library = [
          { path = "luvit-meta/library"; words = [ "vim%.uv" ]; }
        ];
        # LazyVim defaults
        runtime = "~/Work/nixvim-config";
        enabled = true;
        debug = false;
      };
    };

    # Add luvit types for vim.uv (LazyVim pattern)
    extraPlugins = [
      {
        plugin = pkgs.vimUtils.buildVimPlugin {
          name = "luvit-meta";
          src = pkgs.fetchFromGitHub {
            owner = "Bilal2453";
            repo = "luvit-meta";
            rev = "ce76f6f6cdc9201523a5875a4471dcfe0186eb60";
            sha256 = "sha256-zAAptV/oLuLAAsa2zSB/6fxlElk4+jNZd/cPr9oxFig=";
          };
        };
        optional = true;
      }
    ];
  };
}
