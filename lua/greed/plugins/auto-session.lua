return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>qr", "<cmd>SessionRestore<CR>", desc = "Session Restore" },
		{ "<leader>qs", "<cmd>SessionSave<CR>", desc = "Save session" },
		{ "<leader>qa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
	},

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		session_lens = {
			load_on_setup = true,
			previewer = false,
			mappings = {
				delete_session = { "i", "<C-D>" },
				alternate_session = { "i", "<C-S>" },
				copy_session = { "i", "<C-Y>" },
			},
		},
	},
}
