vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd("set scrolloff=14")
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
-- vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
-- 		callback = function(event)
-- 				vim.lsp.start {
-- 						name = "hyprlang",
-- 						cmd = {"hyprls"},
-- 						root_dir = vim.fn.getcwd(),
-- 				}
-- 		end
-- })
