
local miniTrailspace = require("mini.trailspace")

miniTrailspace.setup({
  only_in_normal_buffers = true,
})

map("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Trim trailing whitespace" })
