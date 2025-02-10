{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    picker.enable = lib.mkEnableOption "Enable snacks picker module";
  };
  config = lib.mkIf config.picker.enable {
    plugins.snacks = {
      settings = {
        picker = {
          enabled = true;
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader><space>";
        action = lib.nixvim.mkRaw "function() Snacks.picker.smart() end";
        options.desc = "Smart Find Files";
      }
      {
        mode = "n";
        key = "<leader>,";
        action = lib.nixvim.mkRaw "function() Snacks.picker.buffers() end";
        options.desc = "Buffers";
      }
      {
        mode = "n";
        key = "<leader>/";
        action = lib.nixvim.mkRaw "function() Snacks.picker.grep() end";
        options.desc = "Grep";
      }
      {
        mode = "n";
        key = "<leader>:";
        action = lib.nixvim.mkRaw "function() Snacks.picker.command_history() end";
        options.desc = "Command History";
      }
      {
        mode = "n";
        key = "<leader>n";
        action = lib.nixvim.mkRaw "function() Snacks.picker.notifications() end";
        options.desc = "Notification History";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = lib.nixvim.mkRaw "function() Snacks.picker.buffers() end";
        options.desc = "Buffers";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = lib.nixvim.mkRaw "function() Snacks.picker.files() end";
        options.desc = "Find Files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = lib.nixvim.mkRaw "function() Snacks.picker.git_files() end";
        options.desc = "Find Git Files";
      }
      {
        mode = "n";
        key = "<leader>fp";
        action = lib.nixvim.mkRaw "function() Snacks.picker.projects() end";
        options.desc = "Projects";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = lib.nixvim.mkRaw "function() Snacks.picker.recents() end";
        options.desc = "Recent";
      }
      #    -- find
      #    -- git
      #    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      #    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      #    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      #    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      #    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      #    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      #    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      #    -- Grep
      #    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      #    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      #    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      #    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      #    -- search
      #    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      #    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
      #    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      #    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      #    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
      #    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      #    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      #    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      #    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      #    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      #    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
      #    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      #    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      #    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      #    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      #    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      #    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      #    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      #    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
      #    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
      #    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      #    -- LSP
      #    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      #    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      #    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      #    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      #    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      #    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      #    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      #    -- Other
      #    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      #    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      #    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      #    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      #    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      #    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      #    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      #    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
      #    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      #    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      #    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      #    { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      #    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      #    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      #
    ];
  };
}
