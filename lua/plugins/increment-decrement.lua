return {
  'nat-418/boole.nvim',
  config = function()
    require('boole').setup({
      mappings = {
        increment = '<C-a>',
        decrement = '<C-x>'
      },
      additions = {
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
        },
        {
          'left',
          'right',
        }
      },
    })
  end
}
