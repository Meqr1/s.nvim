local M = {}

M.openURL = function(...)
  local args = { ... }
  local provider = args[1] or 'google'
  local url = table.concat(args, ' ', 2)

  local Shell = require('s.utils').checkShell()
  local FormatSTR = require('s.utils').formatSTR
  local powershell = require('s.utils').powershell
  local bash = require('s.utils').bash

  if Shell == 'powershell' then
    local Provider = provider
    if Provider == nil then
      Provider = 'google'
    end

    local URL = FormatSTR(url,Provider)

    powershell(URL)
    return
  end

  if Shell == 'bash' then
    local Provider = provider
    if Provider == nil then
      Provider = 'google'
    end

    local URL = FormatSTR(url,Provider)

    bash(URL)
    return
  end
end


vim.cmd([[command! -nargs=+ S lua require('s').openURL(<f-args>)]])

return M
