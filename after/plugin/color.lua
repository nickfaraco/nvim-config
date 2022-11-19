local colorscheme = 'catppuccin'

local present, colscheme = pcall(require, colorscheme)
if not present then 
    vim.notify('Error! Colorscheme ' .. colorscheme .. ' not found! ' ..
        'Try running :PackerInstall or :PackerSync.')
    return 
end

-- Custom setups for the installed themes 
if colorscheme == 'catppuccin' then
    colscheme.setup {
        flavor = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        color_overrides = {
            latte = {base = "#E1EEF5"},
            mocha = {base = "#0C0C0C"}
        },
        integrations = {
            treesitter = true,
            nvimtree = true,
            dap = {enabled = true, enable_ui = true},
            lsp_saga = true,
            neogit = true,
        },
        highlight_overrides = {
            mocha = function(mocha)
                return {
                    NvimTreeNormal = { bg = mocha.none },
                }
            end,
        },
    }
elseif colorscheme == 'tokyonight' then
    colscheme.setup {}
else
    vim.notify('Specified colorscheme not in list.')
end

-- Set the colorscheme 
vim.opt.background = "dark"
vim.cmd("colorscheme " .. colorscheme)
