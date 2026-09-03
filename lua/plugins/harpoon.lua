vim.pack.add({
	{
		src = "gh:ThePrimeagen/harpoon",
		version = "harpoon2",
	},
})

for i = 1, 7 do
	map("n", "g" .. i, function()
		require("harpoon"):list():select(i)
	end, { desc = "Harpoon File " .. i })
end

map("n", "ma", function()
	require("harpoon"):list():add()
end, { desc = "Harpoon Add File" })

-- Toggle quick menu
map("n", "ml", function()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Menu" })
