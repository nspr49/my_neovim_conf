vim.cmd("set number")
vim.cmd("set modifiable")
--Lazy vim Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
-- Set Mapleader
vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct
plugins =  {
	
	
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },	
	},
	
	{
		"preservim/nerdtree"
	},
	
	{
		"mfussenegger/nvim-dap"
	},
} 


require("lazy").setup({
	{ import = "plugins"}, {import = "plugins.lsp"}
	},{})

vim.cmd("autocmd VimEnter * NERDTree")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})




