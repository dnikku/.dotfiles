vim.cmd("colorscheme shine")
-- show max width column
vim.opt.colorcolumn = "120"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ffefef" })

vim.api.nvim_set_hl(0, "CursorLine", { bg = "#f5f5f5" })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ffa5a5" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ffb067" })
