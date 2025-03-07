-- Delete keys like d, D, c etc. will genuinely delete by default, and cut in a <karen><delete key> key-chord.
-- The result is that deletions after yanks and cuts won't mess with p - so p will only use the last cut text,
--  the contents of your system clipboard, or a register specified before pasting.
-- Your yanks and cuts are also extended to use VIMs number registers while keeping them free of duplicates.
--
-- By default, karen is mapped to y.
--
-- All predefined mappings stay true to VIMs defaults:
--
-- a motion like `ciw` will delete a word and start insert, while `yciw` will cut a word and start insert.
-- `dd` deletes a line, `ydd` cuts a line etc.
-- in visual mode `yd` pressed in timeoutlen will cut. While just `y` will yank as usual after `timeoutlen`
--  (or immediately when followed by something like a movement with `j`. So no impairments with fast typing)

return { "tenxsoydev/karen-yank.nvim", config = true }
