-- Gruvbox Material theme (warm, soft, muted)
-- https://github.com/sainnhe/gruvbox-material

return {
  "sainnhe/gruvbox-material",
  lazy = false,    -- load during startup (it's the main UI theme)
  priority = 1000, -- load before all other plugins
  config = function()
    -- Options must be set BEFORE :colorscheme
    vim.g.gruvbox_material_background = "soft"      -- "hard" | "medium" | "soft"
    vim.g.gruvbox_material_foreground = "material"  -- "material" | "mix" | "original" (material = softest)
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_better_performance = 1

    vim.cmd.colorscheme("gruvbox-material")
  end,
}
