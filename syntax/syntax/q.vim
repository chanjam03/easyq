if exists("b:current_syntax")
  finish
endif

" Comments
syn region qCommentBlock start="^/\s*$" end="^\\\\\s*$" 
" Block comment from \ to end of file
syn region qCommentBlockEOF start="^\\\\\s*$" end="\%$"

" Inline comments - double slash FIRST (more specific)
syn match qCommentInlineDouble "\s//\+.*$"
" Then single slash
syn match qCommentInlineSingle "\s/\([^/].*\)\?$"

" Line comments - double slash FIRST (more specific)
syn match qCommentLineDouble "^//\+.*$"
" Then single slash (must not be followed by another slash)
syn match qCommentLineSingle "^/\([^/].*\)\?$"

" Strings
syn region qString start=+"+ end=+"+ contains=qStringEscape,qStringInvalid
syn match qStringEscape contained "\\\\[\\ntr\"]"
syn match qStringEscape contained "\\\\[0-7]\{3}"
syn match qStringInvalid contained "^[^\s]"

" Constants - Null values
syn match qNull "\<0N[ghijepmdznuvt]\?\>"
syn match qNull "\<0n\>"

" Constants - Boolean
syn match qBoolean "\<[01]\+b\>"

" Constants - Infinity
syn match qInfinity "\<-\?0W[hijepdnutv]\?\>"
syn match qInfinity "\<-\?0wz\?\>"

" Constants - Dates and Times
syn match qDate "\<[12]\d\{3}\.\(0[1-9]\|1[0-2]\)\.\(0[1-9]\|[12]\d\|3[01]\)\>"
syn match qMonth "\<[12]\d\{3}\.\(0[1-9]\|1[0-2]\)m\>"
syn match qTime "\<\([01]\d\|2[0-3]\):\([0-5]\d\)\(:\([0-5]\d\(\.\d\{0,3}\)\?\)\)\?\>"
syn match qTimespan "\<\d\+D\(\([01]\d\|2[0-3]\):\([0-5]\d\):\([0-5]\d\(\.\d\{0,9}\)\?\)\?\)\?n\?\>"
syn match qTimestamp "\<[12]\d\{3}\.\(0[1-9]\|1[0-2]\)\.\(0[1-9]\|[12]\d\|3[01]\)[pD].*\>"
syn match qDatetime "\<[12]\d\{3}\.\(0[1-9]\|1[0-2]\)\.\(0[1-9]\|[12]\d\|3[01]\)[zT].*\>"

" Constants - Numbers
syn match qByte "\<0x[0-9a-fA-F]\+\>"
syn match qGuid "\<[0-9a-f]\{8}-[0-9a-f]\{4}-[0-9a-f]\{4}-[0-9a-f]\{4}-[0-9a-f]\{12}\>"
syn match qNumber "\<-\?\d\+\(\.\d*\)\?\([eE][+-]\?\d\+\)\?[efhij]\?\>"
syn match qFloat "\<-\?\.\d\+\([eE][+-]\?\d\+\)\?[ef]\?\>"

" Symbols
syn match qSymbol "`\(:[a-zA-Z0-9_\.:/]*\|[a-zA-Z0-9_\.:]*\)"
syn match qCast "`\(boolean\|byte\|short\|int\|long\|real\|float\|char\|symbol\|timestamp\|month\|date\|datetime\|timespan\|minute\|second\|time\|year\|mm\|dd\|hh\|uu\|ss\)\ze\$"
syn match qAttribute "`[supg]\ze#"

" System commands and namespaces
syn match qCmd "^\\\\..*"
syn match qNamespace "^[a-zA-Z])"

" Built-in functions - .Q namespace
syn match qUtilityFunc "\.Q\.\(a\|A\|addmonths\|addr\|b6\|bt\|btoa\|bv\|Cf\|chk\|cn\|D\|dd\|def\|dpft\|dpfts\|dsftg\|en\|ens\|f\|fc\|ff\|fk\|fmt\|fps\|fs\|fsn\|ft\|fu\|gc\|gz\|hdpf\|hg\|host\|hp\|id\|ind\|j10\|j12\|k\|l\|M\|MAP\|nA\|opt\|P\|par\|pd\|PD\|pf\|pn\|pt\|pv\|PV\|qp\|qt\|res\|S\|s\|s1\|sbt\|sha1\|trp\|ts\|ty\|u\|v\|V\|view\|vp\|w\|x\|x10\|x12\|Xf\)\>"

" Built-in functions - .j namespace (JSON)
syn match qJsonFunc "\.j\.\(j\|k\|jd\)\>"

" Built-in functions - .z namespace (callbacks and system info)
syn match qCallbackFunc "\.z\.\(ac\|bm\|exit\|p[cdghiopqsw]\|ts\|vs\|w[cos]\)\>"
syn match qSystemInfo "\.z\.\([a-fhiklno-qstuwxzDKNPTWXZ]\|ex\|ey\|pm\|zd\)\>"

" Built-in functions - .h namespace (HTTP)
syn match qHttpFunc "\.h\.\(br\|c[01]\|cd\|code\|d\|ed\|edsn\|fram\|h[abcenprt]\|HOME\|h[tuxy]\|hta[c]\?\|htc\|html\|http\|hu[g]\?\|hy\|iso8601\|jx\|logo\|nbr\|pre\|s[abc]\|td\|text\|tx\|ty\|uh\|val\|x[dmpst]\)\>"

" File handles and internal functions
syn match qFileFunc "\<[012]:\>"
syn match qInternalFunc "\-\([1-9]\|1[0-689]\|2[0-79]\|3[01368]\|120\)!"

" Keywords - Operators (as keywords, not generic functions)
syn keyword qOperator abs acos all and any asc asin asof atan attr avg avgs
syn keyword qOperator bin binr ceiling cols cor cos count cov cross csv cut
syn keyword qOperator deltas desc dev differ distinct div dsave each ema enlist
syn keyword qOperator eval except exec exit exp fills first fkeys flip floor
syn keyword qOperator get getenv group gtime hclose hcount hdel hopen hsym
syn keyword qOperator iasc idesc in inter inv key keys last like load log
syn keyword qOperator lower lsq ltime ltrim mavg max maxs mcount md5 mdev med
syn keyword qOperator meta min mins mmax mmin mmu mod msum neg next not null
syn keyword qOperator or over parse peach pj prd prds prev prior rand rank
syn keyword qOperator ratios raze read0 read1 reciprocal reval reverse rload
syn keyword qOperator rotate rsave rtrim save scan scov sdev set setenv show
syn keyword qOperator signum sin sqrt ss ssr string sublist sum sums sv svar
syn keyword qOperator system tables tan til trim type ungroup union upper value
syn keyword qOperator var view views vs wavg within wsum xasc xbar xcol xcols
syn keyword qOperator xdesc xexp xgroup xkey xlog xprev xrank

" Keywords - Control structures
syn keyword qControl do if while

" Keywords - Conditional vector operation
syn match qControl "\$\ze\["

" Keywords - Assignment
syn match qAssign "::\?"

" Keywords - Iterators/Adverbs
syn match qIterator "'\{1,2}:\?" 
syn match qIterator "\\\\:\?"
syn match qIterator "[^/\s]/:\?" 
syn match qIterator "^/:\s"

" Keywords - Query operators (DML)
syn keyword qQuery select update delete exec from by fby where
syn keyword qQuery aj aj0 ajf ajf0 ej ij ijf lj ljf uj ujf wj wj1 upsert insert

" Comparison operators
syn match qComparison "[=<>~]\|<="
syn match qComparison ">="
syn match qComparison "<>"

" Other operators
syn match qOtherOp "[@.$!?+\-*%|&#^,_]"

" Braces and brackets - yellow
syn match qBraces "[{}\[\]()]"

" User-defined namespace functions (must come BEFORE qVariable)
syn match qFunction "\.[a-zA-Z][a-zA-Z0-9_]*\(\.[a-zA-Z0-9_]\+\)*"

" Variables - general identifiers (comes LAST so more specific patterns match first)
syn match qVariable "\<[a-zA-Z][a-zA-Z0-9_]*\>"

" Function bodies
syn region qFunctionBody start="{" end="}" contains=ALL

" Invalid syntax
syn match qInvalid "^[}\])].*"

" Custom colors to match VS Code theme (Dark+ / similar)
" Braces and brackets - yellow
hi qBraces ctermfg=yellow guifg=#FFD700

" Comments - green (/ single slash) and cyan (// double slash)
hi qCommentBlock ctermfg=65 guifg=#6A9955
hi qCommentBlockEOF ctermfg=65 guifg=#6A9955
hi qCommentLineDouble ctermfg=72 guifg=#5FB3B3
hi qCommentLineSingle ctermfg=65 guifg=#6A9955
hi qCommentInlineDouble ctermfg=72 guifg=#5FB3B3
hi qCommentInlineSingle ctermfg=65 guifg=#6A9955

" Strings - orange/salmon
hi qString ctermfg=173 guifg=#CE9178
hi qStringEscape ctermfg=173 guifg=#D7BA7D
hi qStringInvalid ctermfg=red guifg=#F44747

" Keywords - purple/magenta
hi qControl ctermfg=141 guifg=#C586C0
hi qQuery ctermfg=141 guifg=#C586C0
hi qOperator ctermfg=75 guifg=#4EC9B0

" Functions - yellow
hi qUtilityFunc ctermfg=221 guifg=#DCDCAA
hi qJsonFunc ctermfg=221 guifg=#DCDCAA
hi qCallbackFunc ctermfg=221 guifg=#DCDCAA
hi qHttpFunc ctermfg=221 guifg=#DCDCAA
hi qFileFunc ctermfg=221 guifg=#DCDCAA
hi qInternalFunc ctermfg=221 guifg=#DCDCAA
hi qFunction ctermfg=221 guifg=#DCDCAA

" Numbers - light green
hi qNumber ctermfg=150 guifg=#B5CEA8
hi qFloat ctermfg=150 guifg=#B5CEA8
hi qByte ctermfg=150 guifg=#B5CEA8

" Constants - lighter blue/cyan
hi qNull ctermfg=75 guifg=#4FC1FF
hi qBoolean ctermfg=75 guifg=#569CD6
hi qInfinity ctermfg=75 guifg=#4FC1FF
hi qDate ctermfg=150 guifg=#B5CEA8
hi qMonth ctermfg=150 guifg=#B5CEA8
hi qTime ctermfg=150 guifg=#B5CEA8
hi qTimespan ctermfg=150 guifg=#B5CEA8
hi qTimestamp ctermfg=150 guifg=#B5CEA8
hi qDatetime ctermfg=150 guifg=#B5CEA8
hi qGuid ctermfg=150 guifg=#B5CEA8
hi qSystemInfo ctermfg=75 guifg=#4FC1FF

" Symbols - cyan/teal
hi qSymbol ctermfg=80 guifg=#4EC9B0
hi qCast ctermfg=75 guifg=#4EC9B0
hi qAttribute ctermfg=75 guifg=#4EC9B0

" Variables - light blue
hi qVariable ctermfg=117 guifg=#9CDCFE

" Operators - white/light gray
hi qAssign ctermfg=white guifg=#D4D4D4
hi qIterator ctermfg=white guifg=#D4D4D4
hi qComparison ctermfg=white guifg=#D4D4D4
hi qOtherOp ctermfg=white guifg=#D4D4D4

" System/Special
hi qCmd ctermfg=magenta guifg=#C586C0
hi qNamespace ctermfg=magenta guifg=#C586C0

" Errors
hi qInvalid ctermfg=red guifg=#F44747

let b:current_syntax = "q"
