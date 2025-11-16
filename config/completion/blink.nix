{ lib, config, pkgs, ... }:
{
  options = {
    blink.enable = lib.mkEnableOption "Enable blink.cmp completion engine";
  };
  config = lib.mkIf config.blink.enable {
    plugins.blink-cmp = {
      enable = true;
      settings = {
        # LazyVim blink.cmp configuration
        keymap = {
          preset = "default";
          "<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
          "<C-e>" = [ "hide" ];
          "<C-y>" = [ "select_and_accept" ];

          "<Tab>" = [
            "snippet_forward"
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "select_prev"
            "fallback"
          ];

          "<C-j>" = [ "select_next" "fallback" ];
          "<C-k>" = [ "select_prev" "fallback" ];

          "<C-b>" = [ "scroll_documentation_up" "fallback" ];
          "<C-f>" = [ "scroll_documentation_down" "fallback" ];
        };

        appearance = {
          use_nvim_cmp_as_default = false;
          nerd_font_variant = "mono";
        };

        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
            };
          };

          menu = {
            enabled = true;
            border = "rounded";
            draw = {
              columns = [
                [ "kind_icon" ]
                [ "label" "label_description" ]
                [ "kind" ]
              ];
            };
          };

          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200;
            window = {
              border = "rounded";
            };
          };

          ghost_text = {
            enabled = true;
          };
        };

        sources = {
          # LazyVim default sources
          default = [ "lsp" "path" "snippets" "buffer" ];

          # Per-filetype sources
          providers = {
            lsp = {
              name = "LSP";
              module = "blink.cmp.sources.lsp";
              enabled = true;
              score_offset = 100;
            };
            path = {
              name = "Path";
              module = "blink.cmp.sources.path";
              enabled = true;
              score_offset = 3;
              opts = {
                trailing_slash = false;
                label_trailing_slash = true;
                get_cwd.__raw = "function(context) return vim.fn.expand(('#%d:p:h'):format(context.bufnr)) end";
                show_hidden_files_by_default = false;
              };
            };
            snippets = {
              name = "Snippets";
              module = "blink.cmp.sources.snippets";
              enabled = true;
              score_offset = -3;
              opts = {
                friendly_snippets = true;
                search_paths = [ "~/.config/nvim/snippets" ];
                global_snippets = [ "all" ];
                extended_filetypes = { };
                ignored_filetypes = [ ];
              };
            };
            buffer = {
              name = "Buffer";
              module = "blink.cmp.sources.buffer";
              enabled = true;
              min_keyword_length = 5;
            };
          };
        };

        signature = {
          enabled = true;
          window = {
            border = "rounded";
          };
        };
      };
    };

    # Add friendly-snippets
    extraPlugins = [
      pkgs.vimPlugins.friendly-snippets
    ];
  };
}
