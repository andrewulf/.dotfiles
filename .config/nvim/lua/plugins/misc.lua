-- Various small plugins that dont have a huge impact but improves my personal DX.
return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
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
      require("ibl").setup({})
    end,
  }
}
