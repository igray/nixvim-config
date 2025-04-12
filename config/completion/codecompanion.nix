{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    codecompanion.enable = lib.mkEnableOption "Enable codecompanion module";
  };
  config = lib.mkIf config.codecompanion.enable {
    plugins.codecompanion = {
      enable = true;
      settings = {
        strategies = {
          chat = {
            slash_commands = {
              buffer = {
                opts = {
                  provider = "snacks";
                };
              };
              file = {
                opts = {
                  provider = "snacks";
                };
              };
              help = {
                opts = {
                  provider = "snacks";
                };
              };
              symbols = {
                opts = {
                  provider = "snacks";
                };
              };
            };
          };
        };
      };
    };
    # extraPlugins = [
    #   (pkgs.vimUtils.buildVimPlugin {
    #     name = "vectorcode";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "Davidyz";
    #       repo = "VectorCode";
    #       rev = "6863fd8f551b7b9c0fb56ae9917a713bd5d70d97";
    #       hash = "sha256-Vfo+wY51b3triiDhURlMl1iKNlYDy7eqEtT9/RVNZCM=";
    #     };
    #   })
    # ];
  };
}
