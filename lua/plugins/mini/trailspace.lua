
local miniTrailspace = require("mini.trailspace")
require('mini.trailspace').setup({
  miniTrailspace.setup({
    only_in_normal_buffers = true,
  })}
)

map("n", "<leader>cw", function() miniTrailspace.trim() end)
