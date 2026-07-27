return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
				-- disable highlighting for large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
			-- enable indentation
			indent = { enable = false },
			-- ensure these language parsers are installed
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"html",
				"javascript",
				"json",
				"latex",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"r",
				"rnoweb",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
		})
	end,
}
