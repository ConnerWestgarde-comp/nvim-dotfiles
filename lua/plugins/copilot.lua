return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",         -- Accept suggestion
            next = "<M-]>",           -- Next suggestion
            prev = "<M-[>",           -- Previous suggestion
            dismiss = "<C-]>",        -- Dismiss suggestion
          },
        },
        panel = {
          enabled = false,           -- Optional: turn on for multiline suggestion UI
        },
      })
    end,
  },



  }
