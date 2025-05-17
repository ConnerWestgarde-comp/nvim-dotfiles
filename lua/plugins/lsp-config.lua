-- Plugin Group: LSP Setup (Language Server Protocol)
-- Functionality:
-- - mason.nvim: Manages external editor tooling (like language servers, DAPs, linters).
-- - mason-lspconfig.nvim: Bridges mason with lspconfig for easy LSP installs.
-- - nvim-lspconfig: Configures Neovim's built-in LSP client.

return {
  {
    "williamboman/mason.nvim", -- Core tool manager
    config = function()
      require("mason").setup() -- Initialize Mason UI and install tools
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim", -- Mason integration with LSP
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" }, -- Ensure Lua and TypeScript servers are installed
      })
    end,
  },
  {
    "neovim/nvim-lspconfig", -- Built-in LSP configuration
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Setup for Lua and TypeScript servers
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})

      -- Key mappings for LSP functionality:
      -- K: Show hover documentation
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.cmd([[autocmd CursorHold * lua vim.lsp.buf.hover()]])
      vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])
      vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]


      -- gd: Go to definition
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

      -- <leader>ca: Trigger code actions (e.g., refactor, quick fix)
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
