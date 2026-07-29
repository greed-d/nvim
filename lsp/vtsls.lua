local ok, blink = pcall(require, "blink.cmp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
if ok then
	capabilities = blink.get_lsp_capabilities(capabilities)
end
return {
	cmd = { "vtsls", "--stdio" },
	filetypes = { "typescript", "javascript", "tsx" },
	root_markers = {
		"node_modules/",
		".git",
	},
	settings = {
		vtsls = {},
	},
	capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), capabilities, {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}
