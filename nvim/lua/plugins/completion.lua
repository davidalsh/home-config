-- blink.cmp: autocompletion popup as you type
-- https://github.com/saghen/blink.cmp

return {
  "saghen/blink.cmp",
  version = "*", -- use a release tag so a prebuilt binary is downloaded (no Rust needed)
  dependencies = { "rafamadriz/friendly-snippets" }, -- a big set of ready-made snippets
  event = "InsertEnter",
  opts = {
    -- "super-tab": press Tab to accept the highlighted suggestion.
    -- Also: Ctrl-n / Ctrl-p or arrows to move, Ctrl-space to toggle docs, Ctrl-e to dismiss.
    keymap = { preset = "super-tab" },

    appearance = { nerd_font_variant = "mono" },

    -- Where suggestions come from (in priority order)
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    completion = {
      -- automatically show the documentation window next to the menu
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
  },
}
