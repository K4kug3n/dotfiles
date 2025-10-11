local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  s({ trig = 'ff' }, fmta('\\frac{<>}{<>}', { i(1), i(2) })),

  s(
    { trig = 'eq' },
    fmt(
      [[
      \begin{equation}
          <>
      \end{equation}
      ]],
      { i(1) },
      { delimiters = '<>' }
    )
  ),

  s(
    { trig = 'env', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),

  s({ trig = ';a', snippetType = 'autosnippet' }, {
    t '\\alpha',
  }),
  s({ trig = ';b', snippetType = 'autosnippet' }, {
    t '\\beta',
  }),
  s({ trig = ';g', snippetType = 'autosnippet' }, {
    t '\\gamma',
  }),
  s({ trig = ';p', snippetType = 'autosnippet' }, {
    t '\\phi',
  }),
}
