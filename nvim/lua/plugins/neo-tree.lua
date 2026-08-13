return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = { ".DS_Store" },
				},
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = true,
			},
			window = {
				position = "left",
				width = 34,
				mappings = {
					["h"] = "close_node",
					["l"] = "open",
				},
			},
		})
	end,
}
