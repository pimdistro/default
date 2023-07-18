local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  "______  _____ ___  ___",
  "| ___ \\|_   _||  \\/  |",
  "| |_/ /  | |  | .  . |",
  "|  __/   | |  | |\\/| |",
  "| |     _| |_ | |  | |",
  "\\_|     \\___/ \\_|  |_/",
}

-- Set menu
dashboard.section.footer.val = 'pim (short for "pretty vim"), derived from the Dutch name Pim'
dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
  dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button("q", "  > Quit Pim", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
