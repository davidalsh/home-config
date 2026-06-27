-- Telescope: fuzzy finder for files, text, buffers, and more
-- https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required library
    {
      -- Native C sorter for much faster fuzzy matching
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep (search text)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Open buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep word under cursor" },
    { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            -- navigate results with Ctrl-j / Ctrl-k while typing
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            -- close the highlighted buffer from the <leader>fb list
            i = { ["<C-d>"] = actions.delete_buffer },
            n = { ["d"] = actions.delete_buffer },
          },
        },
      },
    })
    -- enable the native fzf sorter if it built successfully
    pcall(telescope.load_extension, "fzf")
  end,
}
