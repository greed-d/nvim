vim.pack.add { { src = 'https://github.com/saghen/blink.cmp' } }

-- require('blink').setup(
--   {
--
-- 		completion = {
--
-- 			ghost_text = { enabled = false },
-- 			signature = { enabled = true },
--
-- 			documentation = {
-- 				auto_show = true,
-- 				auto_show_delay_ms = 100,
-- 				window = {
-- 					-- border = "rounded",
-- 					winhighlight = "normal:normal,floatborder:floatborder,cursorline:blinkcmpdoccursorline,search:none",
-- 				},
-- 			},
--
-- 			menu = {
-- 				-- border = "rounded",
-- 				draw = {
-- 					columns = {
-- 						{ "label", gap = 2, "kind_icon" },
-- 						{ gap = 2, "source_name", "label_description" },
-- 					},
-- 				},
-- 				winhighlight = "normal:normal,floatborder:floatborder,cursorline:blinkcmpmenuselection,search:none",
-- 			},
-- 			accept = {
-- 				auto_brackets = {
-- 					enabled = true,
-- 				},
-- 			},
-- 		},
-- 		keymap = {
-- 			["<Tab>"] = {},
-- 			["<S-Tab>"] = {},
-- 			["<C-l>"] = { "snippet_forward", "fallback" },
-- 			["<C-h>"] = { "snippet_backward", "fallback" },
-- 			["<C-b>"] = { "scroll_documentation_up", "fallback" },
-- 			["<C-f>"] = { "scroll_documentation_down", "fallback" },
-- 		},
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer", "dadbod" },
-- 			providers = {
-- 				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
-- 			},
-- 		},
--
-- 		appearance = {
-- 			use_nvim_cmp_as_default = true,
-- 			nerd_font_variant = "normal",
-- 		},
-- })

require('blink.cmp').setup({

  completion = {

    ghost_text = { enabled = false },
    signature = { enabled = true },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
      window = {
        -- border = "rounded",
        winhighlight = "normal:normal,floatborder:floatborder,cursorline:blinkcmpdoccursorline,search:none",
      },
    },

    menu = {
      -- border = "rounded",
      draw = {
        columns = {
          { "label", gap = 2,       "kind_icon" },
          { gap = 2, "source_name", "label_description" },
        },
      },
      winhighlight = "normal:normal,floatborder:floatborder,cursorline:blinkcmpmenuselection,search:none",
    },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
  },
})
