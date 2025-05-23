vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
local theme_toggle = require("theme-toggle")
vim.keymap.set("n", "<leader>tt", theme_toggle.toggle, { desc = "Toggle Theme" })
vim.keymap.set("n", "<leader>x", function()
  require("toggleterm").toggle()
end, { desc = "Toggle Terminal" })

vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]]

vim.wo.number = true
