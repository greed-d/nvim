vim.pack.add({ "https://github.com/chrisgrieser/nvim-chainsaw.git" })

require("chainsaw").setup({})
local chainsaw = require("chainsaw")

map({ "v", "n" }, "<leader>lv", function()
	require("chainsaw").variableLog()
end, { desc = "Variable log" })
