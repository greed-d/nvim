return {
	"otavioschwanck/arrow.nvim",
	event = "BufReadPre",
	enabled = false,
	dependencies = {
		{ "DaikyXendo/nvim-material-icon" },
		-- or if using `mini.icons`
		-- { "echasnovski/mini.icons" },
	},
	opts = {
		show_icons = true,
		leader_key = ";", -- Recommended to be a single key
		buffer_leader_key = "m", -- Per Buffer Mappings
	},
}
