print("hello from andy")
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd("syntax on")
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
})
vim.cmd.colorscheme "catppuccin"

