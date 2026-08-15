vim.pack.add({
	"https://www.github.com/SmiteshP/nvim-navic",
})

require("nvim-navic").setup({
	lsp = {
		auto_attach = true,
		preference = { "ty", "ruff", "lua_ls", "clangd" },
	},

	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = " ",
		Interface = " ",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = " ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
	highlight = true,
	click = true,
})

-- Reserve space for navic even if there is no element to display
vim.opt.winbar = " "
