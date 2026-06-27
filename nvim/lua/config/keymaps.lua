-- General keymaps (leader is Space, set in options.lua)

local map = vim.keymap.set

-- Buffer (open file) management
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete (close) current buffer" })
map("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "Delete buffer, discard changes" })

-- Cycle through open buffers
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
