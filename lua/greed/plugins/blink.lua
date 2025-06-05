return {

	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	event = "VeryLazy",

	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		completion = {

			ghost_text = { enabled = false },
			-- signature = { enabled = true },

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
			},

			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "label", gap = 2, "kind_icon" },
						{ gap = 2, "source_name", "label_description" },
					},
				},
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
		},
		keymap = {
			["<Tab>"] = {},
			["<S-Tab>"] = {},
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "dadbod" },
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "normal",
		},
	},
}
