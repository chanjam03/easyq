# q/kdb+ Syntax Highlighting for Vim

Simple syntax highlighting for q/kdb+ with VS Code-inspired colors.

## Installation

1. **Copy syntax file:**
```bash
mkdir -p ~/.vim/syntax
# Copy q.vim to ~/.vim/syntax/q.vim
```

2. **Set up filetype detection:**
```bash
mkdir -p ~/.vim/ftdetect
```

Create `~/.vim/ftdetect/q.vim`:
```vim
au BufRead,BufNewFile *.q set filetype=q
au BufRead,BufNewFile *.k set filetype=q
```

3. **Enable true colors (add to `~/.vimrc`):**
```vim
" Enable true color support
if has('termguicolors')
  set termguicolors
endif

set background=dark
```

4. **Restart vim or reload:**
```vim
:source ~/.vimrc
```

## Features

- Distinct colors for `/` vs `//` comments
- Reserved keywords in pink
- Namespace functions (`.Q`, `.z`, `.h`, `.j`) in yellow
- Symbols, strings, numbers with appropriate highlighting
- Yellow brackets/braces
- All temporal types supported

## Optional Enhancements

Add to `~/.vimrc` for better visual mode:
```vim
" Better visual selection
hi Visual ctermbg=237 guibg=#3E4452 ctermfg=NONE guifg=NONE
```

---

**Note:** Requires vim 8.0+ with 256-color terminal support.
