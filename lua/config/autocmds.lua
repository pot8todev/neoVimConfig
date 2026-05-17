-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
--
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Define colors for use throughout

-- Setup bufferline highlights using the colors

-- Function to set the colorscheme

local function get_runner_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) then
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match("CodeRunnerOutput$") then
        return buf
      end
    end
  end

  local buf = vim.api.nvim_create_buf(false, true)
  return buf
end

local buffnbr = get_runner_buf()
_G.runner_buf = buffnbr

local build_cmd = function(target, file_type)
  local cmd
  if file_type == "lua" then
    cmd = { "lua", target }
  elseif file_type == "python" then
    cmd = { ".venv/bin/python", target }
  elseif file_type == "c" then
    return {
      "sh",
      "-c",
      string.format("gcc %s -o /tmp/nvim_run && /tmp/nvim_run", vim.fn.shellescape(target)),
    }
  end
  if not cmd then
    return
  end
  return cmd
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("testing", { clear = true }),
  pattern = { "*.lua", "*.py", "*.c" },

  callback = function(args)
    local file_name = args.file
    local file_type = vim.bo[args.buf].filetype
    local target = _G.fileGroup or file_name

    local message = string.format("%s output:", file_name)
    vim.api.nvim_buf_set_lines(buffnbr, 0, -1, false, { message })
    local job_cmd = build_cmd(target, file_type)

    if not job_cmd then
      return
    end
    -- print(buffnbr)
    vim.fn.jobstart(job_cmd, {
      stdout_buffered = true,

      on_stdout = function(_, data)
        if not data then
          return
        end
        vim.api.nvim_buf_set_lines(buffnbr, -1, -1, false, data)
      end,
      on_stderr = function(_, data)
        if not data then
          return
        end
        vim.api.nvim_buf_set_lines(buffnbr, -1, -1, false, data)
        -- make errors red
        local ns = vim.api.nvim_create_namespace("coderunner_errors")

        for i, _ in ipairs(data) do
          local line = vim.api.nvim_buf_line_count(buffnbr) - #data + i - 1

          vim.api.nvim_buf_set_extmark(buffnbr, ns, line, 0, {
            end_line = line + 1,
            hl_group = "ErrorMsg",
          })
        end
      end,
    })
  end,
})
