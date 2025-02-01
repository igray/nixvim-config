{
  lib,
  config,
  ...
}:

{
  options = {
    grug-far.enable = lib.mkEnableOption "Enable grug-far module";
  };
  config = lib.mkIf config.grug-far.enable {
    plugins.grug-far.enable = true;
    keymaps = [
      {
        mode = "n";
        key = "<leader>sr";
        action = ''
          <cmd>GrugFar<cr>
        '';
        options = {
          desc = "Search/Replace";
        };
      }
    ];
  };
}
