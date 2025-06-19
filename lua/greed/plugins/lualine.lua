return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"DaikyXendo/nvim-material-icon",
		"greed-d/lualine-so-fancy.nvim",
		"arkav/lualine-lsp-progress",
	},

	event = "VeryLazy",
	config = function()
		-- Eviline config for lualine
		-- Author: shadmansaleh
		-- Credit: glepnir
		--
		local lualine = require("lualine")

		-- local arrow_statusline = require("arrow.statusline")
		local my_filename = require("lualine.components.filename"):extend()
		my_filename.apply_icon = require("lualine.components.filetype").apply_icon


-- Color table for highlights
-- stylua: ignore
    -- local colors = {
    --   bg       = '#1a1b2A',
    --   fg       = '#bbc2cf',
    --   yellow   = '#ECBE7B',
    --   cyan     = '#008080',
    --   darkblue = '#081633',
    --   green    = '#98be65',
    --   orange   = '#FF8800',
    --   violet   = '#a9a1e1',
    --   magenta  = '#c678dd',
    --   blue     = '#82AAFF',
    --   red      = '#ec5f67',
    -- }

local colors = {
  aqua     = "#b0b8c0",  -- cadet_blue
  bg       = "#151515",  -- background
  blue     = "#556779",  -- bayoux_blue
  cyan     = "#7AB0DF",  -- perano (assuming accent_color_2)
  darkred  = "#40000a",  -- temptress
  fg       = "#e8e8d3",  -- foreground
  gray     = "#1c1c1c",  -- grey_one
  green    = "#afd787",  -- ok
  lime     = "#54CED6",  -- fallback since green_smoke is undefined
  orange   = "#ffaf00",  -- warning
  pink     = "#a0a8b0",  -- wewak
  purple   = "#c7c7c7",  -- biloba_flower
  magenta  = "#c7c7c7",  -- same as purple
  red      = "#c95c5c",  -- error
  yellow   = "#888888",  -- koromiko
}
		-- local colors = {
		--   aqua = "#7AB0DF",
		--   bg = "#1C212A",
		--   blue = "#5FB0FC",
		--   cyan = "#70C0BA",
		--   darkred = "#FB7373",
		--   fg = "#C7C7CA",
		--   gray = "#222730",
		--   green = "#79DCAA",
		--   lime = "#54CED6",
		--   orange = "#FFD064",
		--   pink = "#D997C8",
		--   purple = "#C397D8",
		--   magenta = "#C397D8",
		--   red = "#F87070",
		--   yellow = "#FFE59E",
		-- }
		-- local colors = {
		--   aqua = "#83C092",
		--   bg = "#272E33", -- Using bg0 from the palette
		--   blue = "#7FBBB3",
		--   cyan = "#7FBBB3", -- Closest match from the palette (blue is similar to cyan in some schemes)
		--   darkred = "#4C3743", -- Using bg_red from the palette
		--   fg = "#D3C6AA",
		--   gray = "#7A8478", -- Using gray0 from the palette
		--   green = "#A7C080",
		--   lime = "#A7C080", -- Closest match from the palette (green)
		--   orange = "#E69875",
		--   pink = "#D699B6", -- Closest match from the palette (purple is similar to pink in some schemes)
		--   purple = "#D699B6",
		--   magenta = "#D699B6", -- Closest match from the palette (purple)
		--   red = "#E67E80",
		--   yellow = "#DBBC7F",
		-- }

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
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
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
		--   color = { fg = colors.blue }, -- Sets highlighting of component
		--   padding = { left = 0, right = 1 }, -- We don't need space before this
		-- })

		ins_left({
			-- mode component
			"mode",
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { bg = mode_color[vim.fn.mode()], fg = colors.bg, gui = "bold" }
			end,
			padding = { right = 1, left = 1 },
			-- separator = { left = "", right = "" },
		})

		-- ins_left {
		--   -- filesize component
		--   'filesize',
		--   cond = conditions.buffer_not_empty,
		-- }

		-- ins_left({
		--   function()
		--     local icon = "󰈚"
		--     local path = vim.api.nvim_buf_get_name(stbufnr())
		--     local name = (path == "" and "Empty") or path:match("([^/\\]+)[/\\]*$")
		--
		--     if name ~= "Empty" then
		--       local devicons_present, devicons = pcall(require, "nvim-web-devicons")
		--
		--       if devicons_present then
		--         local ft_icon = devicons.get_icon(name)
		--         icon = (ft_icon ~= nil and ft_icon) or icon
		--       end
		--     end
		--
		--     return { icon, name }
		--   end,
		-- })

		ins_left({
			my_filename,
			-- cond = conditions.buffer_not_empty,
			color = { fg = colors.magenta, bg = colors.bg, gui = "bold" },
		})

		-- ins_left({
		--
		--   function()
		--     return arrow_statusline.text_for_statusline_with_icons() -- Same, but with an bow and arrow icon ;D
		--   end,
		--   color = { fg = colors.aqua }, -- Sets highlighting of component
		--   -- padding = { left = 0, right = 1 }, -- We don't need space before this
		-- })

		ins_left({
			"branch",
			icon = "",
			color = { fg = colors.fg, bg = colors.bg, gui = "bold" },
		})

		ins_left({
			"diff",
			-- Is it me or the symbol for modified us really weird
			-- symbols = { added = " ", modified = " ", removed = " " },
			symbols = { added = "+", modified = "~", removed = "-" },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
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
				percentage = colors.cyan,
				title = colors.cyan,
				message = colors.cyan,
				spinner = colors.cyan,
				lsp_client_name = colors.magenta,
				use = true,
			},
			separators = {
				component = " ",
				progress = " | ",
				message = { pre = "(", post = ")" },
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
			symbols = { error = "󰅙 ", warn = " ", info = " ", hint = "󰛨 " },
			diagnostics_color = {
				color_error = { fg = colors.red },
				color_warn = { fg = colors.yellow },
				color_info = { fg = colors.cyan },
				color_hint = { fg = colors.blue },
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
			color = { fg = colors.green, bg = colors.bg, gui = "bold" },
		})

		ins_right({ "fancy_macro" })

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
					return { fg = colors.aqua, gui = "bold", bg = colors.bg }
				elseif position >= 95 then
					return { fg = colors.red, gui = "bold", bg = colors.bg }
				else
					return { fg = colors.purple, bg = colors.bg, gui = "bold" }
				end
			end,
		})

		ins_right({
			"fancy_cwd",
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { bg = mode_color[vim.fn.mode()], fg = colors.bg, gui = "bold" }
			end,
			-- padding = { right = 1, left = 1 },
			-- separator = { left = "", right = "" },
		})
		-- Add components to right sections
		-- ins_right {
		--   'o:encoding', -- option component same as &encoding in viml
		--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
		--   cond = conditions.hide_in_width,
		--   color = { fg = colors.green, gui = 'bold' },
		-- }

		-- ins_right {
		--   'fileformat',
		--   fmt = string.upper,
		--   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
		--   color = { fg = colors.green, gui = 'bold' },
		-- }

		-- ins_right({
		--   function()
		--     return "▊"
		--   end,
		--   color = { fg = colors.blue },
		--   padding = { left = 1 },
		-- })

		-- Now don't forget to initialize lualine
		lualine.setup(config)
	end,
}
