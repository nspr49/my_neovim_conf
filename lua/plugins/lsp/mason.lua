return{
  "williamboman/mason.nvim",
  dependencies = {
	 "williamboman/mason-lspconfig.nvim",
"neovim/nvim-lspconfig",
  },
  config = function()
	 require("mason").setup()
	 require("mason-lspconfig").setup(
		{
		  ensure_installed = {"lua_ls", "clangd","jdtls" },
		  automatic_installation = true,
		}

	 )
  end,
}
