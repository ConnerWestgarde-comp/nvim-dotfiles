return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy", -- Load after UI
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]], -- Ctrl + \ to toggle
        hide_numbers = true,
        shade_terminals = true,
        direction = "float", -- Options: 'horizontal', 'vertical', 'tab', 'float'
        float_opts = {
          border = "curved",
        },
      })
    end,
  },
}

