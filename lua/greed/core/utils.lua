local path = function()
	return vim.fn.expand("%:p:.")
end
local function open(dir, path)
	vim.fn.chdir(dir)
	vim.cmd("Git diff " .. path)
	local timer = vim.loop.new_timer()
	local fug_win = vim.api.nvim_get_current_win()
	local fug_buf = vim.api.nvim_win_get_buf(fug_win)
	local ui = vim.api.nvim_list_uis()[1]
	local padding_w = 6 -- total horizontal padding
	local padding_h = 1 -- total vertical padding

	local win_opts = {
		border = "none",
		relative = "editor",
		style = "minimal",

		width = ui.width - padding_w,
		height = ui.height - padding_h,

		col = math.floor(padding_w / 2),
		row = math.floor(padding_h / 2),
	}
	local function mod_fugitive()
		vim.keymap.set("n", "q", function()
			vim.api.nvim_win_close(fug_win, true)
		end, {
			buffer = fug_buf,
			desc = "Close fugitive window with just q",
		})
		vim.keymap.set("n", "<Esc>", function()
			vim.api.nvim_win_close(fug_win, true)
		end, {
			buffer = fug_buf,
			desc = "Close fugitive window with just <Esc>",
		})
		local fug_floatwin = vim.api.nvim_create_augroup("fugitiveFloatwin", { clear = true })
		vim.api.nvim_create_autocmd("BufLeave", {
			buffer = fug_buf,
			callback = function()
				vim.api.nvim_win_close(fug_win, true)
				vim.api.nvim_del_augroup_by_id(fug_floatwin)
			end,
			desc = "Close fugitive floating window after we leave it",
			group = fug_floatwin,
		})
		return vim.api.nvim_win_set_config(fug_win, win_opts)
	end
	return timer:start(1, 0, vim.schedule_wrap(mod_fugitive))
end

-- Example keymap
vim.keymap.set("n", "<leader>gd", function()
	open(vim.fn.getcwd(), path())
end, { desc = "Open fugitive in floating window" })
