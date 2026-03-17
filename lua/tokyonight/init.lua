local M = {}

M.config = {
  style = "storm", -- "night" or "storm"
  transparent_background = false,
  enable_italic = false,
  disable_italic_comment = false,
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "tokyonight"

  -- Load config from vim global variables (for backward compatibility)
  local config = {
    style = vim.g.tokyonight_style or M.config.style,
    transparent_background = vim.g.tokyonight_transparent_background == 1 or M.config.transparent_background,
    enable_italic = vim.g.tokyonight_enable_italic == 1 or M.config.enable_italic,
    disable_italic_comment = vim.g.tokyonight_disable_italic_comment == 1 or M.config.disable_italic_comment,
  }

  local palette = require("tokyonight.palette")
  local highlights = require("tokyonight.highlights")

  local p = palette[config.style] or palette.storm
  highlights.setup(p, config)

  -- Set terminal colors
  vim.g.terminal_color_0 = p.black
  vim.g.terminal_color_1 = p.red
  vim.g.terminal_color_2 = p.green
  vim.g.terminal_color_3 = p.yellow
  vim.g.terminal_color_4 = p.blue
  vim.g.terminal_color_5 = p.purple
  vim.g.terminal_color_6 = p.orange
  vim.g.terminal_color_7 = p.fg
  vim.g.terminal_color_8 = p.black
  vim.g.terminal_color_9 = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.purple
  vim.g.terminal_color_14 = p.orange
  vim.g.terminal_color_15 = p.fg
end

return M
