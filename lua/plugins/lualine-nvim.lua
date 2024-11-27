local config = function()
  local theme = require("lualine.themes.gruvbox")
  --set bg transparency in all modes
  if theme.normal.c then
    theme.normal.c.bg = nil
  end
  if theme.insert.c then
    theme.insert.c.bg = nil
  end
  if theme.visual.c then
    theme.visual.c.bg = nil
  end
  if theme.replace.c then
    theme.replace.c.bg = nil
  end
  if theme.command.c then
    theme.command.c.bg = nil
  end

  require("lualine").setup({
    options = {
      theme = theme,
      globalstatus = true,
      section_separators = { left = '', right = '' },
      component_separators = "",
    },
    tabline = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {
        '%=', --[[ add your center compoentnts here in place of this comment ]]
      },
      lualine_x = { 'diagnostics' },
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    sections = {},
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
