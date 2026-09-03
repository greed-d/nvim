vim.pack.add({
	{ src = "gh:folke/snacks.nvim" },
})
require("snacks").setup({
	dashboard = { enabled = false },
	indent = { enabled = true },
	picker = require("plugins.snacks.picker"),
	terminal = require("plugins.snacks.terminal"),
	statuscolumn = { enabled = true },
	notifier = {
		enabled = true,
		top_down = false,
		margin = { top = 0, right = 0, bottom = 1 },
	},

	image = { enabled = false },
	git = { enabled = false },
	gitbrowse = { enabled = false },
	bigfile = { enabled = true },
	-- explorer = { enabled = true },
	input = { enabled = true },
	quickfile = { enabled = false },
	scope = { enabled = false },
	words = { enabled = false },
	bufdelete = { enabled = false },
	scroll = { enabled = true },
	dim = { enabled = false },
})
-- Snacks Picker Keymaps
map({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })
map("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
map("n", "<leader>sb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>sn", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
map("n", "<leader>ss", function()
	Snacks.picker.pickers()
end, { desc = "Pick Pickers" })
map("n", "<leader>sf", function()
	Snacks.picker.files()
end, { desc = "Pick Pickers" })
map("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Search Help Pages" })
map("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { desc = "Highlights" })
map("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Search Keymaps" })
map("n", "<leader>s.", function()
	Snacks.picker.recent()
end, { desc = "Recent" })
map("n", "<leader>sc", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })
map("n", "<leader>sp", function()
	Snacks.picker.projects()
end, { desc = "Projects" })
map("n", "<leader>s/", function()
	Snacks.picker.grep({ buffers = true })
end, { desc = "[S]earch [/] in Open Files" })
map({ "n", "t" }, "<M-i>", function()
	Snacks.terminal()
end, { desc = "Toggle Terminal" })

map("n", "<leader>lg", function()
	Snacks.lazygit()
end, { desc = "[S]earch [/] in Open Files" })

map("n", "<leader>bk", function()
	Snacks.bufdelete()
end, { desc = "[B]uffer [K]ill" })
map("n", "<leader>bK", function()
	Snacks.bufdelete.all()
end, { desc = "[B]uffer [K]ill All" })

-- LSP: Goto & navigation
map("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })

map("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })

map("n", "grr", function()
	Snacks.picker.lsp_references()
end, { desc = "References", nowait = true })

map("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })

map("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto Type Definition" })

-- LSP: Symbols
map("n", "<leader>ds", function()
	Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })

map("n", "<leader>ws", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })

-- Notifications
map("n", "<leader>na", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })

map("n", "<leader>nh", function()
	Snacks.picker.notifications()
end, { desc = "Notification History" })

map("n", "<leader>nd", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })
