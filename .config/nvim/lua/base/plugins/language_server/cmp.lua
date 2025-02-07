---@diagnostic disable: redundant-parameter
local cmp = require('cmp')
require('lspkind').init({})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup({
  window = {
    completion = {
      border = 'rounded',
      winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
      scrollbar = false,
    },
    documentation = {
      border = 'rounded',
      winhighlight = "NormalFloat:None,FloatBorder:None",
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        cmp.scroll_docs(4)
      else
        fallback()
      end
    end, { 'i', 'c' }),
    ['<Up>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
        cmp.scroll_docs(-4)
      else
        fallback()
      end
    end, { 'i', 'c' }),
  },
  sources = {
    { name = 'nvim_lsp', priority = 900 },
    { name = 'luasnip',  priority = 800 },
    { name = 'buffer',   priority = 500 },
    { name = 'path',     priority = 300 },
    { name = 'spell',    priority = 600 },
  },
  formatting = {
    format = function(entry, vim_item)
      local icon = require('lspkind').symbolic(vim_item.kind, { mode = "symbol" })
      vim_item.abbr = icon .. " " .. vim_item.abbr
      vim_item.kind = ""

      vim_item.menu = ({
        nvim_lsp = "",
        copilot  = "",
        luasnip  = "",
        buffer   = "",
        path     = "",
        spell    = "",
      })[entry.source.name]

      return vim_item
    end,
  },
  experimental = {
    ghost_text = true,
  },
})

---@diagnostic disable-next-line: undefined-field
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'cmdline' },
  },
})

---@diagnostic disable-next-line: undefined-field
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

local ls = require('luasnip')
ls.add_snippets('html', {
  ls.parser.parse_snippet("!",
    "<!DOCTYPE html>\n<html>\n<head>\n    <title>${1:Title}</title>\n</head>\n<body>\n    ${0}\n</body>\n</html>"),
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md" },
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = { 'en_us' }
  end
})

local doxygen_snippet = ls.parser.parse_snippet("docfn", "/**\n * $1\n *\n * $0\n */")

ls.snippets = {
  c = { doxygen_snippet },
  cpp = { doxygen_snippet },
  javascript = { doxygen_snippet },
}
