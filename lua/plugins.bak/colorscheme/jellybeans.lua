return {
	"wtfox/jellybeans.nvim",
	enabled = false,
	lazy = false,
	priority = 1000,
	opts = {}, -- Optional
	config = function()
		vim.cmd([[colorscheme jellybeans-mono]])

		local function set_highlight(group, opts)
			vim.api.nvim_set_hl(0, group, opts)
		end

		set_highlight("NormalFloat", { bg = "#151515" })
		set_highlight("SnacksPickerList", { bg = "#151515" })
		set_highlight("BlinkCmpMenuSelection", { bg = "#403c41" })
	end,
}
