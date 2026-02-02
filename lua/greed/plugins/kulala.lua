return {
	"mistweaverco/kulala.nvim",
	branch = "debug_fmt",
	enabled = true,
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
		{
			"<leader>rp",
			function()
				require("kulala").import("postman")
			end,
			desc = "Import from postman",
		},
		{
			"<leader>re",
			function()
				require("kulala").set_selected_env()
			end,
			desc = "Select environment"
		},
	},
	ft = { "http", "rest" },
	opts = {
		global_keymaps = false,
		global_keymaps_prefix = "<leader>R",
		kulala_keymaps_prefix = "",
		debug = false,
		ui = {
			max_response_size = 1048576
		}
	},
}
