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
}
