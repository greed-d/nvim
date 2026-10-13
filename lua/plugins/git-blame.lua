require("custom.git-blame").setup({
	enabled = true,
	message_template = "   <author> · 󰥔 <date> · 󰦨 <summary> ",
	message_when_not_committed = "   Not Committed Yet",
	date_format = "%r",
	delay = 100,
	max_summary_length = 30,
	get_git_root = function(filepath)
		local ok, snacks = pcall(require, "snacks")
		if ok and snacks.git and snacks.git.get_root then
			return snacks.git.get_root(filepath)
		end
		return vim.fs.root(filepath, ".git")
	end,
})

map("n", "<leader>gb", function()
	local ok, snacks = pcall(require, "snacks")
	if ok and snacks.git and snacks.git.blame_line then
		snacks.git.blame_line()
	else
		require("gitsigns").blame_line()
	end
end, { desc = "git [b]lame line" })
