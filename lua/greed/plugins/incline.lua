return {
	-- Adding a filename to the Top Right
	{
		"b0o/incline.nvim",
		enabled = true,
		dependencies = { "DaikyXendo/nvim-material-icon" },
		config = function()
			local devicons = require("nvim-web-devicons")

			require("incline").setup({
				window = {
					placement = {
						vertical = "top",
						horizontal = "right",
					},
					padding = 0,
					margin = { vertical = 0, horizontal = 0 },
				},
				hide = {
					cursorline = true,
				},
				render = function(props)
					local bufname = vim.api.nvim_buf_get_name(props.buf)
					local filename = vim.fn.fnamemodify(bufname, ":t")
					if filename == "" then
						filename = "[Empty]"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local parent_dir = vim.fn.fnamemodify(bufname, ":h:t")

					local function get_harpoon_items()
						local harpoon = require("harpoon")
						local marks = harpoon:list().items
						local current_file_path = vim.fn.expand("%:p:.")
						local label = {}

						for id, item in ipairs(marks) do
							if item.value == current_file_path then
								table.insert(label, { id .. " ", guifg = "#FFFFFF", gui = "bold" })
							else
								table.insert(label, { id .. " ", guifg = "#434852" })
							end
						end

						if #label > 0 then
							table.insert(label, 1, { "󰛢 ", guifg = "#61AfEf" })
							table.insert(label, { "| " })
						end
						return label
					end

					local function get_file_name()
						local label = {}
						table.insert(label, { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" })
						table.insert(label, { parent_dir .. "/", guifg = "#888888", gui = "italic" })
						table.insert(label, { filename, gui = vim.bo[props.buf].modified and "bold" or "bold" })
						table.insert(label, { vim.bo[props.buf].modified and "  " or "", guifg = "#d19a66" })
						if not props.focused then
							label["group"] = "BufferInactive"
						end
						return label
					end

					return {
						{ "", guifg = "#0c0e14" },
						{
							{ get_harpoon_items() },
							{ get_file_name() },
							guibg = "#0c0e14",
						},
						{ "", guifg = "#0c0e14" },
					}
				end,
			})
		end,
	},
}
