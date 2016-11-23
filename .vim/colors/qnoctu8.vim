" noctu.vim - Vim color scheme for 16-color terminals
" --------------------------------------------------------------
" Author:   Noah Frederick (http://noahfrederick.com/)
" Version:  1.7.0
" --------------------------------------------------------------

" Scheme setup {{{
set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="qnoctu"

"}}}
" Vim UI {{{
hi MatchParen ctermfg=4 ctermbg=0 cterm=bold

hi StatusLineNC ctermfg=0 cterm=NONE,bold
hi StatusLine ctermfg=4 cterm=NONE,bold
hi WildMenu ctermfg=7 ctermbg=0 cterm=NONE,bold
hi! link Pmenu StatusLine
hi! link PmenuSel Wildmenu
hi! link VertSplit StatusLine
hi! link TabLine StatusLine
hi! link TabLineSel WildMenu

hi SpellBad ctermfg=1
hi SpellCap ctermfg=2 cterm=bold
hi SpellRare ctermfg=3 cterm=bold
hi SpellLocal ctermfg=5 cterm=bold

hi LineNr ctermfg=0 cterm=bold
hi CursorLineNr ctermfg=3 cterm=bold
hi CursorLine cterm=NONE

hi Visual ctermbg=6 cterm=NONE

hi NonText ctermfg=0 cterm=bold
hi Directory ctermfg=4 cterm=bold
hi Title ctermfg=3 cterm=bold
hi ErrorMsg ctermfg=7 ctermbg=1 cterm=bold
hi DiffAdd ctermbg=2 cterm=bold
hi DiffChange ctermbg=3
hi DiffDelete ctermbg=1
hi User1 ctermfg=7 ctermbg=5 cterm=bold
hi User2 ctermfg=7 ctermbg=0 cterm=bold
hi User3 ctermfg=7 ctermbg=3 cterm=bold
hi User4 ctermfg=7 ctermbg=0 cterm=bold
hi User5 ctermfg=7 ctermbg=5 cterm=bold
hi User6 ctermfg=7 ctermbg=6 cterm=bold
hi User7 ctermfg=7 ctermbg=4 cterm=bold
hi User8 ctermfg=7 ctermbg=3 cterm=bold
hi User9 ctermfg=7 ctermbg=0 cterm=bold
hi Folded ctermfg=0 cterm=bold
hi! link SignColumn LineNr
hi! link FoldColumn SignColumn
hi! link WarningMsg ErrorMsg
hi! link MoreMsg Title
hi! link Question MoreMsg
hi! link ModeMsg MoreMsg
hi! link TabLineFill StatusLineNC
hi! link SpecialKey NonText
" }}}
" Generic syntax {{{
hi! link Comment Folded
hi! link Ignore Folded

hi Delimiter ctermfg=7
hi! link Identifier Delimiter
hi! link Operator  Delimiter

hi Underlined ctermfg=4
hi! link Boolean Underlined

hi Keyword ctermfg=2
hi! link Statement Keyword

hi Type ctermfg=2 cterm=bold

hi Number ctermfg=5 cterm=bold
hi! link Special Number

hi String ctermfg=1 cterm=bold
hi Todo ctermfg=7 cterm=bold
hi Constant ctermfg=3 cterm=bold
hi PreProc ctermfg=4 cterm=bold
hi! link Error ErrorMsg
"}}}
" C {{{
hi! link cTypeTag Type
hi! link cEnumTag Constant
hi! link cPreProcTag Constant
hi! link cFunctionTag Function
hi! link cMemberTag Identifier
"}}}
" HTML {{{
hi htmlTagName              ctermfg=2
hi htmlTag                  ctermfg=2
hi htmlArg                  ctermfg=10
hi htmlH1                   cterm=bold
hi htmlBold                 cterm=bold
hi htmlItalic               cterm=underline
hi htmlUnderline            cterm=underline
hi htmlBoldItalic           cterm=bold,underline
hi htmlBoldUnderline        cterm=bold,underline
hi htmlUnderlineItalic      cterm=underline
hi htmlBoldUnderlineItalic  cterm=bold,underline
hi! link htmlLink           Underlined
hi! link htmlEndTag         htmlTag

"}}}
" XML {{{
hi xmlTagName       ctermfg=4
hi xmlTag           ctermfg=12
hi! link xmlString  xmlTagName
hi! link xmlAttrib  xmlTag
hi! link xmlEndTag  xmlTag
hi! link xmlEqual   xmlTag

"}}}
" JavaScript {{{
hi! link javaScript        Normal
hi! link javaScriptBraces  Delimiter

"}}}
" PHP {{{
hi phpSpecialFunction    ctermfg=5
hi phpIdentifier         ctermfg=11
hi! link phpVarSelector  phpIdentifier
hi! link phpHereDoc      String
hi! link phpDefine       Statement

"}}}
" Markdown {{{
hi! link markdownHeadingRule        NonText
hi! link markdownHeadingDelimiter   markdownHeadingRule
hi! link markdownLinkDelimiter      Delimiter
hi! link markdownURLDelimiter       Delimiter
hi! link markdownCodeDelimiter      NonText
hi! link markdownLinkTextDelimiter  markdownLinkDelimiter
hi! link markdownUrl                markdownLinkText
hi! link markdownAutomaticLink      markdownLinkText
hi! link markdownCodeBlock          String
hi markdownCode                     cterm=bold
hi markdownBold                     cterm=bold
hi markdownItalic                   cterm=underline

"}}}
" Ruby {{{
hi! link rubyDefine                 Statement
hi! link rubyLocalVariableOrMethod  Identifier
hi! link rubyConstant               Constant
hi! link rubyInstanceVariable       Number
hi! link rubyStringDelimiter        rubyString

"}}}
" Git {{{
hi gitCommitBranch               ctermfg=3
hi gitCommitSelectedType         ctermfg=10
hi gitCommitSelectedFile         ctermfg=2
hi gitCommitUnmergedType         ctermfg=9
hi gitCommitUnmergedFile         ctermfg=1
hi! link gitCommitFile           Directory
hi! link gitCommitUntrackedFile  gitCommitUnmergedFile
hi! link gitCommitDiscardedType  gitCommitUnmergedType
hi! link gitCommitDiscardedFile  gitCommitUnmergedFile

"}}}
" Vim {{{
hi! link vimSetSep    Delimiter
hi! link vimContinue  Delimiter
hi! link vimHiAttrib  Constant

"}}}
" LESS {{{
hi lessVariable             ctermfg=11
hi! link lessVariableValue  Normal

"}}}
" Help {{{
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined
"}}}
" Shell {{{
hi shDerefSimple     ctermfg=3 cterm=bold
hi! link shDerefVar  shDerefSimple
"}}}
" Netrw {{{
hi netrwExe       ctermfg=1 cterm=bold
hi netrwClassify  ctermfg=0 cterm=bold
"}}}

" vim: fdm=marker:sw=2:sts=2:et
