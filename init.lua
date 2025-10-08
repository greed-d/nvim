local o = vim.opt
local key = vim.keymap.set
local keymap_opts = function(message)
	return { desc = message, silent = true }
end

o.number = true
o.relativenumber = true
o.cursorline = true
o.swapfile = false
o.clipboard = "unnamedplus"
o.tabstop = 4
o.shiftwidth = 4
o.signcolumn = "yes"
o.winborder = "rounded"


vim.g.mapleader = " "
key({ "n", "v" }, "<leader>rl", ":source<CR>", keymap_opts("Source files"))
key({ "n", "v" }, "<leader>f", ":write<CR>", keymap_opts("Save file"))
key({ "n", "v" }, "<leader>q", ":quit<CR>", keymap_opts("Quit"))
key("n", "<leader>q", ":quit<CR>", keymap_opts("Quit"))
key("n", "<Esc>", ":noh<CR>", keymap_opts("Quit"))
-- key("n", "<C-c>", "

vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },

	-- { src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	-- {src="https://github.com/folke/lazydev.nvim"},

	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

-- [[ CALL PLUGIN SETUP ]]
require "mini.pick".setup()
require "oil".setup({
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
	columns = {
		"permissions",
		"icon",
	},
	float = {
		max_width = 0.7,
		max_height = 0.6,
		border = "rounded",
	},
})


-- [[ PLUGIN SETTINGS ]]

-- key( "n", "<leader>sf",function() Snacks.picker.files() end, { desc = "quit" })
key("n", "<leader>sf", ":Pick files<CR>", keymap_opts("Search files"))
key("n", "<leader>sh", ":Pick help<CR>", keymap_opts("Search help"))
key("n", "-", ":Oil<CR>", keymap_opts("Oil"))

-- [[ LSP STUFF ]]
local server = {
	"lua_ls",
	"basedpyright"
}

vim.lsp.enable(server)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
vim.cmd [[set completeopt+=menuone,noselect,popup]]

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
key("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
key("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
key("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
key("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
key("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
key("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
key("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

key("n", "<leader>cf", vim.lsp.buf.format, { desc = "format" })
key("n", "<leader>cr", vim.lsp.buf.rename, { desc = "format" })

vim.cmd("colorscheme vague")
vim.api.nvim_set_hl(0, "StatusLine", { bg = NONE })
