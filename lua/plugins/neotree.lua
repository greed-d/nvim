vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	-- "https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({

	add_blank_line_at_top = true, -- Add a blank line at the top of the tree.
	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
	sources = { "filesystem", "buffers", "git_status" },
	open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
	enable_git_status = true,
	git_status = {
		symbols = {
			-- Change type
			added = "✚", -- or "✚"
			modified = "", -- or ""
			deleted = "✖", -- this can only be used in the git_status source
			renamed = "󰁕", -- this can only be used in the git_status source
			-- Status type
			untracked = "",
			ignored = "",
			unstaged = "󰄱",
			staged = "",
			conflict = "",
		},
	},
	filesystem = {
		window = {
			position = "right",
			width = 30,
			mappings = {
				["\\"] = "close_window",
			},
		},
		bind_to_cwd = false,
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
	},
	window = {
		mappings = {
			["l"] = "open",
			["h"] = "close_node",
			["<space>"] = "none",
			["Y"] = {
				function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.fn.setreg("+", path, "c")
				end,
				desc = "Copy Path to Clipboard",
			},
			["P"] = { "toggle_preview", config = { use_float = false } },
		},
	},
	default_component_configs = {
		indent = {
			with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		git_status = {
			symbols = {
				unstaged = "󰄱",
				staged = "󰱒",
			},
		},

		icon = {
			provider = function(icon, node) -- setup a custom icon provider
				local text, hl
				local mini_icons = require("mini.icons")
				if node.type == "file" then -- if it's a file, set the text/hl
					text, hl = mini_icons.get("file", node.name)
				elseif node.type == "directory" then -- get directory icons
					text, hl = mini_icons.get("directory", node.name)
					-- only set the icon text if it is not expanded
					if node:is_expanded() then
						text = nil
					end
				end

				-- set the icon text/highlight only if it exists
				if text then
					icon.text = text
				end
				if hl then
					icon.highlight = hl
				end
			end,
		},
		kind_icon = {
			provider = function(icon, node)
				local mini_icons = require("mini.icons")
				icon.text, icon.highlight = mini_icons.get("lsp", node.extra.kind.name)
			end,
		},
	},
})

map({ "n", "v" }, "\\", ":Neotree reveal<CR>")
