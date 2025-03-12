return {
  'nat-418/boole.nvim',
  config = function()
    local cycles = {
      {
        'OPTIONS',
        'GET',
        'HEAD',
        'POST',
        'PUT',
        'DELETE',
        'TRACE',
        'CONNECT',
      },

      {
        'left',
        'right',
      },

      {
        'enabled',
        'disabled',
      },

      {
        'enable',
        'disable',
      },
    }

    if (IsCurrentPlatformOneOf(Platform.WORK_MAC)) then
      table.insert(
        cycles,
        {
          'car',
          'van',
          'bike',
          'home',
          'travel',
          'loans',
          'creditcards',
          'pet',
          'life',
        }
      )
    end

    require('boole').setup({
      mappings = {
        increment = '<C-a>',
        decrement = '<C-x>'
      },
      additions = cycles,
    })
  end
}
