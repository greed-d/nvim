-- local blink = require("blink.cmp")
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = {
		".git",
	},
	settings = {},
	capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		-- blink.get_lsp_capabilities(),
		{
			fileOperations = {
				didRename = true,
				willRename = true,
			},
		}
	),
}
