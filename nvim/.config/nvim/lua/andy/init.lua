vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd("syntax on")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
})
vim.cmd.colorscheme "catppuccin"
local cp = require("catppuccin.palettes").get_palette("mocha")
vim.api.nvim_set_hl(0, "LineNr", { fg = cp.teal })
vim.api.nvim_set_hl(0, "Visual", { bg = cp.rosewater })
