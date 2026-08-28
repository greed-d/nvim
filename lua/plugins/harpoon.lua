vim.pack.add({
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
	},
})

map("n", "<C-j><C-j>", function()
	require("harpoon"):list():select(1)
end)
map("n", "<C-j><C-k>", function()
	require("harpoon"):list():select(2)
end)
map("n", "<C-j><C-l>", function()
	require("harpoon"):list():select(3)
end)
map("n", "<C-j><C-;>", function()
	require("harpoon"):list():select(4)
end)
map("n", "<C-k><C-k>", function()
	require("harpoon"):list():select(5)
end)
map("n", "<C-l><C-l>", function()
	require("harpoon"):list():select(6)
end)

-- for i = 1, 7 do
-- 	map("n", "g" .. i, function()
-- 		require("harpoon"):list():select(i)
-- 	end, { desc = "Harpoon File " .. i })
-- end

map("n", "ma", function()
	require("harpoon"):list():add()
end, { desc = "Harpoon Add File" })

-- Toggle quick menu
map("n", "ml", function()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Menu" })
