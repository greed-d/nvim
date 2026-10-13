vim.pack.add({
	{ src = "gh:nvim-treesitter/nvim-treesitter" },
})

-- vim.cmd.packadd("nvim-treesitter")

-- 3. Now require will work
-- local status, configs = pcall(require, "nvim-treesitter.configs")
-- if not status then
-- 	-- If it still fails, print the error so we can see why
-- 	print("Treesitter still not found: " .. configs)
-- 	return
-- end

-- NOTE: Claude rewrote config

require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"diff",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"query",
		"vim",
		"vimdoc",
		"python",
		"regex",
		"go",
	},
	auto_install = true,
	install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local filetype = args.match
		local lang = vim.treesitter.language.get_lang(filetype)
		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start()
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

-- require("nvim-treesitter.config").setup({
-- 	ensure_installed = {
-- 		"bash",
-- 		"diff",
-- 		"html",
-- 		"lua",
-- 		"luadoc",
-- 		"markdown",
-- 		"markdown_inline",
-- 		"query",
-- 		"vim",
-- 		"vimdoc",
-- 		"python",
-- 		"regex",
-- 		"bash",
-- 	},
-- 	incremental_selection = {
-- 		enable = true,
-- 		keymaps = {
-- 			init_selection = "<leader><leader>",
-- 			node_incremental = "<leader><leader>",
-- 			scope_incremental = "grc",
-- 			node_decremental = "grm",
-- 		},
-- 	},
-- 	auto_install = true,
-- 	highlight = {
-- 		enable = true,
-- 		additional_vim_regex_highlighting = { "ruby" },
-- 	},
-- 	indent = { enable = true, disable = { "ruby" } },
-- })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "python", "lua" },
-- 	callback = function()
-- 		vim.treesitter.start()
-- 	end,
-- })
