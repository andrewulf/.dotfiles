return {
  "sainnhe/sonokai",
  dependencies = {},
  priority = 1000,
  lazy = false,
  config = function()
    vim.cmd([[ let g:sonokai_style = 'andromeda' ]])
    vim.cmd([[ let g:sonokai_enable_italic = 1 ]])
    vim.cmd([[ let g:sonokai_transparent_background = 1 ]])

    vim.cmd([[ colorscheme sonokai ]])

    vim.cmd([[ highlight TelescopeBorder guibg=none ]])
    vim.cmd([[ highlight TelescopeTitle guibg=none ]])

    vim.cmd("hi Normal guibg=none ctermbg=none")
    vim.cmd("hi NormalNC guibg=none ctermbg=none")
    vim.cmd("hi NormalFloat guibg=none ctermbg=none")
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
