vim.cmd("set number")

-- Lazy Vim setup
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

plugs = {
  {
        'maxmx03/dracula.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function ()
	local dracula = require 'dracula'
            dracula.setup()

            vim.cmd.colorscheme 'dracula'
        end
       },
       {
  	"folke/which-key.nvim",
  	{
    	"folke/neoconf.nvim",
    	config = true,
    	cmd = "Neoconf",
    	dependencies = {'neovim/nvim-lspconfig'}
  	},
  	"folke/neodev.nvim",
	},
	{
		
 	   	"nvim-treesitter/nvim-treesitter",
    		build = ":TSUpdate",
	},
	{
		'markvincze/panda-vim'	
--		local panda = require('panda')
	},
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.5',
		dependencies = {'nvim-lua/plenary.nvim'}
	},
	{
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },	
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {"hrsh7th/cmp-nvim-lsp"}
	
	},
	{
		"preservim/nerdtree"
	}
} 

require("lazy").setup{
plugs, opts }
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
