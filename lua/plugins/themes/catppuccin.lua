-- Plugin: catppuccin.nvim
-- Functionality: A visually polished and highly customizable colorscheme for Neovim.
-- Loaded early for availability, but doesn't auto-apply any theme to allow dynamic switching.

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
  },
}
