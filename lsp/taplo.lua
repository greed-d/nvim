local ok, blink = pcall(require, "blink.cmp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
if ok then
	capabilities = blink.get_lsp_capabilities(capabilities)
end
-- local blink = require("blink.cmp")
return {
	cmd = { "taplo", "lsp", "stdio" },
	filetypes = { "toml" },
	root_markers = {
		".git",
	},
	settings = {},
	capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), capabilities, {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}
