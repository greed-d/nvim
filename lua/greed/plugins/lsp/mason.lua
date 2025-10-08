return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
	keys = {
		{
			"<leader>cm",
			"<cmd>Mason<CR>",
			desc = "Summon mason",
		},
	},
	config = function()
		-- import mason and mason_lspconfig
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		-- NOTE: Moved these local imports below back to lspconfig.lua due to mason depracated handlers

		-- local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")             -- import cmp-nvim-lsp plugin
		-- local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config)

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- mason_lspconfig.setup({
		--     automatic_enable = false,
		--     -- servers for mason to install
		--     ensure_installed = {
		--         "lua_ls",
		--         "emmet_ls",
		--         "emmet_language_server",
		--         "marksman",
		--         "basedpyright",
		--         "ruff",
		--     },
		--
		-- })

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"prettierd",
			},

			-- NOTE: mason BREAKING Change! Removed setup_handlers
			-- moved lsp configuration settings back into lspconfig.lua file
		})
	end,
}
