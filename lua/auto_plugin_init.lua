-- auto_plugin_init.lua
-- Auto-discovers config files under lua/plugins and loads each one exactly once.

local M = {}

-- Configuration: path to the plugins root directory (relative to your config)
local plugins_root = vim.fn.stdpath('config') .. '/lua' .. '/plugins'
local lua_root = vim.fn.stdpath('config') .. '/lua'

-- Recursively scan a directory and collect files
local function scan_dir(dir, file_list)
  local luv = vim.uv
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

-- Convert a file path under lua/ to a module name,
-- e.g. "<config>/lua/plugins/mini/init.lua" -> "plugins.mini"
local function to_module(path)
  local rel = path:sub(#lua_root + 2)
  rel = rel:gsub('%.lua$', '')
  rel = rel:gsub('/init$', '')
  return (rel:gsub('/', '.'))
end

function M.init()
  local files = {}
  scan_dir(plugins_root, files)
  -- Sorted paths give a deterministic load order (parents before their children)
  table.sort(files)

  for _, f in ipairs(files) do
    -- require() instead of :luafile so each file runs exactly once, even when
    -- it is also required by a sibling/parent init.lua
    local mod = to_module(f)
    local ok, err = pcall(require, mod)
    if not ok then
      vim.notify('Error loading plugin module: ' .. mod .. '\n' .. err, vim.log.levels.ERROR)
    end
  end
end

return M
