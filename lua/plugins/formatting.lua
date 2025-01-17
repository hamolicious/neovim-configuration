-- Install more with :Mason
return {
  'stevearc/conform.nvim',
  config = function()
    local setupTable = {
      formatters_by_ft = {
        python = { 'isort', 'black' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },
      },
    }

    local fos = require('platform.autoformat-onsave');
    if (fos) then
      setupTable['format_on_save']
      = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end

    require('conform').setup(setupTable)
  end
}
