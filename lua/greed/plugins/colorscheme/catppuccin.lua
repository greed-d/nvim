return {
	"catppuccin/nvim",
	name = "catppuccin",
	enabled = true,
	priority = 1000,
	config = function()
		require("catppuccin").setup({})

		vim.cmd.colorscheme("catppuccin")
		local function set_highlight(group, opts)
			vim.api.nvim_set_hl(0, group, opts)
		end
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		set_highlight("FloatBorder", { fg = mocha.surface2, bg = mocha.base })
		set_highlight("NormalFloat", { fg = mocha.surface2, bg = mocha.base })
		set_highlight("SnacksPickerList", { fg = mocha.subtext0, bg = mocha.base })
		set_highlight("SnacksPickerListTitle", { fg = mocha.crust, bg = mocha.green })
		set_highlight("SnacksPickerInputTitle", { fg = mocha.crust, bg = mocha.sapphire })
		set_highlight("SnacksPickerPreviewTitle", { fg = mocha.crust, bg = mocha.blue })
		set_highlight("SnacksPickerInput", { fg = mocha.subtext0, bg = mocha.base })

		-- setup must be called before loading
	end,
}
