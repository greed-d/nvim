-- INFO: read filenames on lsp/ directory and enable those
local lsp_files = {}
local lsp_dir = vim.fn.stdpath("config") .. "/lsp/"

for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
	-- Read the first line of the file
	local f = io.open(file, "r")
	local first_line = f and f:read("*l") or ""
	if f then
		f:close()
	end
	-- Only include the file if it doesn't start with "-- disable"
	if not first_line:match("^%-%- disable") then
		local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
		table.insert(lsp_files, name)
	end
end

-- Shared defaults merged into every language server config (see lsp/*.lua)
vim.lsp.config("*", {
	fileOperations = {
		didRename = true,
		willRename = true,
	},
})

vim.lsp.enable(lsp_files)
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({ border = "rounded" })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({ border = "rounded" })

vim.diagnostic.config({

	underline = true,
	virtual_text = {

		spacing = 4,
		source = "if_many",
		prefix = "●",
		-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
		-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
		-- prefix = "icons",
		current_line = true,
	},
	severity_sort = true,
	float = {
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

-- Extras

local function restart_lsp(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	for _, client in ipairs(clients) do
		vim.lsp.stop_client(client.id)
	end

	vim.defer_fn(function()
		vim.cmd("edit")
	end, 100)
end

vim.api.nvim_create_user_command("LspRestart", function()
	restart_lsp()
end, {})

local function lsp_info()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients and vim.lsp.get_clients({ bufnr = bufnr })
		or vim.lsp.get_clients({ bufnr = bufnr })

	print("═══════════════════════════════════")
	print("           LSP INFORMATION          ")
	print("═══════════════════════════════════")
	print("")

	-- Basic info
	print("󰈙 Language client log: " .. vim.lsp.get_log_path())
	print("󰈔 Detected filetype: " .. vim.bo.filetype)
	print("󰈮 Buffer: " .. bufnr)
	print("󰈔 Root directory: " .. (vim.fn.getcwd() or "N/A"))
	print("")

	if #clients == 0 then
		print("󰅚 No LSP clients attached to buffer " .. bufnr)
		print("")
		print("Possible reasons:")
		print("  • No language server installed for " .. vim.bo.filetype)
		print("  • Language server not configured")
		print("  • Not in a project root directory")
		print("  • File type not recognized")
		return
	end

	print("󰒋 LSP clients attached to buffer " .. bufnr .. ":")
	print("─────────────────────────────────")

	for i, client in ipairs(clients) do
		print(string.format("󰌘 Client %d: %s", i, client.name))
		print("  ID: " .. client.id)
		print("  Root dir: " .. (client.config.root_dir or "Not set"))
		print("  Command: " .. table.concat(client.config.cmd or {}, " "))
		print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

		-- Server status
		if client.is_stopped() then
			print("  Status: 󰅚 Stopped")
		else
			print("  Status: 󰄬 Running")
		end

		-- Workspace folders
		if client.workspace_folders and #client.workspace_folders > 0 then
			print("  Workspace folders:")
			for _, folder in ipairs(client.workspace_folders) do
				print("    • " .. folder.name)
			end
		end

		-- Attached buffers count
		local attached_buffers = {}
		for buf, _ in pairs(client.attached_buffers or {}) do
			table.insert(attached_buffers, buf)
		end
		print("  Attached buffers: " .. #attached_buffers)

		-- Key capabilities
		local caps = client.server_capabilities
		local key_features = {}
		if caps.completionProvider then
			table.insert(key_features, "completion")
		end
		if caps.hoverProvider then
			table.insert(key_features, "hover")
		end
		if caps.definitionProvider then
			table.insert(key_features, "definition")
		end
		if caps.documentFormattingProvider then
			table.insert(key_features, "formatting")
		end
		if caps.codeActionProvider then
			table.insert(key_features, "code_action")
		end

		if #key_features > 0 then
			print("  Key features: " .. table.concat(key_features, ", "))
		end

		print("")
	end

	-- Diagnostics summary
	local diagnostics = vim.diagnostic.get(bufnr)
	if #diagnostics > 0 then
		print("󰒡 Diagnostics Summary:")
		local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

		for _, diagnostic in ipairs(diagnostics) do
			local severity = vim.diagnostic.severity[diagnostic.severity]
			counts[severity] = counts[severity] + 1
		end

		print("   Errors: " .. counts.ERROR)
		print("   Warnings: " .. counts.WARN)
		print("   Info: " .. counts.INFO)
		print("  󰛨 Hints: " .. counts.HINT)
		print("  Total: " .. #diagnostics)
	else
		print("󰄬 No diagnostics")
	end

	print("")
	print("Use :LspLog to view detailed logs")
	print("Use :LspCapabilities for full capability list")
end

-- Create command
vim.api.nvim_create_user_command("LspInfo", lsp_info, { desc = "Show comprehensive LSP information" })


