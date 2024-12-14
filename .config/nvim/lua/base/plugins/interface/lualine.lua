local git_cache = nil
local last_cwd = nil

local function is_in_git_repo()
  local cwd = vim.loop.cwd()
  if cwd ~= last_cwd then
    last_cwd = cwd
    local result = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
    git_cache = vim.v.shell_error == 0
  end
  return git_cache
end

local function component()
  if is_in_git_repo() then
    return { 'branch', 'diff' }
  else
    return { 'filesize', 'encoding' }
  end
end

local common_fg = "#AFA099"
local inactive_bg = "#272321"
local inactive_fg = "#CAD0D4"

local zenbones = {
  normal = {
    a = { bg = "#59514D", fg = common_fg, gui = "bold" },
    b = { bg = "#433C39", fg = common_fg },
    c = { bg = inactive_bg, fg = "#B4BDC3" },
  },

  insert = {
    a = { bg = "#324757", fg = common_fg, gui = "bold" },
  },

  command = {
    a = { bg = "#65435E", fg = common_fg, gui = "bold" },
  },

  visual = {
    a = { bg = "#3D4042", fg = common_fg, gui = "bold" },
  },

  replace = {
    a = { bg = "#3E2225", fg = common_fg, gui = "bold" },
  },

  inactive = {
    a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
    b = { bg = inactive_bg, fg = inactive_fg },
    c = { bg = inactive_bg, fg = inactive_fg },
  },
}

require('lualine').setup {
  options = {
    globalstatus = true,
    theme = zenbones,
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          local mode_map = {
            ['NORMAL'] = ' NORMAL',
            ['INSERT'] = ' INSERT',
            ['VISUAL'] = '󰒅 VISUAL',
            ['V-LINE'] = '󰕷 V-LINE',
            ['V-BLOCK'] = '󰝤 V-BLOCK',
            ['REPLACE'] = '󰑌 REPLACE',
            ['COMMAND'] = ' COMMAND',
            ['TERMINAL'] = ' TERMINAL',
          }
          return mode_map[str] or str
        end,
      }
    },
    lualine_b = component(),
    lualine_c = {},
    lualine_x = {},
    lualine_y = { {
      'diagnostics',
      sources = { 'nvim_lsp' },
      sections = { 'error', 'warn', 'info', 'hint' },
      diagnostics_color = {
        error = { fg = '#dc322f' },
        warn = { fg = '#b58900' },
        info = { fg = '#268bd2' },
        hint = { fg = '#2aa198' },
      },
    },
      {
        'filename',
        path = 0,
        symbols = {
          modified = '●',
          readonly = '●',
          unnamed = '[No Name]',
        },
        fmt = function(str)
          local icon = require('nvim-web-devicons').get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e'),
            { default = true })
          return icon .. ' ' .. str
        end,
      }
    },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {},
}

vim.cmd([[autocmd! CursorHold * lua require('lualine').refresh()]])

vim.cmd([[
  augroup cmdheight
    autocmd!
    autocmd CmdlineEnter * setlocal cmdheight=0
    autocmd CmdlineLeave * setlocal cmdheight=0
  augroup END
]])
