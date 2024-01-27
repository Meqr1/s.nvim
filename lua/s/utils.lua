local M = {}

M.checkShell = function()
  if vim.fn.has('win16') or vim.fn.has('win64') or vim.fn.has('win32') then
    return 'powershell'
  elseif vim.fn.has('mac') or vim.fn.has('macunix') then
    return 'bashMAC'
  else
    return 'bashLINUX'
  end
end

M.formatSTR = function(string, provider)
  local inputSting = string
  inputSting = inputSting:gsub(" ", "+")

  local baseUrls = {
    google = 'https://www.google.com/search?q=',
    duckduckgo = 'https://duckduckgo.com/?q=',
    bing = 'https://www.bing.com/search?q=',
    yahoo = 'https://search.yahoo.com/search?p=',
    ask = 'https://www.ask.com/web?q=',
    baidu = 'https://www.baidu.com/s?wd=',
    yandex = 'https://www.yandex.com/search/?text=',
    qwant = 'https://www.qwant.com/?q=',
    gigablast = 'https://www.gigablast.com/search?q=',
    dogpile = 'https://www.dogpile.com/search/web?q=',
    startpage = 'https://www.startpage.com/do/dsearch?query=',
    exalead = 'https://www.exalead.com/search/web/results/?q=',
    stackoverflow = 'https://stackoverflow.com/serach?q='
  }

  local baseUrl = baseUrls[provider]
  if not baseUrl then
    print('Invalid serach provider')
    return
  end

  local formatSTR = baseUrl .. inputSting
  print(formatSTR)
  return formatSTR
end

M.powershell = function(url)
  local fullCMD = "Start-Process " .. url
  fullCMD = string.gsub(fullCMD, "'", "''")
  fullCMD = "powershell -Command " .. vim.fn.shellescape(fullCMD)
  vim.fn.system(fullCMD)
end

M.bash = function(url)
  local fullCMD = 'python -m webbrowser ' .. vim.fn.shellescape(url)
  vim.fn.system(fullCMD)
end

M.mac = function(url)
  local fullCMD = 'open ' .. vim.fn.shellescape(url)
  vim.fn.system(fullCMD)
end

return M
