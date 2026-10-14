-- Allow compact GitHub sources in plugin specs, e.g. "gh:folke/noice.nvim".
-- `vim.pack` receives a normal HTTPS URL, so Git needs no global alias.
-- NOTE: must be installed before anything calls vim.pack.add (core/ does).
local pack_add = vim.pack.add

vim.pack.add = function(specs, opts)
	for index, spec in ipairs(specs) do
		if type(spec) == "string" then
			specs[index] = spec:gsub("^gh:", "https://github.com/")
		elseif type(spec) == "table" and type(spec.src) == "string" then
			spec.src = spec.src:gsub("^gh:", "https://github.com/")
		end
	end

	return pack_add(specs, opts)
end

require("core")

local auto_init = require("auto_plugin_init")
auto_init.init()
