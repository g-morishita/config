return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		require("mason-lspconfig").setup({
			automatic_enable = false,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"air",
				"basedpyright",
				"bashls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"prettier",
				"r_language_server",
				"ruff",
				"shellcheck",
				"shfmt",
				"stylua",
				"texlab",
				"ts_ls",
			},
		})
	end,
}
