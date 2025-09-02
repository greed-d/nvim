return {
	-- Mini Nvim
	{ "echasnovski/mini.nvim", version = false },
	-- Comments
	{
		"echasnovski/mini.comment",
		version = false,
		event = "VeryLazy",
		opts = {},
	},

	-- {
	-- 	"RayZ0rr/mini.statusline",
	-- 	version = false,
	-- 	opts = {},
	-- },
	-- File explorer (this works properly with oil unlike nvim-tree)
	{
		"echasnovski/mini.files",
		event = "VeryLazy",
		enabled = true,
		opts = {

			mappings = {
				go_in = "<CR>", -- Map both Enter and L to enter directories or open files
				go_in_plus = "L",
				go_out = "-",
				go_out_plus = "H",
				synchronize = "w",
			},
		},

		keys = {
			{
				"<leader>ee",
				"<cmd>lua require('mini.files').open()<CR>",
				desc = "Toggle mini file explorer",
			},
			{
				"<leader>ef",
				function()
					local MiniFiles = require("mini.files")
					MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
					MiniFiles.reveal_cwd()
				end,
				desc = "Toggle mini file explorer",
			},
		},
	},
	-- Surround
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 300,

			-- Module mappings. Use `''` (empty string) to disable one.
			-- INFO:
			-- saiw surround with no whitespace
			-- saw surround with whitespace
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "ds", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			-- Number of lines within which surrounding is searched
			n_lines = 20,

			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_type = false,

			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover",

			-- Whether to disable showing non-error feedback
			silent = false,
		},
	},
	-- Get rid of whitespace
	{
		"echasnovski/mini.trailspace",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local miniTrailspace = require("mini.trailspace")

			miniTrailspace.setup({
				only_in_normal_buffers = true,
			})
			vim.keymap.set("n", "<leader>cw", function()
				miniTrailspace.trim()
			end, { desc = "Erase Whitespace" })

			-- Ensure highlight never reappears by removing it on CursorMoved
			vim.api.nvim_create_autocmd("CursorMoved", {
				pattern = "*",
				callback = function()
					require("mini.trailspace").unhighlight()
				end,
			})
		end,
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		},
		config = function()
			local ai = require("mini.ai")
			local spec_treesitter = ai.gen_spec.treesitter
			ai.setup({
				n_lines = 500,
				custom_textobjects = {
					-- This will override default "function call" textobject
					f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
					c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
					i = spec_treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
				},
			})
		end,
	},
}
