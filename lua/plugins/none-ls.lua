-- Plugin: none-ls.nvim (formerly null-ls)
-- Functionality:
-- - Allows external formatters and linters to integrate into Neovim’s LSP client.
-- - Here, it's used to add **stylua** for Lua formatting.
-- - Adds a keymap to trigger formatting using LSP.

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Formatter for Lua files

				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.prettier,
			},
		})

		-- <leader>gf: Format current buffer using LSP (and thus, stylua)
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
