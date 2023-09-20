-- Various small plugins that dont have a huge impact but improves my personal DX.
return {
    "tpope/vim-surround",
    { "folke/neodev.nvim", config = function() require('neodev').setup() end },
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_end_of_line = true,
                show_current_context = true,
                show_current_context_start = true,
            })
        end,
    }
}
