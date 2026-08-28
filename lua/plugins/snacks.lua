require("resonance").load({
	{ src = "https://github.com/folke/snacks.nvim" },
	event = { "User", pattern = "VeryLazy" },
	config = function()
		require("snacks").setup({
			dashboard = { enabled = false },
			indent = { enabled = true },
			picker = {
				indent = {
					enabled = true,
					char = "▏",
				},
				scope = {
					enabled = true,
					underline = true,
					char = "▏",
				},
				animate = {
					enabled = vim.fn.has("nvim-0.10") == 1,
					style = "up_down",
					duration = {
						step = 20,
						total = 500,
					},
				},
				chunk = {
					enabled = true,
				},

				filter = function(buf)
					local b = vim.b[buf]
					local bo = vim.bo[buf]
					local excluded_filetypes = {
						markdown = true,
						text = true,
					}
					return vim.g.snacks_indent ~= false
						and b.snacks_indent ~= false
						and bo.buftype == ""
						and not excluded_filetypes[bo.filetype]
				end,
			},
			terminal = {
				enabled = true,
				win = {
					position = "float",
					style = "terminal",
				},
				inteactive = true,
			},
			statuscolumn = { enabled = true },
			notifier = {
				enabled = true,
				top_down = false,
				margin = { top = 0, right = 0, bottom = 1 },
			},

			image = { enabled = false },
			git = { enabled = true },
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
	end,

	keys = {
		{
			{ "n", "x" },
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
		},
		{
			"n",
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"n",
			"<leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"n",
			"<leader>sn",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"n",
			"<leader>ss",
			function()
				Snacks.picker.pickers()
			end,
			desc = "Pick Pickers",
		},
		{
			"n",
			"<leader>sf",
			function()
				Snacks.picker.files()
			end,
			desc = "Pick Pickers",
		},
		{
			"n",
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Search Help Pages",
		},
		{
			"n",
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"n",
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Search Keymaps",
		},
		{
			"n",
			"<leader>s.",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"n",
			"<leader>sc",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"n",
			"<leader>sp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"n",
			"<leader>s/",
			function()
				Snacks.picker.grep({ buffers = true })
			end,
			desc = "[S]earch [/] in Open Files",
		},
		{
			{ "n", "t" },
			"<M-i>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"n",
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "[S]earch [/] in Open Files",
		},
		{
			"n",
			"<leader>bk",
			function()
				Snacks.bufdelete()
			end,
			desc = "[B]uffer [K]ill",
		},
		{
			"n",
			"<leader>bK",
			function()
				Snacks.bufdelete.all()
			end,
			desc = "[B]uffer [K]ill All",
		},
		-- LSP: Goto & navigation
		{
			"n",
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"n",
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"n",
			"grr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "References",
			nowait = true,
		},
		{
			"n",
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"n",
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto Type Definition",
		},
		-- LSP: Symbols
		{
			"n",
			"<leader>ds",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"n",
			"<leader>ws",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		-- Notifications
		{
			"n",
			"<leader>na",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"n",
			"<leader>nh",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"n",
			"<leader>nd",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
	},
})
-- Snacks Picker Keymaps
-- map({ "n", "x" }, "<leader>sw", function()
-- 	Snacks.picker.grep_word()
-- end, { desc = "Visual selection or word" })
-- map("n", "<leader>sg", function()
-- 	Snacks.picker.grep()
-- end, { desc = "Grep" })
-- map("n", "<leader>sb", function()
-- 	Snacks.picker.buffers()
-- end, { desc = "Buffers" })
-- map("n", "<leader>sn", function()
-- 	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "Find Config File" })
-- map("n", "<leader>ss", function()
-- 	Snacks.picker.pickers()
-- end, { desc = "Pick Pickers" })
-- map("n", "<leader>sf", function()
-- 	Snacks.picker.files()
-- end, { desc = "Pick Pickers" })
-- map("n", "<leader>sh", function()
-- 	Snacks.picker.help()
-- end, { desc = "Search Help Pages" })
-- map("n", "<leader>sH", function()
-- 	Snacks.picker.highlights()
-- end, { desc = "Highlights" })
-- map("n", "<leader>sk", function()
-- 	Snacks.picker.keymaps()
-- end, { desc = "Search Keymaps" })
-- map("n", "<leader>s.", function()
-- 	Snacks.picker.recent()
-- end, { desc = "Recent" })
-- map("n", "<leader>sc", function()
-- 	Snacks.picker.colorschemes()
-- end, { desc = "Colorschemes" })
-- map("n", "<leader>sp", function()
-- 	Snacks.picker.projects()
-- end, { desc = "Projects" })
-- map("n", "<leader>s/", function()
-- 	Snacks.picker.grep({ buffers = true })
-- end, { desc = "[S]earch [/] in Open Files" })
-- map({ "n", "t" }, "<M-i>", function()
-- 	Snacks.terminal()
-- end, { desc = "Toggle Terminal" })
--
-- map("n", "<leader>lg", function()
-- 	Snacks.lazygit()
-- end, { desc = "[S]earch [/] in Open Files" })
--
-- map("n", "<leader>bk", function()
-- 	Snacks.bufdelete()
-- end, { desc = "[B]uffer [K]ill" })
-- map("n", "<leader>bK", function()
-- 	Snacks.bufdelete.all()
-- end, { desc = "[B]uffer [K]ill All" })
--
-- -- LSP: Goto & navigation
-- map("n", "gd", function()
-- 	Snacks.picker.lsp_definitions()
-- end, { desc = "Goto Definition" })
--
-- map("n", "gD", function()
-- 	Snacks.picker.lsp_declarations()
-- end, { desc = "Goto Declaration" })
--
-- map("n", "grr", function()
-- 	Snacks.picker.lsp_references()
-- end, { desc = "References", nowait = true })
--
-- map("n", "gI", function()
-- 	Snacks.picker.lsp_implementations()
-- end, { desc = "Goto Implementation" })
--
-- map("n", "gy", function()
-- 	Snacks.picker.lsp_type_definitions()
-- end, { desc = "Goto Type Definition" })
--
-- -- LSP: Symbols
-- map("n", "<leader>ds", function()
-- 	Snacks.picker.lsp_symbols()
-- end, { desc = "LSP Symbols" })
--
-- map("n", "<leader>ws", function()
-- 	Snacks.picker.lsp_workspace_symbols()
-- end, { desc = "LSP Workspace Symbols" })
--
-- -- Notifications
-- map("n", "<leader>na", function()
-- 	Snacks.notifier.show_history()
-- end, { desc = "Notification History" })
--
-- map("n", "<leader>nh", function()
-- 	Snacks.picker.notifications()
-- end, { desc = "Notification History" })
--
-- map("n", "<leader>nd", function()
-- 	Snacks.notifier.hide()
-- end, { desc = "Dismiss All Notifications" })
