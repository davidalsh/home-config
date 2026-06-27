-- neo-tree: a file-tree sidebar on the left (VS Code-style explorer)
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- No nvim-web-devicons on purpose: keeps the tree readable without a
    -- Nerd Font. Add it later for colored file-type icons.
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle left<cr>", desc = "File tree (toggle)" },
    {
      "<leader>o",
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd("p")           -- in the tree -> jump back to your file
        else
          vim.cmd("Neotree focus left") -- in a file -> jump to the tree
        end
      end,
      desc = "Toggle focus: tree <-> file",
    },
  },
  opts = {
    -- Keep the tree open when you :q the last file window, so you land back in
    -- the tree (which then fills the whole screen) instead of quitting Neovim.
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      indent = { with_expanders = false },
      -- Plain-text glyphs so it looks right in any font
      icon = {
        folder_closed = "▸",
        folder_open = "▾",
        folder_empty = "▸",
        default = " ",
      },
      git_status = {
        symbols = {
          added = "+",
          modified = "~",
          deleted = "x",
          renamed = ">",
          untracked = "?",
          ignored = "i",
          unstaged = "•",
          staged = "✓",
          conflict = "!",
        },
      },
    },
    window = {
      position = "left",
      width = 32,
      mappings = {
        ["<space>"] = "none", -- don't shadow the leader key inside the tree
      },
    },
    filesystem = {
      follow_current_file = { enabled = true }, -- highlight the file you're editing
      use_libuv_file_watcher = true,            -- auto-refresh on disk changes
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
