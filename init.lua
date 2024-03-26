
vim.g.mapleader = '\\'
vim.g.maplocalleader = "\\"

local data_path 		= vim.fn.stdpath("data")
local plugins_path 		= data_path .. '/nxvim_plugins'
local lazy_plug_path 		= plugins_path .. '/lazy.nvim'

local config_path 		= vim.fn.stdpath("config")
local plugins_config_path	= config_path .. '/plugins_config.lua'

--print(data_path)
--print(plugins_path)
--print(lazy_plug_path)

-- Initialize the lazy nvim plugin
local lazypath = lazy_plug_path
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- change the root directory of lazy nvim
config = require("lazy.core.config")
lazy_defaults = config['defaults']
lazy_defaults['root'] = plugins_path


-- ask for the plugins configuration file
local f = assert(loadfile(plugins_config_path));
local plugins_table = f()

require("lazy").setup(plugins_table)

