return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	},
	keys = function()
		local keys = {
			{
				"'s",
				function()
					require("harpoon"):list():add()
				end,
				{
					desc = "Harpoon File",
					nnoremap = true,
				},
			},
			{
				"ml",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				{
					desc = "Harpoon Quick Menu",
					nnoremap = true,
				},
			},
			{
				"'1",
				function()
					require("harpoon"):list():select(1)
				end,
				{
					desc = "1st File harpoon",
					nnoremap = true,
				},
			},
			{
				"'2",
				function()
					require("harpoon"):list():select(2)
				end,
				{
					desc = "2nd File harpoon",
					nnoremap = true,
				},
			},
			{
				"'3",
				function()
					require("harpoon"):list():select(3)
				end,
				{
					desc = "3rd File harpoon",
					nnoremap = true,
				},
			},
			{
				"'4",
				function()
					require("harpoon"):list():select(4)
				end,
				{
					desc = "4th File harpoon",
					nnoremap = true,
				},
			},
			{
				"'5",
				function()
					require("harpoon"):list():select(5)
				end,
				{
					desc = "5th File harpoon",
					nnoremap = true,
				},
			},
			{
				"'6",
				function()
					require("harpoon"):list():select(6)
				end,
				{
					desc = "6th File harpoon",
					nnoremap = true,
				},
			},
		}
		return keys
	end,
}
