-- Plugin: neo-tree.nvim
-- Functionality:
-- - Replaces the built-in file explorer (`netrw`) with a modern tree view.
-- - Supports viewing files, buffers, and Git status.
-- - Configured here to *show hidden files*, *dotfiles*, and *gitignored files* by default.

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",  -- Use the latest stable version of Neo-tree
	dependencies = {
		"nvim-lua/plenary.nvim",        -- Required utility library
		"nvim-tree/nvim-web-devicons",  -- Adds file icons
		"MunifTanjim/nui.nvim",         -- UI framework for Neovim
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,         -- Show hidden files in the tree
					hide_dotfiles = false, -- Do not hide dotfiles (like .gitignore)
					hide_gitignored = false, -- Do not hide files in .gitignore
				},
			},
		})

		-- <C-f>: Toggle Neo-tree file explorer on the right side of the screen
		vim.keymap.set("n", "<C-f>", ":Neotree toggle right<CR>", {})

		-- <leader>bf: Show open buffers in a floating Neo-tree window
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}

