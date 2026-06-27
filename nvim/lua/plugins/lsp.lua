-- LSP: real code intelligence (go-to-definition, hover, rename, diagnostics)
-- mason installs language servers; nvim-lspconfig + blink wire them up.
-- https://github.com/neovim/nvim-lspconfig

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Tell language servers about the extra completion capabilities blink adds.
    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright" }, -- Python language server
      automatic_enable = true,
    })

    -- How diagnostics (errors/warnings) are shown
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      severity_sort = true,
    })

    -- Keymaps that only make sense once a server attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local map = function(keys, fn, desc)
          vim.keymap.set("n", keys, fn, { buffer = args.buf, desc = "LSP: " .. desc })
        end
        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "References")
        map("K", vim.lsp.buf.hover, "Hover docs")
        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
        map("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
      end,
    })
  end,
}
