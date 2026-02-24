return {
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
}
