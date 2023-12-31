local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrap
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true

-- color
opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- selection
opt.iskeyword:append("-")

-- full width status bar
opt.laststatus = 3

-- faster hover
opt.updatetime = 300
