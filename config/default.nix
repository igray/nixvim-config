{ lib, config, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./bufferlines
    ./colorschemes
    ./completion
    ./git
    ./keys.nix
    ./languages
    ./lsp
    ./none-ls
    ./sets
    ./snippets
    ./statusline
    ./telescope
    ./ui
    ./utils
  ];

  bufferlines.enable = lib.mkDefault true;
  colorschemes.enable = lib.mkDefault true;
  completion.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  keys.enable = true;
  languages.enable = true;
  lsp.enable = lib.mkDefault true;
  none-ls.enable = lib.mkDefault false;
  sets.enable = lib.mkDefault true;
  snippets.enable = lib.mkDefault true;
  statusline.enable = lib.mkDefault true;
  telescope.enable = lib.mkDefault true;
  ui.enable = lib.mkDefault true;
  utils.enable = lib.mkDefault true;
}
