local M = {}

M.search = function(...)
  local args = { ... }
  local provider = args[1] or 'google'
  local url = table.concat(args, ' ', 2)

  local Shell = require('s.utils').checkShell()
  local FormatSTR = require('s.utils').formatSTR
  local powershell = require('s.utils').powershell
  local bash = require('s.utils').bash
  local Mac = require('s.utils').mac

  if Shell == 'powershell' then
    local Provider = provider
    if Provider == nil then
      Provider = 'google'
    end

    local URL = FormatSTR(url,Provider)

    powershell(URL)
    return
  end

  if Shell == 'bashLINUX' then
    local Provider = provider
    if Provider == nil then
      Provider = 'google'
    end

    local URL = FormatSTR(url,Provider)

    bash(URL)
    return
  end

  if Shell == 'bashMAC' then
    local Provider = provider
    if Provider == nil then
      Provider = 'google'
    end

    local URL = FormatSTR(url, Provider)

    Mac(URL)
    return
  end
end

M.openURL = function(...)
  local args = { ... }
  local url = table.concat(args, ' ' , 1)

  local powershell = require('s.utils').powershell
  local bash = require('s.utils').bash
  local mac = require('s.utils').mac
  local Shell = require('s.utils').checkShell()

  if Shell == 'powershell' then
    powershell(url)
    return
  end

  if Shell == 'bashLINUX' then
    bash(url)
    return
  end

  if Shell == 'bashMAC' then
    mac(url)
    return
  end
end

vim.cmd([[command! -nargs=+ S lua require('s').search(<f-args>)]])
vim.cmd([[command! -nargs=+ URL lua require('s').openURL(<f-args>)]])

return M
