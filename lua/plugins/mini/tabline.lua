require("mini.tabline").setup({
	-- Whether to show file icons (requires 'mini.icons')
	show_icons = true,

	-- Function which formats the tab label
	-- By default surrounds with space and possibly prepends with icon
	format = nil,

	-- Where to show tabpage section in case of multiple vim tabpages.
	-- One of 'left', 'right', 'none'.
	tabpage_section = "right",
})

local function set_highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- set_highlight("MiniTablineCurrent", { bg = "NONE" })
set_highlight("MiniTablineTabpagesection", { bg = "NONE" })
-- Override tabline highlights
