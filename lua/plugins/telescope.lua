-- Plugin Group: telescope.nvim + ui-select extension
-- Functionality:
-- - telescope.nvim: Fuzzy finder for files, buffers, commands, and more.
-- - telescope-ui-select: Enhances UI for select menus (e.g., code actions, LSP choices) using Telescope's dropdown.
-- - Key mappings provide quick access to file search, live grep, and recently opened files.

return {
	{
		"nvim-telescope/telescope-ui-select.nvim", -- Adds dropdown UI for built-in vim.ui.select() prompts
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5", -- Stable release tag
		dependencies = { "nvim-lua/plenary.nvim" }, -- Required for telescope functionality
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}), -- Use dropdown theme for UI select
					},
				},
			})

			local builtin = require("telescope.builtin")

			-- <C-p>: Find files in the current project (respects .gitignore)
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})

			-- <leader>fg: Live grep text across files
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

			-- <leader><leader>: Open recently used files
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

			-- Load the ui-select extension
			require("telescope").load_extension("ui-select")
		end,
	},
}
