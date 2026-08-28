-- =====================================================================
-- 🎵 Bootstrap Resonance.nvim
-- =====================================================================
local plugin_url = "https://github.com/Imngzx/resonance.nvim"
local pack_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/resonance.nvim"

if not vim.uv.fs_stat(pack_path) then
	vim.notify("󱑽 Resonating (Downloading resonance.nvim)...", vim.log.levels.INFO)
	vim.system({ "git", "clone", "--filter=blob:none", plugin_url, "--branch=main", pack_path }):wait()
end

vim.opt.rtp:prepend(pack_path)

vim.cmd("packadd resonance.nvim")

-- =====================================================================
-- 🚀 Configuration
-- =====================================================================
local resonance = require("resonance")

resonance.setup({
	ui = {
		border = "rounded", -- ("none", "single", "double", "rounded", "solid", "shadow")
		width = 0.65, -- (0.65 = 65%）
		height = 0.75, -- (0.75 = 75%）
	},
})

-- UI keymap binding
vim.keymap.set("n", "<leader>pL", resonance.open_ui, { desc = "[Float] Resonance UI" })

--plugins

-- [Theme]
-- load theme first to avoid flickering
require("plugins.colorscheme")

-- load core ui elements at the same time
local Snacks = require("plugins.snacks")
print(Snacks.git)
require("plugins.mini")

-- misc
require("plugins.cord")

-- NOTE: the reson I wrap my plugins with this block is because the mechanics of luajit
-- although resonance.nvim will block luajit to require the plugin until resonance sends it to rtp
-- but luajit will still read the config file (not the plugin)
-- this will cause some slow startup time
-- It doesnt meant that resonance is not lazy-loading

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- coding
		-- require("plugins.treesitter")
		-- require("plugins.treesitter-context")
		require("plugins.breadcrumbs")
		-- require("plugins.colorful-lsp-menu")
		-- require("plugins.ufo")
		-- require("custom.pairs").setup()
		-- require("custom.surround").setup()
		-- require("custom.word-jump")
		-- require("plugins.flash")

		-- UI
		require("plugins.lualine")
		-- require("custom.incline").setup()
		-- require("custom.lsp-loading").setup()
		-- require("custom.transparent").setup({ auto_enable = false })
		-- require("plugins.minimap")
		-- require("plugins.mini-hipatterns")
		-- require("plugins.markdown")
		-- require("plugins.csvview")

		-- Util
		require("plugins.oil")
		require("plugins.neotree")
		-- require("custom.repl").setup()
		-- require("plugins.venv-selector")
		-- require("plugins.dap")
		-- require("plugins.jisho")
		-- require("plugins.AI")
		-- require("plugins.atone")
		-- if not require("libs.utils").is_windows() then
		-- 	require("custom.language-switcher").setup()
		-- 	require("plugins.telegram")
		-- end
		-- require("config.neovide")
		-- require("custom.todo").setup()

		-- [git]
		-- require("custom.git").setup({
		-- 	stage_action = Snacks.picker.actions.git_stage,
		-- 	get_git_root = Snacks.git.get_root,
		-- })
		require("custom.git-blame").setup({
			enabled = true,
			message_template = "  󰈔 <summary>,  <author> (<date>)",
			date_format = "%r",
			delay = 1000,
			max_summary_length = 30,
			get_git_root = Snacks.git.get_root,
		})

		vim.schedule(function()
			local api = vim.api
			local uv_fs_stat = vim.uv.fs_stat
			local bufs = api.nvim_list_bufs()
			for i = 1, #bufs do
				local buf = bufs[i]
				local name = api.nvim_buf_get_name(buf)
				if api.nvim_buf_is_loaded(buf) and name ~= "" then
					local stat = uv_fs_stat(name)
					if stat and stat.type == "file" then
						pcall(api.nvim_exec_autocmds, "BufReadPre", { buf = buf, modeline = false })
						pcall(api.nvim_exec_autocmds, "BufReadPost", { buf = buf, modeline = false })
					else
						pcall(api.nvim_exec_autocmds, "BufNewFile", { buf = buf, modeline = false })
					end
					pcall(api.nvim_exec_autocmds, "FileType", { buf = buf, modeline = false })
				end
			end
		end)
	end,
})

-- NOTE: must put this at the end of your init.lua!
resonance.trigger_verylazy()
