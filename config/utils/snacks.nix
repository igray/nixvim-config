{
  lib,
  config,
  ...
}:
{
  options = {
    snacks.enable = lib.mkEnableOption "Enable snacks module";
  };
  config = lib.mkIf config.snacks.enable {
    plugins.snacks = {
      enable = true;
      settings = {
        bigfile = {
          enabled = true;
        };
        dashboard = {
          enabled = true;
          sections = [
            {
              section = "header";
            }
            {
              icon = " ";
              title = "Keymaps";
              section = "keys";
              indent = 2;
              padding = 1;
            }
            {
              icon = " ";
              title = "Recent Files";
              section = "recent_files";
              indent = 2;
              padding = 1;
            }
            {
              icon = " ";
              title = "Projects";
              section = "projects";
              indent = 2;
              padding = 1;
            }
          ];
        };
        explorer = {
          enabled = true;
          replace_netrw = true;

        };
        gitbrowser = {
          enabled = true;
        };
        image = {
          enabled = true;
        };
        indent = {
          enabled = true;
        };
        input = {
          enabled = true;
        };
        lazygit = {
          enabled = true;
        };
        notifier = {
          enabled = true;
          timeout = 3000;
        };
        picker = {
          enabled = true;
        };
        quickfile = {
          enabled = true;
        };
        scope = {
          enabled = true;
        };
        scratch = {
          enabled = true;
        };
        statuscolumn = {
          enabled = true;
        };
        terminal = {
          enabled = true;
        };
        words = {
          debounce = 200;
          enabled = true;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader><space>";
        action = ":lua Snacks.picker.smart()<CR>";
        options = {
          desc = "Smart find files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>/";
        action = ":lua Snacks.picker.grep()<CR>";
        options = {
          desc = "Grep (root dir)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>:";
        action = ":lua Snacks.picker.command_history()<CR>";
        options = {
          desc = "Command History";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>n";
        action = ":lua Snacks.picker.notifications()<CR>";
        options = {
          desc = "Notification History";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":lua Snacks.explorer()<CR>";
        options = {
          desc = "Toggle Explorer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = ":lua Snacks.picker.buffers()<CR>";
        options = {
          desc = "Buffers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = ":lua Snacks.picker.files()<CR>";
        options = {
          desc = "Find Files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = ":lua Snacks.picker.git_files()<CR>";
        options = {
          desc = "Find Git Files";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fp";
        action = ":lua Snacks.picker.projects()<CR>";
        options = {
          desc = "Projects";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = ":lua Snacks.picker.recent()<CR>";
        options = {
          desc = "Recent";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = ":lua Snacks.picker.git_branches()<CR>";
        options = {
          desc = "Git Branches";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gl";
        action = ":lua Snacks.picker.git_log()<CR>";
        options = {
          desc = "Git Log";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gL";
        action = ":lua Snacks.picker.git_log_line()<CR>";
        options = {
          desc = "Git Log Line";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = ":lua Snacks.picker.git_status()<CR>";
        options = {
          desc = "Git Status";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gS";
        action = ":lua Snacks.picker.git_stash()<CR>";
        options = {
          desc = "Git Stash";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gd";
        action = ":lua Snacks.picker.git_diff()<CR>";
        options = {
          desc = "Git Diff (Hunks)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gf";
        action = ":lua Snacks.picker.git_log_file()<CR>";
        options = {
          desc = "Git Log File";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sb";
        action = ":lua Snacks.picker.lines()<CR>";
        options = {
          desc = "Buffer Lines";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sB";
        action = ":lua Snacks.picker.grep_buffers()<CR>";
        options = {
          desc = "Grep Open Buffers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sg";
        action = ":lua Snacks.picker.grep()<CR>";
        options = {
          desc = "Grep";
          silent = true;
        };
      }
      {
        key = "<leader>sw";
        action = ":lua Snacks.picker.grep_word()<CR>";
        options = {
          desc = "Visual selection or word";
          silent = true;
        };
        mode = [
          "n"
          "x"
        ];
      }
      {
        mode = "n";
        key = "<leader>s\"";
        action = ":lua Snacks.picker.registers()<CR>";
        options = {
          desc = "Registers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>s/";
        action = ":lua Snacks.picker.search_history()<CR>";
        options = {
          desc = "Search History";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sa";
        action = ":lua Snacks.picker.autocmds()<CR>";
        options = {
          desc = "Autocmds";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sc";
        action = ":lua Snacks.picker.command_history()<CR>";
        options = {
          desc = "Command History";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sC";
        action = ":lua Snacks.picker.commands()<CR>";
        options = {
          desc = "Commands";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sd";
        action = ":lua Snacks.picker.diagnostics()<CR>";
        options = {
          desc = "Diagnostics";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sD";
        action = ":lua Snacks.picker.diagnostics_buffer()<CR>";
        options = {
          desc = "Buffer Diagnostics";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = ":lua Snacks.picker.help()<CR>";
        options = {
          desc = "Help Pages";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sH";
        action = ":lua Snacks.picker.highlights()<CR>";
        options = {
          desc = "Highlights";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>si";
        action = ":lua Snacks.picker.icons()<CR>";
        options = {
          desc = "Icons";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sj";
        action = ":lua Snacks.picker.jumps()<CR>";
        options = {
          desc = "Jumps";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sk";
        action = ":lua Snacks.picker.keymaps()<CR>";
        options = {
          desc = "Keymaps";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sl";
        action = ":lua Snacks.picker.loclist()<CR>";
        options = {
          desc = "Location List";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sm";
        action = ":lua Snacks.picker.marks()<CR>";
        options = {
          desc = "Marks";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sM";
        action = ":lua Snacks.picker.man()<CR>";
        options = {
          desc = "Man Pages";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sq";
        action = ":lua Snacks.picker.qflist()<CR>";
        options = {
          desc = "Quickfix List";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sR";
        action = ":lua Snacks.picker.resume()<CR>";
        options = {
          desc = "Resume";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>su";
        action = ":lua Snacks.picker.undo()<CR>";
        options = {
          desc = "Undo History";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>uC";
        action = ":lua Snacks.picker.colorschemes()<CR>";
        options = {
          desc = "Colorschemes";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gd";
        action = ":lua Snacks.picker.lsp_definitions()<CR>";
        options = {
          desc = "Goto Definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gD";
        action = ":lua Snacks.picker.lsp_declarations()<CR>";
        options = {
          desc = "Goto Declaration";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gr";
        action = ":lua Snacks.picker.lsp_references()<CR>";
        options = {
          desc = "References";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gI";
        action = ":lua Snacks.picker.lsp_implementations()<CR>";
        options = {
          desc = "Goto Implementations";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gy";
        action = ":lua Snacks.picker.lsp_type_definitions()<CR>";
        options = {
          desc = "Goto T[y]pe Definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ss";
        action = ":lua Snacks.picker.lsp_symbols()<CR>";
        options = {
          desc = "LSP Symbols";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>sS";
        action = ":lua Snacks.picker.lsp_workspace_symbols()<CR>";
        options = {
          desc = "LSP Workspace Symbols";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gg";
        action = ":lua Snacks.lazygit()<CR>";
        options = {
          desc = "LazyGit (root dir)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>.";
        action = ":lua Snacks.scratch()<CR>";
        options = {
          desc = "Toggle Scratch Buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>S";
        action = ":lua Snacks.scratch.select()<CR>";
        options = {
          desc = "Select Scratch Buffer";
          silent = true;
        };
      }
    ];
  };
}
