vim.cmd("set number")
vim.cmd("set modifiable")
vim.cmd("set tabstop=3")
vim.cmd("set shiftwidth=2")
vim.cmd('autocmd BufRead,BufNewFile *.flex set filetype=c')
vim.cmd("autocmd BufRead, BufNewFile *.spl set filetype=java")	  
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


require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "java", "regex"},
}





