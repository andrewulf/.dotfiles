telesconfig = function()
  require("telescope").setup {
    pickers = {
      find_files = {
        hidden = false
      }
    }
  }
end
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = telesconfig
}
