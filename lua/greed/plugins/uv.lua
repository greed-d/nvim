return {
	"benomahony/uv.nvim",
	ft = "python",
	lazy = true,
	opts = {
		picker_integration = true,
		keymaps = {
			prefix = "<leader>uv", -- Main prefix for uv commands
			commands = true, -- Show uv commands menu (<leader>x)
			run_file = true, -- Run current file (<leader>xr)
			run_selection = true, -- Run selected code (<leader>xs)
			run_function = true, -- Run function (<leader>xf)
			venv = true, -- Environment management (<leader>xe)
			init = true, -- Initialize uv project (<leader>xi)
			add = true, -- Add a package (<leader>xa)
			remove = true, -- Remove a package (<leader>xd)
			sync = true, -- Sync packages (<leader>xc)
			sync_all = true, -- Sync all packages, extras and groups (<leader>xC)
		},
	},
}
