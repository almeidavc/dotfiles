require('tabout').setup({
  tabkey = '<Tab>',
  backwards_tabkey = '<S-Tab>',
  -- shift content if tab out is not possible
  act_as_tab = true,
  act_as_shift_tab = false,
  enable_backwards = true,
  completion = true,
  tabouts = {
    {open = "'", close = "'"},
    {open = '"', close = '"'},
    {open = '`', close = '`'},
    {open = '(', close = ')'},
    {open = '[', close = ']'},
    {open = '{', close = '}'}
  },
  -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
  ignore_beginning = true,
  exclude = {}
})
