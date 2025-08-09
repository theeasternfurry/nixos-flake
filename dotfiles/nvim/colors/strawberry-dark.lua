-- Set color variables
local colors = {
    g0 = '#2b1d24',
    g1 = '#3b2c33',
    g2 = '#75616b',
    g3 = '#8a7680',
    g4 = '#9e8b95',
    g5 = '#b5a3ac',
    g6 = '#f0dde6',
    g7 = '#fff0f7',
    g8 = '#bf5858',
    g9 = '#b56f45',
    gA = '#ab8e38',
    gB = '#508a50',
    gC = '#458a8a',
    gD = '#557b9e',
    gE = '#8b6a9e',
    gF = '#ab6a7a',
    t0 = '00',
    t1 = '01',
    t2 = '02',
    t3 = '03',
    t4 = '04',
    t5 = '05',
    t6 = '06',
    t7 = '07',
    t8 = '08',
    t9 = '09',
    tA = '0A',
    tB = '0B',
    tC = '0C',
    tD = '0D',
    tE = '0E',
    tF = '0F',
}

-- Set Neovim terminal colors
if vim.fn.has('nvim') == 1 then
    for k, v in pairs(colors) do
        vim.g['terminal_color_' .. k] = v
    end
end

-- Define highlighting function
local function highlight(group, fg, bg, ctermfg, ctermbg, gui, guisp)
    local cmd = 'highlight ' .. group
    if fg ~= '' then cmd = cmd .. ' guifg=' .. fg end
    if bg ~= '' then cmd = cmd .. ' guibg=' .. bg end
    if ctermfg ~= '' then cmd = cmd .. ' ctermfg=' .. ctermfg end
    if ctermbg ~= '' then cmd = cmd .. ' ctermbg=' .. ctermbg end
    if gui ~= '' then cmd = cmd .. ' gui=' .. gui end
    if guisp ~= '' then cmd = cmd .. ' guisp=' .. guisp end
    vim.cmd(cmd)
end

-- Set basic highlighting
highlight('Cursor', colors.g0, colors.gF, colors.t0, colors.tF, 'none', '')
highlight('StatusLine', colors.g0, colors.gF, colors.t0, colors.tF, 'none', '')
highlight('StatusLineTerm', colors.g0, colors.gF, colors.t0, colors.tF, 'none', '')
highlight('TabLineSel', colors.g0, colors.gF, colors.t0, colors.tF, 'none', '')
highlight('TermCursor', colors.g0, colors.gF, colors.t0, colors.tF, 'none', '')

-- line numbers
highlight('CursorLineNr', colors.g0, colors.g3, colors.t0, colors.t3, 'none', '')
highlight('LineNr', colors.g4, colors.g1, colors.t4, colors.t1, 'none', '')

-- basic text
highlight('Bold', '', '', '', '', 'bold', '')
highlight('Directory', colors.g5, '', colors.t5, '', 'bold', '')
highlight('Italic', '', '', '', '', 'italic', '')
highlight('Normal', colors.g5, colors.g0, colors.t5, colors.t0, 'none', '')
highlight('Underlined', colors.g5, '', colors.t5, '', 'underline', '')

-- commented-out text
highlight('Comment', colors.g3, '', colors.t3, '', 'none', '')
highlight('Conceal', colors.g3, '', colors.t3, '', 'none', '')
highlight('EndOfBuffer', colors.g3, '', colors.t3, '', 'none', '')
highlight('Ignore', colors.g3, '', colors.t3, '', 'none', '')
highlight('NonText', colors.g3, '', colors.t3, '', 'none', '')

-- highlighted background
highlight('ColorColumn', '', colors.g1, '', colors.t1, 'none', '')
highlight('CursorColumn', '', colors.g1, '', colors.t1, 'none', '')
highlight('CursorLine', '', colors.g1, '', colors.t1, 'none', '')
highlight('QuickFixLine', '', colors.g1, '', colors.t1, 'none', '')
highlight('StatusLineNC', colors.g5, colors.g1, colors.t5, colors.t1, 'none', '')
highlight('StatusLineTermNC', colors.g5, colors.g1, colors.t5, colors.t1, 'none', '')
highlight('TabLineFill', '', colors.g1, '', colors.t1, 'none', '')
highlight('TermCursorNC', '', colors.g1, '', colors.t1, 'none', '')

-- muted text on highlighted background
highlight('DiffChange', colors.g4, colors.g1, colors.t4, colors.t1, 'none', '')
highlight('FoldColumn', colors.g4, colors.g1, colors.t4, colors.t1, 'none', '')
highlight('Folded', colors.g4, colors.g1, colors.t4, colors.t1, 'none', '')
highlight('SignColumn', colors.g4, colors.g1, colors.t4, colors.t1, 'none', '')
highlight('TabLine', colors.g4, colors.g1, colors.t4, colors.t1, 'none', '')
highlight('VisualNOS', colors.g4, colors.g1, colors.t4, colors.t1, 'none', '')

-- strongly highlighted background
highlight('MatchParen', colors.g6, colors.g2, colors.t6, colors.t2, 'none', '')
highlight('Pmenu', colors.g6, colors.g2, colors.t6, colors.t2, 'none', '')
highlight('Visual', colors.g6, colors.g2, colors.t6, colors.t2, 'none', '')

-- selected menu item
highlight('PmenuSel', colors.g0, colors.g5, colors.t0, colors.t5, 'none', '')
highlight('WildMenu', colors.g0, colors.g6, colors.t0, colors.t6, 'none', '')

-- solid lines
highlight('PmenuSbar', colors.g1, colors.g1, colors.t1, colors.t1, 'none', '')
highlight('PmenuThumb', colors.g4, colors.g4, colors.t4, colors.t4, 'none', '')
highlight('VertSplit', colors.g2, colors.g2, colors.t2, colors.t2, 'none', '')

-- Alert/Syntax Highlighting
-- RED for warning elements
highlight('DiffDelete', colors.g8, colors.g0, colors.t8, colors.t0, 'reverse', '')
highlight('Error', colors.g8, colors.g0, colors.t8, colors.t0, 'reverse', '')
highlight('ErrorMsg', colors.g8, colors.g0, colors.t8, colors.t0, 'none', '')
highlight('SpellBad', '', '', colors.t0, colors.t8, 'undercurl', colors.g8)
highlight('TooLong', colors.g8, '', colors.t8, '', 'none', '')
highlight('WarningMsg', colors.g8, colors.g0, colors.t8, colors.t0, 'none', '')

-- ORANGE for preliminary elements
highlight('Define', colors.g9, '', colors.t9, '', 'none', '')
highlight('IncSearch', colors.g9, colors.g0, colors.t9, colors.t0, 'reverse', '')
highlight('Include', colors.g9, '', colors.t9, '', 'none', '')
highlight('Macro', colors.g9, '', colors.t9, '', 'none', '')
highlight('PreCondit', colors.g9, '', colors.t9, '', 'none', '')
highlight('PreProc', colors.g9, '', colors.t9, '', 'none', '')
highlight('SpellCap', '', '', colors.t0, colors.t9, 'undercurl', colors.g9)
highlight('Title', colors.g9, '', colors.t9, '', 'none', '')

-- YELLOW for highlighted elements
highlight('DiffText', colors.gA, colors.g6, colors.tA, colors.t6, 'reverse', '')
highlight('Search', colors.gA, colors.g6, colors.tA, colors.t6, 'reverse', '')
highlight('Todo', colors.gA, colors.g6, colors.tA, colors.t6, 'reverse', '')

-- GREEN for action elements
highlight('Conditional', colors.gB, '', colors.tB, '', 'none', '')
highlight('DiffAdd', colors.gB, colors.g0, colors.tB, colors.t0, 'reverse', '')
highlight('Exception', colors.gB, '', colors.tB, '', 'none', '')
highlight('Keyword', colors.gB, '', colors.tB, '', 'none', '')
highlight('Label', colors.gB, '', colors.tB, '', 'none', '')
highlight('ModeMsg', colors.gB, '', colors.tB, '', 'none', '')
highlight('MoreMsg', colors.gB, '', colors.tB, '', 'none', '')
highlight('Operator', colors.gB, '', colors.tB, '', 'none', '')
highlight('Question', colors.gB, '', colors.tB, '', 'none', '')
highlight('Repeat', colors.gB, '', colors.tB, '', 'none', '')
highlight('Statement', colors.gB, '', colors.tB, '', 'none', '')

-- TEAL for object types
highlight('SpellLocal', '', '', colors.t0, colors.tC, 'undercurl', colors.gC)
highlight('StorageClass', colors.gC, '', colors.tC, '', 'none', '')
highlight('Structure', colors.gC, '', colors.tC, '', 'none', '')
highlight('Type', colors.gC, '', colors.tC, '', 'none', '')
highlight('Typedef', colors.gC, '', colors.tC, '', 'none', '')

-- BLUE for constants
highlight('Boolean', colors.gD, '', colors.tD, '', 'none', '')
highlight('Character', colors.gD, '', colors.tD, '', 'none', '')
highlight('Constant', colors.gD, '', colors.tD, '', 'none', '')
highlight('Float', colors.gD, '', colors.tD, '', 'none', '')
highlight('Number', colors.gD, '', colors.tD, '', 'none', '')
highlight('String', colors.gD, '', colors.tD, '', 'none', '')

-- PURPLE for special text
highlight('Debug', colors.gE, '', colors.tE, '', 'none', '')
highlight('Delimiter', colors.gE, '', colors.tE, '', 'none', '')
highlight('Special', colors.gE, '', colors.tE, '', 'none', '')
highlight('SpecialChar', colors.gE, '', colors.tE, '', 'none', '')
highlight('SpecialComment', colors.gE, '', colors.tE, '', 'none', '')
highlight('SpecialKey', colors.gE, '', colors.tE, '', 'none', '')
highlight('SpellRare', '', '', colors.t0, colors.tE, 'undercurl', colors.gE)
highlight('Tag', colors.gE, '', colors.tE, '', 'none', '')

-- PINK for object names
highlight('Function', colors.gF, '', colors.tF, '', 'none', '')
highlight('Identifier', colors.gF, '', colors.tF, '', 'none', '')

-- Disable highlighted CursorLineNr
if vim.g.strawberry_light_CursorLineNr == 'off' then
    highlight('CursorLineNr', colors.g4, colors.g1, colors.t4, colors.t1, 'none', '')
end

-- Disable LineNr background altogether
if vim.g.strawberry_light_LineNr == 'off' then
    highlight('CursorLineNr', colors.g4, colors.g0, colors.t4, colors.t0, 'none', '')
    highlight('LineNr', colors.g4, colors.g0, colors.t4, colors.t0, 'none', '')
end

