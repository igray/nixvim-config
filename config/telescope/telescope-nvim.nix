{ pkgs, lib, config, ... }:
{
  options = {
    telescope-nvim.enable = lib.mkEnableOption "Enable telescope-nvim module";
  };
  config = lib.mkIf config.telescope-nvim.enable {
    extraPlugins = with pkgs.vimPlugins; [
      telescope-file-browser-nvim
    ];
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            fuzzy = true;
            override_generic_sorter = true;
            override_file_sorter = true;
            case_mode = "smart_case";
          };
        };
        ui-select = {
          enable = true;
          settings = {
            specific_opts = {
              codeactions = true;
            };
          };
        };
      };
      # If you'd prefer Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
      settings = {
        defaults = {
          mappings = {
            i = {
              "<esc>" = {
                __raw = ''
                  function(...)
                    return require("telescope.actions").close(...)
                  end'';
              };
              "<C-d>" = lib.nixvim.mkRaw ''
                function(...)
                  local action_state = require("telescope.actions.state")
                  local fb = require("telescope").extensions.file_browser
                  local live_grep = require("telescope.builtin").live_grep
                  local current_line = action_state.get_current_line()

                  fb.file_browser({
                    files = false,
                    depth = false,
                    attach_mappings = function()
                      require("telescope.actions").select_default:replace(function()
                        local entry_path = action_state.get_selected_entry().Path
                        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
                        local relative = dir:make_relative(vim.fn.getcwd())
                        local absolute = dir:absolute()

                        live_grep({
                          results_title = relative .. "/",
                          cwd = absolute,
                          default_text = current_line,
                        })
                      end)

                      return true
                    end,
                  })
                end
              '';
            };
          };
        };
        pickers = {
          colorscheme = {
            enable_preview = true;
          };
          # find_files = {
          #   theme = "ivy";
          # };
        };
      };
      keymaps = {
        "<leader><space>" = {
          action = "find_files";
          options.desc = "Find project files";
        };
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Grep (root dir)";
        };
        "<leader>:" = {
          action = "command_history";
          options.desc = "Command History";
        };
        "<leader>b" = {
          action = "buffers";
          options.desc = "+buffer";
        };
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find project files";
        };
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Recent";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Buffers";
        };
        "<C-p>" = {
          action = "git_files";
          options.desc = "Search git files";
        };
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "Commits";
        };
        "<leader>gs" = {
          action = "git_status";
          options.desc = "Status";
        };
        "<leader>sa" = {
          action = "autocommands";
          options.desc = "Auto Commands";
        };
        "<leader>sb" = {
          action = "current_buffer_fuzzy_find";
          options.desc = "Buffer";
        };
        "<leader>sc" = {
          action = "command_history";
          options.desc = "Command History";
        };
        "<leader>sC" = {
          action = "commands";
          options.desc = "Commands";
        };
        "<leader>sD" = {
          action = "diagnostics";
          options.desc = "Workspace diagnostics";
        };
        "<leader>sh" = {
          action = "help_tags";
          options.desc = "Help pages";
        };
        "<leader>sH" = {
          action = "highlights";
          options.desc = "Search Highlight Groups";
        };
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "Keymaps";
        };
        "<leader>sM" = {
          action = "man_pages";
          options.desc = "Man pages";
        };
        "<leader>sm" = {
          action = "marks";
          options.desc = "Jump to Mark";
        };
        "<leader>so" = {
          action = "vim_options";
          options.desc = "Options";
        };
        "<leader>sR" = {
          action = "resume";
          options.desc = "Resume";
        };
        "<leader>uC" = {
          action = "colorscheme";
          options.desc = "Colorscheme preview";
        };
        "<leader>fp" = {
          action = "projects";
          options.desc = "Projects";
        };
        "<leader>sd" = {
          action = "diagnostics bufnr=0";
          options.desc = "Document Diagnostics";
        };
        "<leader>st" = {
          action = "todo-comments";
          options.desc = "Todo (Telescope)";
        };
      };
    };
  };
}
