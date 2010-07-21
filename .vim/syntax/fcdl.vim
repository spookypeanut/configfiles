" Vim syntax file

"
" Keywords
syn match   fcdlVariable	display "^\t*\<\([a-zA-Z_][a-zA-Z0-9_]*\)\>"
syn match   fcdlNode		"^\t*[a-zA-Z_][a-zA-Z0-9_]*\s*\((\s*[a-zA-Z_][a-zA-Z0-9_]*\s*)\)\?\s*:" display contains=fcdlSuper
syn match   fcdlSuper		"(\s*[a-zA-Z_][a-zA-Z0-9_.]*\s*)" contained
syn keyword fcdlStatement	hash_keys hash_values system extern
syn keyword fcdlImport		include require
syn keyword fcdlOperator	and or question string_join string_split aggregate length node_name

" Comments
syn match   fcdlComment	"//.*" display
syn match   fcdlComment	"##.*" display
syn match   fcdlComment	"^\s*#.*" display

" Errors
syn match fcdlError		"\<\d\+\D\+\>" display
syn match fcdlError		"[$?]" display
syn match fcdlError		"[-+&|]\{2,}" display
syn match fcdlError		"[=]\{3,}" display

" TODO: Mixing spaces and tabs also may be used for pretty formatting multiline
" statements. For now I don't know how to work around this.
if exists("fcdl_highlight_indent_errors") && fcdl_highlight_indent_errors != 0
  syn match fcdlIndentError	"^\s*\( \t\|\t \)\s*\S"me=e-1 display
endif

" Trailing space errors
if exists("fcdl_highlight_space_errors") && fcdl_highlight_space_errors != 0
  syn match fcdlSpaceError	"\s\+$" display
endif

" Strings
syn region fcdlString		start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=fcdlEscape,fcdlEscapeError
syn region fcdlString		start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=fcdlEscape,fcdlEscapeError
syn region fcdlString		start=+"""+ end=+"""+ keepend contains=fcdlEscape,fcdlEscapeError,fcdlSpaceError
syn region fcdlString		start=+'''+ end=+'''+ keepend contains=fcdlEscape,fcdlEscapeError,fcdlSpaceError

syn match  fcdlEscape		+\\[abfnrtv'"\\]+ display contained
syn match  fcdlEscape		"\\\o\o\=\o\=" display contained
syn match  fcdlEscapeError	"\\\o\{,2}[89]" display contained
syn match  fcdlEscape		"\\x\x\{2}" display contained
syn match  fcdlEscapeError	"\\x\x\=\X" display contained
syn match  fcdlEscape		"\\$"

" Numbers (ints, longs, floats, complex)
syn match   fcdlHexNumber	"\<0[xX]\x\+[lL]\=\>" display
syn match   fcdlHexNumber	"\<0[xX]\>" display
syn match   fcdlNumber	"\<\d\+[lLjJ]\=\>" display
syn match   fcdlFloat		"\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match   fcdlFloat		"\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match   fcdlFloat		"\<\d\+\.\d*\([eE][+-]\=\d\+\)\=[jJ]\=" display

syn match   fcdlOctalError	"\<0\o*[89]\d*[lL]\=\>" display
syn match   fcdlHexError	"\<0[xX]\X\+[lL]\=\>" display

if version >= 508 || !exists("did_fcdl_syn_inits")
  if version <= 508
    let did_fcdl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink fcdlStatement	Statement
  HiLink fcdlSuper		Statement
  HiLink fcdlNode		Structure
  HiLink fcdlVariable	Identifier
  HiLink fcdlImport		Include
  HiLink fcdlOperator	Operator

  HiLink fcdlComment	Comment

  HiLink fcdlError		Error
  HiLink fcdlIndentError	Error
  HiLink fcdlSpaceError	Error

  HiLink fcdlString		String

  HiLink fcdlEscape			Special
  HiLink fcdlEscapeError		Error

  HiLink fcdlNumber		Number
  HiLink fcdlHexNumber	Number
  HiLink fcdlFloat		Float
  HiLink fcdlOctalError	Error
  HiLink fcdlHexError		Error

  delcommand HiLink
endif

let b:current_syntax = "fcdl"
