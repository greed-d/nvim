return {
	"nvzone/floaterm",
	enabled = false,
	dependencies = "nvzone/volt",
	opts = {
		border = false,
		size_h = 80,
		size_w = 90,

		-- Default sets of terminals you'd like to open
		terminals = {
			{ name = "Terminal" },
			-- cmd can be function too
			{ name = "Terminal", cmd = "nitch" },
			-- More terminals
		},
	},
	cmd = "FloatermToggle",
	keys = {
		{
			"<C-i>",
			":FloatermToggle<CR>",
			desc = "Floatterm toggle",
		},
	},
}
