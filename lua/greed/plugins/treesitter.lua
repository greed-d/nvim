return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', 
    opts = {
      ensure_installed = { 'bash',  'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-j>",
          node_incremental = "<C-j>",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
