{
  lib,
  config,
  ...
}:
{
  options = {
    zk.enable = lib.mkEnableOption "Enable zk module";
  };
  config = lib.mkIf config.zk.enable {
    plugins.zk = {
      enable = true;
      settings = {
        lsp = {
          auto_attach = {
            enabled = true;
            filetypes = [
              "markdown"
            ];
          };
          config = {
            cmd = [
              "zk"
              "lsp"
            ];
            name = "zk";
          };
        };
        picker = "snacks_picker";
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>zn";
        action = "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>";
        options = {
          desc = "Zk New note";
          silent = false;
        };
      }
      {
        mode = "n";
        key = "<leader>zo";
        action = "<Cmd>ZkNotes { sort = { 'modified' } }<CR>";
        options = {
          desc = "Zk Open note";
          silent = false;
        };
      }
      {
        mode = "n";
        key = "<leader>zt";
        action = "<Cmd>ZkTags<CR>";
        options = {
          desc = "Zk Notes by tag";
          silent = false;
        };
      }
      {
        mode = "n";
        key = "<leader>zf";
        action = "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>";
        options = {
          desc = "Zk Find notes";
          silent = false;
        };
      }
      {
        mode = "v";
        key = "<leader>zf";
        action = "<Cmd>ZkMatch<CR>";
        options = {
          desc = "Zk Notes matching selection";
          silent = false;
        };
      }
    ];
    extraFiles = {
      "after/ftplugin/markdown.lua".text = ''
        if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
          local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
          local opts = { noremap=true, silent=false }

          -- Open the link under the caret.
          map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

          -- Create a new note after asking for its title.
          -- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
          map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
          -- Create a new note in the same directory as the current buffer, using the current selection for title.
          map("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
          -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
          map("v", "<leader>znc", ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)

          -- Open notes linking to the current buffer.
          map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
          -- Alternative for backlinks using pure LSP and showing the source context.
          --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
          -- Open notes linked by the current buffer.
          map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

          -- Preview a linked note.
          map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
          -- Open the code actions for a visual selection.
          map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
        end
      '';
    };
  };
}
