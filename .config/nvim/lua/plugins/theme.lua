return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
        require('nightfox').setup({
            options = {
                transparent = true,
            }
        })
        vim.cmd("colorscheme nightfox")

        vim.cmd([[ highlight TelescopeBorder guibg=none ]])
        vim.cmd([[ highlight TelescopeTitle guibg=none ]])

        vim.cmd("hi Normal guibg=none ctermbg=none")
        vim.cmd("hi LineNr guibg=none ctermbg=none")
        vim.cmd("hi Folded guibg=none ctermbg=none")
        vim.cmd("hi NonText guibg=none ctermbg=none")
        vim.cmd("hi SpecialKey guibg=none ctermbg=none")
        vim.cmd("hi VertSplit guibg=none ctermbg=none")
        vim.cmd("hi CursorLineNr guibg=none ctermbg=none")
        vim.cmd("hi StatusLine guibg=none ctermbg=none")
        vim.cmd("hi EndOfBuffer guibg=none ctermbg=none")
        vim.cmd("hi SignColumn guibg=none ctermbg=none")
    end,
}
