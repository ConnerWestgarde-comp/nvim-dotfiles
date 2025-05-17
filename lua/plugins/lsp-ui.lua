return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_lines").setup()

    -- Disable virtual_text, enable virtual_lines
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false, -- we'll toggle this manually
    })

    -- Optional: toggle keymap
    vim.keymap.set(
      "n",
      "<leader>ld",
      function()
        local enabled = not vim.diagnostic.config().virtual_lines
        vim.diagnostic.config({
          virtual_lines = enabled,
          virtual_text = not enabled,
        })
      end,
      { desc = "Toggle lsp_lines" }
    )
  end,
}

