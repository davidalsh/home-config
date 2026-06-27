-- Dracula theme (Lua port for Neovim)
-- https://github.com/Mofiqul/dracula.nvim

return {
  "Mofiqul/dracula.nvim",
  lazy = false,    -- load during startup (it's the main UI theme)
  priority = 1000, -- load before all other plugins
  config = function()
    require("dracula").setup({
      transparent_bg = false,  -- set true if your terminal is transparent
      italic_comment = true,
    })
    vim.cmd.colorscheme("dracula")
  end,
}
