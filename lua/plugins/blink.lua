-- Build blink.cmp manually
vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("MyVimPackHooks", { clear = true }),
	callback = function(ev)
		-- ev.data contains: spec (name, src), kind ('install', 'update', 'deleted'), path
		local plugin_name = ev.data.spec.name

		if plugin_name == "blink.cmp" and (ev.data.kind == "install" or ev.data.kind == "update") then
			print("Building blink.cmp...")

			-- Use vim.system to run the build command asynchronously
			vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }, function(obj)
				if obj.code == 0 then
					vim.schedule(function()
						print("blink.cmp built successfully!")
					end)
				else
					vim.schedule(function()
						print("Error building blink.cmp: " .. obj.stderr)
					end)
				end
			end)
		end
	end,
})

vim.pack.add({
	{
		src = "https://github.com/Saghen/blink.cmp",
		-- version = 'v1.*', -- Use '*' to track tags/releases
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
		-- implementation = "lua",
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
				-- border = "rounded",
				winhighlight = "normal:normal,floatborder:floatborder,cursorline:blinkcmpdoccursorline,search:none",
			},
		},

		menu = {
			-- border = "rounded",
			draw = {
				columns = {
					{ "label", gap = 2, "kind_icon" },
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
