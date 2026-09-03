vim.pack.add({
	{ src = "gh:catppuccin/nvim" },
})

require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		notify = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
})

vim.cmd.colorscheme("catppuccin-nvim")
local function set_highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local mocha = require("catppuccin.palettes").get_palette("mocha")

set_highlight("FloatBorder", { bg = "NONE", fg = mocha.surface0 })
set_highlight("SnacksPickerTitle", { bg = mocha.blue, fg = mocha.crust })
set_highlight("SnacksPickerPreview", { bg = mocha.mantle })
set_highlight("SnacksPickerPreviewBorder", { bg = mocha.mantle, fg = mocha.mantle })
set_highlight("SnacksPickerList", { bg = mocha.mantle })
set_highlight("SnacksPickerListTitle", { bg = mocha.green, fg = mocha.crust })
set_highlight("SnacksPickerListBorder", { fg = mocha.base, bg = mocha.base })
set_highlight("SnacksPickerInputTitle", { bg = mocha.red, fg = mocha.crust })
set_highlight("SnacksPickerInputBorder", { bg = mocha.base, fg = mocha.base })
set_highlight("SnacksPickerInputSearch", { bg = mocha.red, fg = mocha.base })
set_highlight("SnacksPickerInput", { bg = mocha.base })
set_highlight("BlinkCmpMenu", { bg = "#191828" })
set_highlight("LineNr", { fg = "#45475B" })
set_highlight("CursorLineNr", { fg = "#B4BEFF" })
-- set_highlight("BlinkCmpMenuBorder", { fg = "#191828", bg = "#191828" })
set_highlight("BlinkCmpDocBorder", { fg = "#252434", bg = "#252434" })
set_highlight("MiniTablineCurrent", { bg = mocha.surface1, bold = true })
set_highlight("MiniTablineModifiedCurrent", { bg = mocha.surface1, fg = mocha.red, bold = true, italic = true })

-- Mini Icons color override?
set_highlight("MiniIconsAzure", { fg = mocha.sapphire })
set_highlight("MiniIconsBlue", { fg = mocha.blue })
set_highlight("MiniIconsCyan", { fg = mocha.sky })
set_highlight("MiniIconsGreen", { fg = mocha.green })
set_highlight("MiniIconsGrey", { fg = mocha.subtext0 })
set_highlight("MiniIconsOrange", { fg = mocha.peach })
set_highlight("MiniIconsPurple", { fg = mocha.mauve })
set_highlight("MiniIconsRed", { fg = mocha.red })
set_highlight("MiniIconsYellow", { fg = mocha.yellow })
