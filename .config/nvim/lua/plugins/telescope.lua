telesconfig = function()
    require("telescope").setup {}
end
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = telesconfig
}
