local buffer_number = -1

local function log(_, data)
	if data then
		-- Make it temporarily writable so we don't have warnings.
		vim.api.nvim_buf_set_option(buffer_number, "readonly", false)

		-- Append the data.
		vim.api.nvim_buf_set_lines(buffer_number, -1, -1, true, data)

		-- Make readonly again.
		vim.api.nvim_buf_set_option(buffer_number, "readonly", true)

		-- Mark as not modified, otherwise you'll get an error when
		-- attempting to exit vim.
		vim.api.nvim_buf_set_option(buffer_number, "modified", false)

		-- Get the window the buffer is in and set the cursor position to the bottom.
		local buffer_window = vim.api.nvim_call_function("bufwinid", { buffer_number })
		local buffer_line_count = vim.api.nvim_buf_line_count(buffer_number)
		vim.api.nvim_win_set_cursor(buffer_window, { buffer_line_count, 0 })
	end
end

local function get_visual_selection()
	-- Yank the selection into a temporary register 'z'
	vim.cmd('normal! "zy')
	local selection = vim.fn.getreg('z') -- Retrieve the register contents

	-- Check if the selection is valid
	if not selection or selection == "" then
		vim.notify("No valid visual selection detected!", vim.log.levels.ERROR)
		return nil
	end

	-- Split the selection into lines if it's multiline
	return vim.split(selection, "\n", { trimempty = true })
end

local function open_buffer()
	-- Get a boolean that tells us if the buffer number is visible anymore.
	--
	-- :help bufwinnr
	local buffer_visible = vim.api.nvim_call_function("bufwinnr", { buffer_number }) ~= -1

	if buffer_number == -1 or not buffer_visible then
		-- Create a new buffer with the name "TRILIUM_NOTE".
		-- Same name will reuse the current buffer.
		vim.api.nvim_command("botright vsplit TRILIUM_NOTE")

		-- Collect the buffer's number.
		buffer_number = vim.api.nvim_get_current_buf()

		-- Mark the buffer as readonly.
		-- vim.opt_local.readonly = true

		local selection = get_visual_selection()
		if not selection or #selection == 0 then
			return
		end

		-- Append the data.
		print(vim.inspect(get_visual_selection()))
		vim.api.nvim_buf_set_lines(buffer_number, 0, -1, false, get_visual_selection())
	end
end


vim.api.nvim_create_user_command("UploadNote", function()
	local buffer_visible = vim.api.nvim_call_function("bufwinnr", { buffer_number }) ~= -1
	if buffer_number ~= -1 and not buffer_visible then
		vim.api.nvim_buf_delete(buffer_number, { force = true })
		buffer_number = -1
	end

	if buffer_number == -1 then
		open_buffer()
	else
		local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")

		local handle = io.popen(string.format(
			"trilium-note '%s'",
			content:gsub("'", "\\'")
		))

		local result = handle:read("*a")
		handle:close()

		if buffer_number ~= -1 then
			vim.api.nvim_buf_delete(buffer_number, { force = true })
			buffer_number = -1
		end
	end
end, { range = true })
