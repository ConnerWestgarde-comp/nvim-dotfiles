-- theme-toggle.lua

local themes = {
  "catppuccin-mocha",
  "tokyonight-moon",
  "rose-pine",
  "kanagawa-dragon",
  "gruvbox",
  "bamboo",
}

local current = 1

local function apply_theme(index)
  vim.cmd("colorscheme " .. themes[index])
end

local function toggle_theme()
  current = current + 1
  if current > #themes then current = 1 end
  apply_theme(current)
  vim.defer_fn(function()
  vim.notify("Theme: " .. themes[current], vim.log.levels.INFO)
end, 50)
end

return {
  toggle = toggle_theme,
}
