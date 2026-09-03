vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		-- Disable "format_on_save lsp_fallback" for languages that don't
		-- have a well standardized coding style. You can add additional
		-- languages here or re-enable it for the disabled ones.
		local disable_filetypes = { c = true, cpp = true }
		local lsp_format_opt
		if disable_filetypes[vim.bo[bufnr].filetype] then
			lsp_format_opt = "never"
		else
			lsp_format_opt = "fallback"
		end
		return {
			timeout_ms = 500,
			lsp_format = lsp_format_opt,
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "prettierd" },
		css = { "prettierd" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		toml = { "taplo" },
		-- python = { "black", "isort" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		html = { "djlint" },
		cpp = { "clang-format" },
		http = { "kulala-fmt" },
		sh = { "shellharden" },
		kdl = { "kdlfmt" },
		go = { "gofmt", "goimports-reviser" },
		-- Conform can also run multiple formatters sequentially

		-- python = { "isort", "black" },
		--
		-- You can use 'stop_after_first' to run the first available formatter from the list
		-- javascript = { "prettierd", "prettier", stop_after_first = true },
	},
	formatters = {
		["goimports-reviser"] = {
			cwd = require("conform.util").root_file({ "go.mod" }),
			require_cwd = true,
		},
	},
})
