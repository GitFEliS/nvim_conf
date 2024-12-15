return {
  "rebelot/kanagawa.nvim",
  enabled = true,
  config = function()
    require("kanagawa").setup()
    vim.cmd("colorscheme kanagawa-wave")
  end
}
