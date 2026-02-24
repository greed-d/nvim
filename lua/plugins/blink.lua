-- local hooks = function(ev)
--   -- Use available |event-data|
--   local name, kind = ev.data.spec.name, ev.data.kind
--
--   -- Run build script after plugin's code has changed
--   if name == 'blink.cmp' and (kind == 'install' or kind == 'update') then
--     vim.system({ 'cargo build --release' }, { cwd = ev.data.path })
--   end
--
--   -- If action relies on code from the plugin (like user command or
--   -- Lua code), make sure to explicitly load it first
--   -- if name == 'blink.cmp' and kind == 'update' then
--   --   if not ev.data.active then
--   --     vim.cmd.packadd('blink.cmp')
--   --   end
--   --   vim.cmd('PlugTwoUpdate')
--   --   require('plug2').after_update()
--   -- end
-- end

-- If hooks need to run on install, run this before `vim.pack.add()`
-- vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })

-- 1. Define the build logic using the PackChanged event
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

-- 2. Add the plugin
vim.pack.add({
	{
		src = "https://github.com/Saghen/blink.cmp",
		-- version = 'v1.*', -- Use '*' to track tags/releases
	},
})
-- vim.pack.add { { src = 'https://github.com/saghen/blink.cmp', version = 'main' } }

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
