" ─────────────────────────────────────────────
"  .vimrc — sodda vim konfiguratsiya
" ─────────────────────────────────────────────

" === ASOSIY SOZLAMALAR ===
set nocompatible          " Vi bilan moslikni o'chirish
filetype plugin indent on
syntax on

" Qator raqamlari
set number
set relativenumber

" Indentatsiya
set tabstop=2
set shiftwidth=2
set expandtab             " tab o'rniga space
set autoindent
set smartindent

" UI
set cursorline            " joriy qatorni ajratish
set wrap                  " uzun qatorlarni kesib o'tmaslik (false = nowrap)
set scrolloff=8           " chekkada 8 qator saqla
set signcolumn=yes        " gutter (diagnostic uchun)
set laststatus=2          " statusline har doim ko'rinsin
set showcmd               " pastda buyruqni ko'rsat
set wildmenu              " buyruq completion menusi
set termguicolors         " 24-bit rang (terminal qo'llasa)

" Qidirish
set ignorecase
set smartcase             " katta harf bo'lsa case-sensitive
set hlsearch              " qidiruv natijasini highlight
set incsearch             " yozayotganda qidirish

" Clipboard
set clipboard=unnamedplus " tizim clipboard

" Boshqa
set undofile              " undo tarixini saqlash
set noswapfile
set splitright
set splitbelow
set encoding=utf-8
set backspace=indent,eol,start


" === TEMA (TokyoNight Night uslubida) ===
" Terminal 256 rang yoki true color bo'lishi kerak

set background=dark

hi clear
if exists("syntax_on") | syntax reset | endif

" Asosiy ranglar
hi Normal       guifg=#c0caf5 guibg=#1a1b26 ctermfg=189 ctermbg=234
hi LineNr       guifg=#3b4261 ctermfg=238
hi CursorLine   guibg=#1e2030 cterm=none ctermbg=235
hi CursorLineNr guifg=#7aa2f7 ctermfg=111
hi Comment      guifg=#565f89 ctermfg=60  gui=italic
hi Keyword      guifg=#bb9af7 ctermfg=141
hi Function     guifg=#7aa2f7 ctermfg=111
hi String       guifg=#9ece6a ctermfg=149
hi Number       guifg=#ff9e64 ctermfg=215
hi Type         guifg=#2ac3de ctermfg=45
hi Constant     guifg=#ff9e64 ctermfg=215
hi Operator     guifg=#89ddff ctermfg=117
hi Visual       guibg=#283457 ctermbg=237
hi Search       guifg=#1a1b26 guibg=#e0af68 ctermfg=234 ctermbg=178
hi StatusLine   guifg=#c0caf5 guibg=#16161e ctermfg=189 ctermbg=233
hi StatusLineNC guifg=#3b4261 guibg=#16161e ctermfg=238 ctermbg=233
hi VertSplit    guifg=#1a1b26 ctermfg=234
hi Pmenu        guifg=#c0caf5 guibg=#1e2030 ctermfg=189 ctermbg=235
hi PmenuSel     guifg=#1a1b26 guibg=#7aa2f7 ctermfg=234 ctermbg=111
hi SignColumn   guibg=#1a1b26 ctermbg=234
hi Error        guifg=#f7768e ctermfg=204
hi Todo         guifg=#e0af68 ctermfg=178 gui=bold


" === STATUSLINE ===
set statusline=
set statusline+=\ %f           " fayl nomi
set statusline+=\ %m           " o'zgartirilgan belgisi [+]
set statusline+=%=             " o'ng tomonga o'tish
set statusline+=\ %y           " fayl turi [python]
set statusline+=\ %l:%c        " qator:ustun
set statusline+=\ %p%%\        " foiz


" === LEADER TUGMASI ===
let mapleader = " "


" === TUGMALAR ===

" Saqlash / chiqish
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Qidiruv highlightni tozalash
nnoremap <leader>h :nohlsearch<CR>

" Oyna navigatsiyasi
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Visual modeda indent — qaytib visual modeda qoladi
vnoremap < <gv
vnoremap > >gv

" Qatorlarni ko'chirish (Alt+j/k)
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Format (tashqi formatter bilan)
" <leader>fm bosganda joriy faylni format qiladi
nnoremap <leader>fm :call FormatFile()<CR>


" === FORMATTER ===
function! FormatFile()
  let l:ft = &filetype
  if l:ft == 'python'
    execute '!black % && isort %'
  elseif l:ft == 'javascript' || l:ft == 'typescript' || l:ft == 'json' || l:ft == 'yaml' || l:ft == 'markdown'
    execute '!prettier --write %'
  elseif l:ft == 'lua'
    execute '!stylua %'
  elseif l:ft == 'go'
    execute '!gofmt -w %'
  elseif l:ft == 'rust'
    execute '!rustfmt %'
  else
    echo "Bu fayl turi uchun formatter topilmadi: " . l:ft
  endif
  edit!  " faylni qayta yuklab olish
endfunction

" Saqlaganda avtomatik format (izohlash uchun " qo'shing)
autocmd BufWritePre * call FormatFile()


" === NETRW (ichki fayl daraxti) ===
" <leader>e bilan ochiladi, alohida plugin shart emas
let g:netrw_banner    = 0     " yuqori banner yo'q
let g:netrw_liststyle = 3     " daraxt ko'rinishi
let g:netrw_winsize   = 25    " kenglik %
nnoremap <leader>e :Lexplore<CR>

