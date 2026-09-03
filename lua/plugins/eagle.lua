vim.pack.add({ "gh:soulis-1256/eagle.nvim" })

require("eagle").setup({
	show_headers = true,
	order = 1,
	concealcursor = "nv",
	conceallevel = 1,
	improved_markdown = true,
	mouse_mode = true,
	keyboard_mode = true,
	logging = false,
	close_on_cmd = true,
	show_lsp_info = true,
	scrollbar_offset = 0,
	max_width_factor = 2,
	max_height_factor = 2.5,
	render_delay = 500,
	detect_idle_timer = 50,
	window_row = 1,
	window_col = 5,
	border = "rounded",
	title = "",
	title_pos = "center",
	title_color = "#8AAAE5",
	border_color = "#8AAAE5",
	diagnostic_header_color = "",
	lsp_info_header_color = "",
	diagnostic_content_color = "",
	lsp_info_content_color = "",
})

-- For window to show on mouse hover
vim.o.mousemoveevent = true

-- Keyboard diagnostics if possible
map("n", "<leader>cd", ":EagleWin<CR>", { desc = "Show diagnostic window", noremap = true, silent = true })
