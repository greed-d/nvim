return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		enabled = false,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = true }, -- Disable italics in comments
				},
			})

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")

			local function set_highlight(group, opts)
				vim.api.nvim_set_hl(0, group, opts)
			end
			set_highlight("FloatBorder", { fg = "#45475A", bg = "NONE" })
			set_highlight("SnacksPickerTitle", { bg = "#7aa2f7", fg = "#1f2335" })
			set_highlight("SnacksPickerPreview", { bg = "#1a1b26" })
			set_highlight("SnacksPickerList", { bg = "#1a1b26" })
			set_highlight("SnacksPickerListTitle", { bg = "#9ece6a", fg = "#1f2335" })
			set_highlight("SnacksPickerInputTitle", { bg = "#f7768e", fg = "#1f2335" })
			set_highlight("SnacksPickerInputBorder", { bg = "#1a1b26", fg = "#45475a" })
			set_highlight("SnacksPickerInputSearch", { bg = "#f7768e", fg = "#1f2335" })
			set_highlight("SnacksPickerInput", { bg = "#1a1b26" })
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		opts = {},
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				theme = "lotus",
				compile = true,
			})
		end,
	},
	{
		"rose-pine/neovim",
		enabled = false,
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				palette = {
					-- Override the builtin palette per variant
					-- moon = {
					--     base = '#18191a',
					--     overlay = '#363738',
					-- },
				},

				-- NOTE: Highlight groups are extended (merged) by default. Disable this
				-- per group via `inherit = false`
				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- StatusLine = { fg = "love", bg = "love", blend = 15 },
					-- VertSplit = { fg = "muted", bg = "muted" },
					-- Visual = { fg = "base", bg = "text", inherit = false },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})

			vim.cmd("colorscheme rose-pine")
			-- vim.cmd("colorscheme rose-pine-main")
			-- vim.cmd("colorscheme rose-pine-moon")
			-- vim.cmd("colorscheme rose-pine-dawn")
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme("everforest")

			local function set_highlight(group, opts)
				vim.api.nvim_set_hl(0, group, opts)
			end

			set_highlight("FloatBorder", { bg = "#1e2326" })
			set_highlight("Normal", { bg = "#1e2326" })
			set_highlight("SnacksPickerTitle", { bg = "#7fbbb3", fg = "#272e33" })
			set_highlight("SnacksPickerPreview", { bg = "#1e2326" })
			set_highlight("SnacksPickerList", { bg = "#1e2326" })
			set_highlight("SnacksPickerListTitle", { bg = "#9ece6a", fg = "#272e33" })
			set_highlight("SnacksPickerInputTitle", { bg = "#e67e80", fg = "#272e33" })
			set_highlight("SnacksPickerInputBorder", { bg = "#1e2326", fg = "#45475a" })
			set_highlight("SnacksPickerInputSearch", { bg = "#e67e80", fg = "#272e33" })
			set_highlight("SnacksPickerInput", { bg = "#1e2326" })
			set_highlight("VirtualTextHint", { fg = "#384b55" })
			set_highlight("VirtualTextInfo", { fg = "#7fbbb3" })
			set_highlight("VirtualTextError", { fg = "#e67e80" })
			set_highlight("VirtualTextWarning", { fg = "#dbbc7f" })
			set_highlight("NormalFloat", { fg = "#272e33" })
		end,
	},
	{
		"dupeiran001/nord.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme nord]])
		end,
	},
	{
		"wtfox/jellybeans.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {}, -- Optional
		config = function()
			vim.cmd([[colorscheme jellybeans-mono]])

			local function set_highlight(group, opts)
				vim.api.nvim_set_hl(0, group, opts)
			end

			set_highlight("NormalFloat", { bg = "#151515" })
		end,
	},
	-- {
	-- 	"everviolet/nvim",
	-- 	name = "evergarden",
	-- 	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	-- 	opts = {
	-- 		theme = {
	-- 			variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
	-- 			accent = "green",
	-- 		},
	-- 		editor = {
	-- 			transparent_background = false,
	-- 			sign = { color = "none" },
	-- 			float = {
	-- 				color = "mantle",
	-- 				invert_border = false,
	-- 			},
	-- 			completion = {
	-- 				color = "surface0",
	-- 			},
	-- 		},
	-- 	},
	-- },
}
-- vim: ts=2 sts=2 sw=2 et
