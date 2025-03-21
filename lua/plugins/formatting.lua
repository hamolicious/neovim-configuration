require('platform.current-platform')

-- Install more with :Mason
return {
  'stevearc/conform.nvim',
  config = function()
    local setupTable = {
      formatters_by_ft = {
        python = { 'isort', 'black' },
        c = { 'ast_grep', 'clang-format' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },
      },
    }

    if (not IsCurrentPlatformOneOf(Platform.WORK_MAC)) then
      setupTable['format_on_save'] = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end

    require('conform').setup(setupTable)
  end
}
