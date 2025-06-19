return {
	"j-morano/buffer_manager.nvim",
	-- dependencies = {
	-- 	"nvim-lua/plenary.nvim",
	-- },
	opts = {
		select_menu_item_commands = {
			edit = {
				key = "L",
				command = "edit",
			},
			v = {
				key = "<C-v>",
				command = "vsplit",
			},
			h = {
				key = "<C-h>",
				command = "split",
			},
		},
		borderchars = {},
	},
	keys = {
		{
			"mb",
			function()
				require("buffer_manager.ui").toggle_quick_menu()
			end,
		},
	},
}
