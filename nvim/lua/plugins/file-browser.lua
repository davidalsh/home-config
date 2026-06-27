-- Telescope file browser: navigate the folder tree inside the Telescope popup
-- (same UI as file search, but you walk directories instead of flat file lists)
-- https://github.com/nvim-telescope/telescope-file-browser.nvim

return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- Browse from the current working directory
    { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser (tree)" },
    -- Browse starting in the folder of the file you're editing
    {
      "<leader>fE",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
      desc = "File browser (current file's dir)",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
