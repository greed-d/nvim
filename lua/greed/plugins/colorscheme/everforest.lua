return {
	"sainnhe/everforest",
	lazy = false,
	enabled = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.g.everforest_enable_italic = false
		vim.g.everforest_disable_underline = false
		vim.g.everforest_dim_inactive_windows = false
		vim.g.everforest_diagnostic_line_highlight = false
		vim.g.everforest_float_style = "dim"
		vim.g.everforest_dim_inactive_windows = false
		vim.g.everforest_ui_contrast = "high"
		vim.cmd.colorscheme("everforest")

		local function set_highlight(group, opts)
			vim.api.nvim_set_hl(0, group, opts)
		end
		--
		-- set_highlight("FloatBorder", { fg = "NONE", bg = "NONE" })
		set_highlight("NormalNC", { bg = "#1e2326" })
		set_highlight("Normal", { bg = "#1e2326" })
		--
		-- vim.api.nvim_set_hl(0, "Normal", { link = "NormalNC" })
		set_highlight("SnacksPickerTitle", { bg = "#7fbbb3", fg = "#272e33" })
		set_highlight("SnacksPickerPreview", { bg = "#1e2326" })
		set_highlight("SnacksPickerList", { bg = "#1e2326" })
		set_highlight("SnacksPickerListTitle", { bg = "#9ece6a", fg = "#272e33" })
		set_highlight("SnacksPickerInputTitle", { bg = "#e67e80", fg = "#272e33" })
		set_highlight("SnacksPickerInputBorder", { bg = "#1e2326", fg = "#45475a" })
		set_highlight("SnacksPickerInputSearch", { bg = "#e67e80", fg = "#272e33" })
		set_highlight("SnacksPickerInput", { bg = "#1e2326" })
		set_highlight("VirtualTextHint", { fg = "#384b55" })
		set_highlight("VirtualTextInfo", { fg = "#7fbbb3" })
		set_highlight("VirtualTextError", { fg = "#e67e80" })
		set_highlight("VirtualTextWarning", { fg = "#dbbc7f" })
		-- set_highlight("NormalFloat", { bg = "#1e2326" })
		set_highlight("BlinkCmpMenuSelection", { bg = "#374145" })
		-- set_highlight("BlinkCmpMenu", { bg = "#1e2326" })
		-- set_highlight("DropBarMenuSbar", { bg = "#1e2326" })
		-- set_highlight("WinBarNC", { bg = "#1e2326" })
		-- set_highlight("DiagnosticUnderlineError", { bg = "NONE" })
	end,
}
