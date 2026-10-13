local function map(modes, lhs, rhs, opts)
	-- default options (you can tweak as needed)
	local options = { silent = true, noremap = true }

	-- merge opts into default options
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	-- call keymap.set
	vim.keymap.set(modes, lhs, rhs, options)
end

-- optionally make it global/globalish
_G.map = map
