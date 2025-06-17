local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-s>", ":w<CR>", opts)

-- [[ No highlight after pressing escape ]]
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Escape Highlight", silent = true })

-- [[ Move lines using <A-j,k> ]]
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- [[ Center Screen on C-d,u ]]
-- map("n", "<C-d>", "<C-d>zz", { desc = "bring screen to middle" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "bring screen to middle" })

-- [[ Useful everyday keybinds ]]
map("x", "p", 'p:let @"=@0<CR>', { silent = true })
map("n", "<S-CR>", "O<Esc>", { desc = "Add new line above" })
map("n", "<CR>", "o<Esc>", { desc = "Add new line below" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "file save" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole", noremap = true })

-- [[ Indentation Stuff ]]
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- [[ Clipboard Stuff ]]
-- map("x", "<leader>p", [["_dP]])
-- map("v", "p", '"_dp', opts)
-- map({"n", "v"}, "<leader>d", [["_d]])
-- map("n", "x" , "_x", opts)

-- [[ Tabs Stuff ]]
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- [[ Buffer Stuff ]]
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- [[ Quickfix Stuff ]]
map("n", "<leader>xq", function()
	local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
	if not success and err then
		vim.notify(err, vim.log.levels.WARN)
	end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- [[ Diagnostics Stuff ]]
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Terminal Mappings
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- [[ LSP stuff]]
map("n", "K", vim.lsp.buf.hover, { desc = "LSP : Hover" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP : [C]ode [A]ction" })
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "LSP : [C]ode [F]ormatting" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP : [C]ode [R]ename" })
