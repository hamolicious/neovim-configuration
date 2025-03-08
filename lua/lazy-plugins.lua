-- ██╗      █████╗ ███████╗██╗   ██╗         Z
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝      Z
-- ██║     ███████║  ███╔╝  ╚████╔╝    z
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝   z
-- ███████╗██║  ██║███████╗   ██║
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝

local pluginspath = vim.fn.stdpath("data") .. "/lazy"
local lazypath = pluginspath .. "/lazy.nvim"
-- install lazy
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  print("lazy just installed, please restart neovim")
  return
end


local function getPlugins()
  return coroutine.create(function()
    coroutine.yield(require('plugins.legendary'))           -- Keybinds, auto-cmds and arbitrary funcs
    coroutine.yield(require('plugins.floaterm'))            -- Floating terminals
    coroutine.yield(require('plugins.lsp'))                 -- Intelisense
    coroutine.yield(require('plugins.formatting'))          -- Formatting
    coroutine.yield(require('plugins.linting'))             -- Formatting
    coroutine.yield(require('plugins.nvim-dap'))            -- Debugging
    coroutine.yield(require('plugins.mason-dap'))           -- Debugging
    coroutine.yield(require('plugins.dap-ui'))              -- Debugging UI
    coroutine.yield(require('plugins.dresser'))             -- Makes legendary bareable to look at
    coroutine.yield(require('plugins.theme'))               -- Theme
    coroutine.yield(require('plugins.lualine'))             -- Lualine
    coroutine.yield(require('plugins.telescope'))           -- Telescope
    coroutine.yield(require('plugins.auto-complete'))       -- nvim-cmp
    coroutine.yield(require('plugins.git'))                 -- Git blame, hunk objects
    coroutine.yield(require('plugins.tree-sitter'))         -- tree-sitter
    coroutine.yield(require('plugins.highlight'))           -- highligh occurances
    coroutine.yield(require('plugins.neoscroll'))           -- smooth scrolling
    coroutine.yield(require('plugins.visual-whitespace'))   -- visually display whitespaces
    coroutine.yield(require('plugins.comment'))             -- comment commands
    coroutine.yield(require('plugins.oil'))                 -- File namagement as buffer
    coroutine.yield(require('plugins.fold-line'))           -- Show folds
    coroutine.yield(require('plugins.auto-scale-windows'))  -- Scale windows automatically
    coroutine.yield(require('plugins.http-client'))         -- HTTP Client
    coroutine.yield(require('plugins.minesweeper'))         -- minesweeper, why not
    coroutine.yield(require('plugins.modicator'))           -- Dynamically & automatically scale windows
    coroutine.yield(require('plugins.snippets'))            -- Dynamic snippets
    coroutine.yield(require('plugins.gitlinker'))           -- Quickly copy permalinks to git
    coroutine.yield(require('plugins.coloriser'))           -- Preview hex codes
    coroutine.yield(require('plugins.autoclose'))           -- automatically close brackets
    coroutine.yield(require('plugins.markdown-preview'))    -- Live markdown preview
    coroutine.yield(require('plugins.increment-decrement')) -- Toggle bools, weekdays, on off and yes, no
    coroutine.yield(require('plugins.minimap'))             -- VSCode style minimap
    coroutine.yield(require('plugins.karen-yank'))          -- Nicer register experience when deleting, cutting and yanking
    coroutine.yield(require('plugins.macrothis'))           -- Macro management like a boss
    coroutine.yield(require('plugins.transparent'))         -- Remove all BG color


    if (IsCurrentPlatformOneOf(Platform.WORK_MAC)) then
      coroutine.yield(require('plugins.chatgpt'))         -- chatgpt integration
      coroutine.yield(require('plugins.llmautocomplete')) -- use LLMs to auto complete code
    end
  end)
end

local function unpackPlugins()
  local plugins = {}
  local coroutineFunc = getPlugins()

  repeat
    local status, result = coroutine.resume(coroutineFunc)
    if status and result then
      table.insert(plugins, result)
    end
  until not status

  return plugins
end

-- install plugins
lazy.setup({
  spec = unpackPlugins(),
  ---@diagnostic disable-next-line
  dev = {
    path = "~/.local/src",
  },
  lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
  },
})
