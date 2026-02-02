--
local lualine = require("lualine")

local my_filename = require("lualine.components.filename"):extend()
my_filename.apply_icon = require("lualine.components.filetype").apply_icon

local mocha = require("catppuccin.palettes").get_palette("mocha")

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		globalstatus = true,
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = mocha.text, bg = mocha.base } },
			inactive = { c = { fg = mocha.text, bg = mocha.base } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},

	extensions = {
		"trouble",
		{
			sections = {
				lualine_a = {
					-- function()
					--   return " Lazygit"
					-- end,
					--
					--
				},
				lualine_b = { "branch" },
				lualine_c = {
					function()
						return " Lazygit"
					end,
					"oil",
					"neo-tree",
					"lazy",
					"overseer",
					"mason",
					"man",
					require("greed.plugins.snacks.lualine").lualine_custom,
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			filetypes = { "lazygit" },
		},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

-- ins_left({
--   function()
--     return "▊"
--   end,
--   color = { fg = mocha.blue }, -- Sets highlighting of component
--   padding = { left = 0, right = 1 }, -- We don't need space before this
-- })

ins_left({
	-- mode component
	"mode",
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = mocha.lavender,
			i = mocha.green,
			v = mocha.blue,
			[""] = mocha.blue,
			V = mocha.blue,
			c = mocha.flamingo,
			no = mocha.red,
			s = mocha.peach,
			S = mocha.peach,
			[""] = mocha.peach,
			ic = mocha.yellow,
			R = mocha.mauve,
			Rv = mocha.mauve,
			cv = mocha.red,
			ce = mocha.red,
			r = mocha.teal,
			rm = mocha.teal,
			["r?"] = mocha.teal,
			["!"] = mocha.red,
			t = mocha.red,
		}
		return { bg = mode_color[vim.fn.mode()], fg = mocha.base, gui = "bold" }
	end,
	padding = { right = 1, left = 1 },
	separator = { left = "", right = "" },
})

ins_left({
	my_filename,
	-- cond = conditions.buffer_not_empty,
	color = { fg = mocha.subtext0, bg = mocha.surface0, gui = "bold" },
	separator = { right = "" },
})
ins_left({
	"branch",
	icon = "",
	color = { fg = mocha.subtext0, bg = mocha.surface1, gui = "bold" },

	separator = { right = "" },
})

ins_left({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = " ", removed = " " },
	-- symbols = { added = "+", modified = "~", removed = "-" },
	diff_color = {
		added = { fg = mocha.green },
		modified = { fg = mocha.peach },
		removed = { fg = mocha.red },
	},
	cond = conditions.hide_in_width,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
	function()
		return "%="
	end,
})

ins_left({
	"lsp_progress",
	-- display_components = { "lsp_client_name", { "title", "percentage", "message" } },
	-- With spinner
	-- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
	colors = {
		percentage = mocha.sky,
		title = mocha.sky,
		message = mocha.sky,
		spinner = mocha.sky,
		lsp_client_name = mocha.flamingo,
		use = true,
	},
	separators = {
		component = " ",
		progress = " | ",
		percentage = { pre = "", post = "%% " },
		title = { pre = "", post = ": " },
		lsp_client_name = { pre = "[", post = "]" },
		spinner = { pre = "", post = "" },
		message = { commenced = "In Progress", completed = "Completed" },
	},
	display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
	timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
	spinner_symbols = { "󰪞 ", "󰪟 ", "󰪠 ", "󰪡 ", "󰪢 ", "󰪣 ", "󰪤 ", "󰪥 " },
})
ins_right({
	function()
		return "%="
	end,
})
ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = "󰅙 ", warn = " ", info = " ", hint = " " },
	diagnostics_color = {
		color_error = { fg = mocha.red },
		color_warn = { fg = mocha.yellow },
		color_info = { fg = mocha.sky },
		color_hint = { fg = mocha.blue },
	},
})

ins_right({
	-- Lsp server name .
	function()
		local msg = "NONE"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return string.upper(client.name)
			end
		end
		return msg
	end,
	icon = "",
	color = { fg = mocha.subtext0, bg = mocha.surface1, gui = "bold" },

	separator = { left = "" },
})

ins_right({ "fancy_macro", separator = { left = "" } })

-- ins_right({ "fancy_location" })
ins_right({
	function()
		local chars = setmetatable({
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
		}, {
			__index = function()
				return " "
			end,
		})
		local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
		local position = math.floor(line_ratio * 100)

		local icon = chars[math.floor(line_ratio * #chars)] .. position
		if position <= 5 then
			icon = " TOP"
		elseif position >= 97 then
			icon = " BOT"
		end
		return icon
	end,
	color = function()
		local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)

		if position <= 5 then
			return { fg = mocha.lavender, gui = "bold", bg = mocha.surface0 }
		elseif position >= 95 then
			return { fg = mocha.red, gui = "bold", bg = mocha.surface0 }
		else
			return { fg = mocha.lavender, bg = mocha.surface0, gui = "bold" }
		end
	end,
	separator = { left = "" },
})

ins_right({
	"fancy_cwd",
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = mocha.lavender,
			i = mocha.green,
			v = mocha.blue,
			[""] = mocha.blue,
			V = mocha.blue,
			c = mocha.flamingo,
			no = mocha.red,
			s = mocha.peach,
			S = mocha.peach,
			[""] = mocha.peach,
			ic = mocha.yellow,
			R = mocha.mauve,
			Rv = mocha.mauve,
			cv = mocha.red,
			ce = mocha.red,
			r = mocha.sky,
			rm = mocha.sky,
			["r?"] = mocha.sky,
			["!"] = mocha.red,
			t = mocha.red,
		}
		return { bg = mode_color[vim.fn.mode()], fg = mocha.base, gui = "bold" }
	end,
	-- padding = { right = 1, left = 1 },
	separator = { left = "", right = "" },
})
-- Add components to right sections
-- ins_right {
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = { fg = mocha.green, gui = 'bold' },
-- }

-- ins_right {
--   'fileformat',
--   fmt = string.upper,
--   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--   color = { fg = mocha.green, gui = 'bold' },
-- }

-- ins_right({
--   function()
--     return "▊"
--   end,
--   color = { fg = mocha.blue },
--   padding = { left = 1 },
-- })

-- Now don't forget to initialize lualine
lualine.setup(config)
