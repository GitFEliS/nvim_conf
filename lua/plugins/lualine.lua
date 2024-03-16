return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'archibate/lualine-time'},
    config = function()
      local config = require('lualine').get_config()
      config.options.theme = 'horizon'
      config.sections.lualine_y = {'ctime', 'progress'}
      require('lualine').setup(config)
    end
}
