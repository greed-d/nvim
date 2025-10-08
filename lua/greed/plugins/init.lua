return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufRead",
		enabled = true,
		config = function()
			require("nvim-highlight-colors").setup({
				render = "virtual",
				virtual_symbol = "",
			})
		end,
	},
	{
		"toppair/peek.nvim",
		ft = "markdown",
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		"backdround/tabscope.nvim",
		event = "BufEnter",
		enabled = true,
		config = function()
			require("tabscope").setup({})
		end,
	},

	{
		"nvzone/showkeys",
		cmd = "ShowkeysToggle",
		opts = {
			timeout = 1,
			maxkeys = 5,
		},
	},
	{
		"askfiy/lsp_extra_dim",
		event = { "LspAttach" },
		config = function()
			require("lsp_extra_dim").setup()
		end,
	},
	{
		"tpope/vim-sleuth",
		event = "BufEnter",
	},
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		-- opts = {}
	},
	{
		"szymonwilczek/vim-be-better",
		cmd = "VimBeBetter",
		config = function()
			-- Optional: Enable logging for debugging
			vim.g.vim_be_better_log_file = 1
		end,
	},
	{
		"m4xshen/hardtime.nvim",
		enabled = true,
		event = "BufEnter",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},
	-- {
	-- 	"benomahony/uv.nvim",
	-- 	opts = {
	-- 		picker_integration = true,
	-- 	},
	-- },
	{
		"mistweaverco/kulala.nvim",
		keys = {
			{
				"<leader>rs",
				function()
					require("kulala").run()
				end,
				desc = " Run current request ",
			},

			{
				"<leader>ra",
				function()
					require("kulala").run_all()
				end,
				desc = " Run all request ",
			},
			{
				"<leader>rb",
				function()
					require("kulala").scratchpad()
				end,
				desc = "Open kualala scratchpad",
			},
			{
				"<leader>rr",
				function()
					require("kulala").replay()
				end,
				desc = "replay last request",
			},
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = false,
			global_keymaps_prefix = "<leader>R",
			kulala_keymaps_prefix = "",
		},
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},
}
