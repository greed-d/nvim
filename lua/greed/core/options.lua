-- vim.cmd("let g:netrw_banner = 0")

local o = vim.opt
vim.g.netrw_banner = 0
--
-- [[ Clipboard ]]
vim.schedule(function()
	o.clipboard = "unnamedplus"
end)

-- [[  Make cursor more blocky  ]]
o.guicursor = ""

-- [[ Line number stuff ]]
o.nu = true
o.rnu = true

-- [[  Indenting  ]]
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

-- [[ Swap and Backup ]]
o.swapfile = false
o.backup = false
o.undofile = true

-- [[ Case sensitivity ]]
o.incsearch = true
o.inccommand = "split"
o.ignorecase = true
o.smartcase = true

o.termguicolors = true
o.background = "dark"
o.scrolloff = 10
o.signcolumn = "yes"
o.breakindent = true

-- [[ Backspace ]]
o.backspace = { "start", "eol", "indent" }

-- [[ Split Settings ]]
o.splitright = true
o.splitbelow = true
--
-- [[ Misc Stuff ]]
o.updatetime = 250
o.timeoutlen = 300
o.cursorline = true
o.confirm = true
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
o.showmode = false
o.laststatus = 3

-- o.colorcolumn = "80"

o.whichwrap:append("<>[]hl")

-- [[ Mouse Support ]]
o.mouse = "a"
