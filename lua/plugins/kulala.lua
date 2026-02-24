vim.pack.add({
	{
		src = "https://github.com/mistweaverco/kulala.nvim",
		-- version = 'v1.*', -- Use '*' to track tags/releases
	},
})

require("kulala").setup({})

map("n", "<leader>rs", function()
	require("kulala").run()
end, { desc = "Run current request" })

map("n", "<leader>ra", function()
	require("kulala").run_all()
end, { desc = "Run all requests" })

map("n", "<leader>rb", function()
	require("kulala").scratchpad()
end, { desc = "Open Kulala scratchpad" })

map("n", "<leader>rr", function()
	require("kulala").replay()
end, { desc = "Replay last request" })

map("n", "<leader>re", function()
	require("kulala").set_selected_env()
end, { desc = "Replay last request" })
