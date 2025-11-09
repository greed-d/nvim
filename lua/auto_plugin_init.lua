-- auto_init_plugins.lua
local M = {}

-- Configuration: path to the plugins root directory (relative to your config)
-- You may want to use `vim.fn.stdpath('config')` or `vim.fn.stdpath('data')` depending.
local plugins_root = vim.fn.stdpath('config') .. '/lua' .. '/plugins'

-- Filename pattern to look for
local target_filename = 'init.lua'

-- Recursively scan a directory and collect files
local function scan_dir(dir, file_list)
  local luv = vim.loop
  local fs = luv.fs_scandir(dir)
  if not fs then
    return
  end
  while true do
    local name, typ = luv.fs_scandir_next(fs)
    if not name then break end
    local full = dir .. '/' .. name
    if typ == 'directory' then
      scan_dir(full, file_list)
    elseif typ == 'file' then
      if name:match('%.lua$') then
          table.insert(file_list, full)
      end
    end
  end
end

-- Convert full path to a Vim canonicalised path and source it
local function source_file(path)
  -- optionally, you might want to guard with pcall
  -- print or log what you're sourcing
  vim.cmd('luafile ' .. vim.fn.fnameescape(path))
end

function M.init()
  local files = {}
  scan_dir(plugins_root, files)
  for _, f in ipairs(files) do
    -- you might consider wrapping in pcall:
    local ok, err = pcall(source_file, f)
    if not ok then
      vim.notify('Error sourcing plugin init file: ' .. f .. '\n' .. err, vim.log.levels.ERROR)
    end
  end
end

return M
