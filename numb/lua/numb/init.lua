local M = {}

local ns_id = vim.api.nvim_create_namespace('numb_preview')
local timer = nil
local last_line = nil
local hl_group = 'Visual'
local duration = 300 -- milliseconds

local function clear_highlight(bufnr)
  if last_line then
    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, last_line-1, last_line)
    last_line = nil
  end
end

local function highlight_line(bufnr, line)
  clear_highlight(bufnr)
  vim.api.nvim_buf_add_highlight(bufnr, ns_id, hl_group, line-1, 0, -1)
  last_line = line
  if timer then
    timer:stop()
    timer:close()
  end
  timer = vim.loop.new_timer()
  timer:start(duration, 0, vim.schedule_wrap(function()
    clear_highlight(bufnr)
    timer:close()
    timer = nil
  end))
end

function M.setup(opts)
  opts = opts or {}
  hl_group = opts.hl_group or hl_group
  duration = opts.duration or duration

  vim.api.nvim_create_autocmd('CmdlineLeave', {
    pattern = ':',
    callback = function()
      local cmd = vim.fn.getcmdline()
      local num = tonumber(cmd)
      if num and num > 0 and num <= vim.api.nvim_buf_line_count(0) then
        highlight_line(0, num)
      end
    end,
  })
end

return M 