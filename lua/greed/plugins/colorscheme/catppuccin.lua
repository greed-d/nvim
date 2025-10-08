return {
	"catppuccin/nvim",
	name = "catppuccin",
	enabled = false,
	priority = 1000,
	config = function()
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
		set_highlight("BlinkCmpDoc", { bg = "#252434" })
		-- set_highlight("BlinkCmpMenuBorder", { fg = "#191828", bg = "#191828" })
		set_highlight("BlinkCmpDocBorder", { fg = "#252434", bg = "#252434" })
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			auto_integrations = false,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		vim.cmd.colorscheme("catppuccin")
		local function set_highlight(group, opts)
			vim.api.nvim_set_hl(0, group, opts)
		end
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		set_highlight("FloatBorder", { fg = mocha.surface2, bg = mocha.base })
		set_highlight("NormalFloat", { fg = mocha.surface2, bg = mocha.base })
		set_highlight("SnacksPickerList", { fg = mocha.subtext0, bg = mocha.base })
		set_highlight("SnacksPickerListTitle", { fg = mocha.crust, bg = mocha.green })
		set_highlight("SnacksPickerInputTitle", { fg = mocha.crust, bg = mocha.lavender })
		set_highlight("SnacksPickerPreviewTitle", { fg = mocha.crust, bg = mocha.blue })
		set_highlight("SnacksPickerInput", { fg = mocha.subtext0, bg = mocha.base })
	end,
}
