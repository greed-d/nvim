vim.api.nvim_create_autocmd("PackChanged", {
	pattern = "peek.nvim",
	group = vim.api.nvim_create_augroup("peek-build", { clear = true }),
	callback = function(e)
		local kind = e.data.kind
		if kind == "install" or kind == "update" then
			vim.system({ "deno", "task", "--quiet", "build:fast" }, { cwd = e.data.path })
		end
	end,
})

vim.pack.add({ "gh:toppair/peek.nvim" })

require("peek").setup()
vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
