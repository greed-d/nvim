if vim.g.neovide then
	-- [[ TEXT SETTINGS ]]
	vim.o.guifont = "JetBrainsMono Nerd Font:h11"
	vim.o.linespace = 6
	vim.g.neovide_text_gamma = 0.8
	vim.g.neovide_text_contrast = 0.1
	vim.g.neovide_scale_factor = 0.8

	-- [[ CUSROR ANIMATIONS ]]
	vim.g.neovide_cursor_animation_length = 0.1
	vim.g.neovide_cursor_trail_size = 2
	-- vim.g.neovide_cursor_animate_in_insert_mode = false
	-- vim.g.neovide_cursor_animate_command_line = false

	-- vim.g.neovide_position_animation_length = 0
	-- vim.g.neovide_scroll_animation_far_lines = 0
	-- vim.g.neovide_scroll_animation_length = 0.00
	-- [[ KEYMAPS ]]
	vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
