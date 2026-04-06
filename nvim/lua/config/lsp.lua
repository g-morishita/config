-- Enable LSP servers
vim.lsp.enable({
	"lua_ls",
	"basedpyright",
	"stan_ls",
})

-- Configure diagnostic display with custom signs
vim.diagnostic.config({
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = true, -- Show source in diagnostic popup window
		header = "",
		prefix = "",
	},
	virtual_text = false,
	virtual_lines = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Enable inlay hints
vim.lsp.inlay_hint.enable(false)

local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		-- set keybinds
        keymap.set("n", "K", vim.lsp.buf.hover)
        keymap.set("n", "gd", vim.lsp.buf.definition)
        keymap.set("n", "gr", vim.lsp.buf.references)
        keymap.set("n", "gl", vim.diagnostic.open_float)
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	end,
})
