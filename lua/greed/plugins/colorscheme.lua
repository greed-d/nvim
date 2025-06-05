return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    enabled = true,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = true }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      local function set_highlight(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
      end
      set_highlight('FloatBorder', { fg = '#45475A', bg = 'NONE' })
      set_highlight('SnacksPickerTitle', { bg = '#7aa2f7', fg = '#1f2335' })
      set_highlight('SnacksPickerPreview', { bg = '#1a1b26' })
      set_highlight('SnacksPickerList', { bg = '#1a1b26' })
      set_highlight('SnacksPickerListTitle', { bg = '#9ece6a', fg = '#1f2335' })
      set_highlight('SnacksPickerInputTitle', { bg = '#f7768e', fg = '#1f2335' })
      set_highlight('SnacksPickerInputBorder', { bg = '#1a1b26', fg = '#45475a' })
      set_highlight('SnacksPickerInputSearch', { bg = '#f7768e', fg = '#1f2335' })
      set_highlight('SnacksPickerInput', { bg = '#1a1b26' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
