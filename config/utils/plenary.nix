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
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Override plenary's curl function to see the actual command
          local Job = require('plenary.job')
          local original_new = Job.new
          Job.new = function(opts)
            if opts.command == 'curl' then
              vim.notify("Curl command:", vim.inspect(opts))
            end
            return original_new(opts)
          end
        end,
      })
    '';
  };
}
