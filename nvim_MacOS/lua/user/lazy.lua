local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

local function filter_out_packer()
  local packer_root = fn.stdpath("data") .. "/site/pack/packer"
  if not vim.loop.fs_stat(packer_root) then
    return
  end

  local function filter(list)
    local cleaned = {}
    for _, path in ipairs(list) do
      if not path:find("/site/pack/packer/") then
        table.insert(cleaned, path)
      end
    end
    return cleaned
  end

  vim.opt.rtp = filter(vim.opt.rtp:get())
  vim.opt.packpath = filter(vim.opt.packpath:get())

  if vim.fn.isdirectory(packer_root) == 1 then
    local result = vim.fn.delete(packer_root, "rf")
    if result ~= 0 then
      vim.notify("Unable to remove legacy packer directory: " .. packer_root, vim.log.levels.WARN)
    end
  end
end

filter_out_packer()

vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.api.nvim_err_writeln("lazy.nvim failed to load")
  return
end

local ok, plugins = pcall(require, "user.plugins")
if not ok then
  vim.api.nvim_err_writeln("Failed to load plugin specifications: " .. plugins)
  plugins = {}
end

lazy.setup(plugins, {
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "catppuccin", "kanagawa" },
  },
  checker = {
    enabled = false,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
