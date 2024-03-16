return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'},
    config = function()
      local config = require('lualine').get_config()
      config.options.theme = 'horizon'
      require('lualine').setup(config)
    end
}
