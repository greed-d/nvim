require("resonance").load({
	plugin = { src = "https://github.com/catppuccin/nvim" },
	name = "catppuccin",
	version = "main",

	event = { "User", pattern = "ForceLoadCatppuccin" },

	setup = function()
		require("catppuccin").setup({
			custom_highlights = function(colors)
				return {
					FloatBorder = { bg = "NONE", fg = colors.surface0 },
					SnacksPickerTitle = { bg = colors.blue, fg = colors.crust },
					SnacksPickerPreview = { bg = colors.mantle },
					SnacksPickerPreviewBorder = { bg = colors.mantle, fg = colors.mantle },
					SnacksPickerList = { bg = colors.mantle },
					SnacksPickerListTitle = { bg = colors.green, fg = colors.crust },
					SnacksPickerListBorder = { fg = colors.base, bg = colors.base },
					SnacksPickerInputTitle = { bg = colors.red, fg = colors.crust },
					SnacksPickerInputBorder = { bg = colors.base, fg = colors.base },
					SnacksPickerInputSearch = { bg = colors.red, fg = colors.base },
					SnacksPickerInput = { bg = colors.base },
					BlinkCmpMenu = { bg = "#191828" },
					LineNr = { fg = "#45475B" },
					CursorLineNr = { fg = "#B4BEFF" },
					-- BlinkCmpMenuBorder = { fg = '#191828', bg = '#191828' },
					BlinkCmpDocBorder = { fg = "#252434", bg = "#252434" },
				}
			end,
		})
		vim.cmd("colorscheme catppuccin-mocha")
	end,
})

vim.api.nvim_exec_autocmds("User", { pattern = "ForceLoadCatppuccin" })

-- local function set_highlight(group, opts)
-- 	vim.api.nvim_set_hl(0, group, opts)
-- end
--
-- local mocha = require("catppuccin.palettes").get_palette("mocha")
