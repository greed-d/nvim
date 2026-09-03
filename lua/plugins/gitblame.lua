require("custom.git-blame").setup({
	enabled = true,
	message_template = "  <author> • 󰥔 <date> • 󰦨 <summary> ",
	date_format = "%r",
	delay = 1000,
	max_summary_length = 30,
	get_git_root = function(...)
		return require("snacks").git.get_root(...)
	end,
})
