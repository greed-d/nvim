vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"), -- version = 'v1.*', -- Use '*' to track tags/releases
	},
})

require("blink.cmp").setup({

	cmdline = {
		enabled = false,
	},
	keymap = {
		["<Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
	},

	fuzzy = {
		implementation = "prefer_rust",
	},

	-- Experimental signature help support
	signature = {
		enabled = false,
	},
	completion = {

		ghost_text = { enabled = false },
		-- signature = { enabled = true },

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 100,
			window = {
				winhighlight = "normal:normal,floatborder:floatborder,cursorline:blinkcmpdoccursorline,search:none",
			},
		},

		menu = {
			draw = {
				columns = {
					{ "label", gap = 2, "kind_icon" },
					{ gap = 2, "source_name", "label_description" },
				},
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
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

	-- library = {
	--   { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	--   { path = "LazyVim",            words = { "LazyVim" } },
	--   { path = "snacks.nvim",        words = { "Snacks" } },
	--   { path = "lazy.nvim",          words = { "LazyVim" } },
	-- },

	sources = {
		-- add lazydev to your completion providers
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},

			dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
		},
	},
})
