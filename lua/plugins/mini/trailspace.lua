local miniTrailspace = require("mini.trailspace")
require("resonance").load({
	miniTrailspace.setup({
		only_in_normal_buffers = true,
	}),
})

map("n", "<leader>cw", function()
	miniTrailspace.trim()
end)
