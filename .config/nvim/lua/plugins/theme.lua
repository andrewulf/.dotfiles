return {
    "tiagovla/tokyodark.nvim",
    name = 'tokyodark',
    priority = 1000,
    config = function()
        require("tokyodark").setup({
            transparent_background = true, -- set background to transparent
            gamma = 1.00,                  -- adjust the brightness of the theme
            terminal_colors = true,        -- enable terminal colors
        })
        vim.cmd("colorscheme tokyodark")

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
