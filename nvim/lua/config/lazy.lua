-- Bootstrap lazy.nvim, the plugin manager
-- https://github.com/folke/lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load every plugin spec from lua/plugins/
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- Theme used by lazy's own install/update UI on first run
  install = { colorscheme = { "gruvbox-material", "habamax" } },
  checker = { enabled = false }, -- don't auto-check for plugin updates
})
