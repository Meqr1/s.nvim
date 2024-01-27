# s.nvim
A search Opener for nvim inspired from `s`

## Install:

> for linux you need to have python installed

#### packer:
```lua
    use {
        'Meqr1/s.nvim',
        config = function ()
            require('s')
        end
    }
```

#### lazy: 
```
    {
        'Meqr1/s.nvim',
        config = function()
            require('s')
        end
    }
```

# Features
- [x] simple search 
- [x] open a URL
- [ ] gui
- [ ] a global provider

## how to use:

#### structure:
```
:S <provider> <query>
```

#### example:
```
:S duckduckgo how are you
```

## providers:

1. google
2. duckduckgo
3. bing
4. yahoo
5. ask
6. baidu
7. yandex
8. qwant
9. gigablast
10. dogpile
11. startpage
12. exalead
13. stackoverflow
