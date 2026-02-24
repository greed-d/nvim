return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<C-h>"] = false,
			["C-c"] = false,
			["q"] = { "actions.close", mode = "n" },
		},
	},

	keys = {
		{
			"-",
			":Oil<CR>",
			{
				desc = "Open Oil",
				silent = true,
			},
		},
		{
			"<leader>_",
			function()
				require("oil").toggle_float()
			end,
			desc = "Open Oil",
		},
	},
	-- Optional dependencies
	dependencies = { "DaikyXendo/nvim-material-icon" },
}
