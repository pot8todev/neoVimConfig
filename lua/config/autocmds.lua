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

local codeRunner = require("config.plugMapping.codeRunner")

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
vim.api.nvim_set_hl(0, "CodeRunnerFile", {
  fg = "#98BB6C",
  bold = true,
})
vim.api.nvim_set_hl(0, "ErrorMsg", {
  fg = "#9c3f42",
  bold = true,
})
local ns = vim.api.nvim_create_namespace("coderunner")

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("testing", { clear = true }),
  pattern = { "*.lua", "*.py", "*.c" },

  callback = function(args)
    local file_name = args.file -- aka vim.api.nvim_buf_get_name(args.buf), but O[1]
    local file_type = vim.bo[args.buf].filetype -- aka vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":t" but O[1]
    local target = _G.fileGroup or file_name

    if not vim.b.Autocompile then
      local message = string.format("autoCompile not active for %s", file_name)
      vim.api.nvim_buf_set_lines(buffnbr, 0, -1, false, { message })

      return
    end

    local line = string.format("%s output:", file_name)

    vim.api.nvim_buf_set_lines(buffnbr, 0, -1, false, { line })

    vim.api.nvim_buf_set_extmark(buffnbr, ns, 0, 0, {
      end_col = #file_name,
      hl_group = "CodeRunnerFile",
      hl_mode = "combine",
    })

    local job_cmd = codeRunner.build_cmd(target, file_type) --sets the correct compilation command

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

        -- make errors red
        local start = vim.api.nvim_buf_line_count(buffnbr)
        vim.api.nvim_buf_set_lines(buffnbr, -1, -1, false, data)
        for i, _ in ipairs(data) do
          local line = start + i - 1

          vim.api.nvim_buf_set_extmark(buffnbr, ns, line, 0, {
            line_hl_group = "ErrorMsg",
          })
        end
      end,
    })
  end,
})
