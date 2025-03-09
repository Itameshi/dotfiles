local opt = vim.opt

-- visual
opt.number = true
opt.cursorcolumn = true
opt.cursorline = true
opt.termguicolors = true
opt.showmatch = true
--opt.colorscheme = vim

-- Tab
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- extra
opt.autoread = true
opt.hidden = true
opt.showcmd = true
opt.virtualedit = "onemore"

-- 全角スペースの可視化
vim.api.nvim_set_hl(0, "ZenkakuSpace", { fg = "red", bg = "red" })
vim.fn.matchadd("ZenkakuSpace", "　")
