require("settings.options")
require("settings.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("settings.keymaps")
  end,
})
