-- local blink = require("blink.cmp")
-- Use pcall to check if blink is actually ready
local ok, blink = pcall(require, "blink.cmp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
if ok then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh" },
	root_markers = {
		".git",
	},
	settings = {
		bashls = {},
	},
	capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), capabilities, {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}
