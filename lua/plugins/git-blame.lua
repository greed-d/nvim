require("custom.git-blame").setup({
	enabled = true,
	message_template = "   <author> · 󰥔 <date> · 󰦨 <summary> ",
	message_when_not_committed = "   Not Committed Yet",
	date_format = "%r",
	delay = 100,
	max_summary_length = 30,
	function()
		local ok, snacks = pcall(require, "snacks")
		if ok and snacks.git then
			get_git_root = snacks.git.get_root
		end
	end,
})

map("n", "<leader>gb", function()
	local ok, snacks = pcall(require, "snacks")
	if ok and snacks.git then
		Snacks.git.blame_line()
	end
end, { desc = "git [b]lame line" })
