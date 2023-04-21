-- 一部のプラグインの読み込みを無効化して読み込みを早くする
local vim = vim
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spec = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.editorconfig = true

vim.g.load_black = 1
vim.g.loaded_fzf = 1
vim.g.loaded_gtags = 1
vim.g.loaded_gtags_cscope = 1

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_pythonx_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
--
vim.opt.number = true -- 行番号を表示
vim.opt.laststatus = 3 -- ステータスラインを画面いっぱいにする
vim.o.cursorline = true -- カーソルラインを表示
vim.o.showtabline = 2 -- タブバーを常時表示
vim.o.autoindent = true -- "改行時に自動でインデントする
vim.o.clipboard = "unnamed" -- ヤンクしたときにクリップボードに自動コピー
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.o.swapfile = false -- swapfileをなくす
vim.o.termguicolors = true -- ターミナルの色を設定
vim.o.autoread = true -- 他で書き換えられたら自動で読み直す
vim.o.mouse = "" -- マウス操作ができるないようにする
vim.o.splitright = true -- 分割するときに右側に開く
vim.o.signcolumn = "yes" -- 行番号の目印桁を表示する
vim.o.tabstop = 2 -- タブを何文字の空白に変換するか
vim.o.shiftwidth = 2 -- "自動インデント時に入力する空白の数
vim.o.expandtab = true -- タブをスペースに変換
vim.o.hls = true -- 検索結果を強調表示
vim.o.ignorecase = true -- 大文字小文字を無視して検索する
vim.o.smartcase = true -- 大文字を含んでいる時は完全一致で検索
vim.o.backup = false -- バックアップを作らない
vim.o.cmdheight = 0 -- コマンドラインの高さを0にする
vim.o.guifont = "JetBrainsMono Nerd Font:h15"
vim.o.pumblend = 7 -- ポップアップメニューをはん透明にする
vim.o.winblend = 7 -- windowメニューをはん透明にする
vim.g.mapleader = " "

-- vim.o.completeopt

vim.o.synmaxcol = 200
-- ColorScheme
vim.cmd([[ syntax enable ]]) -- シンタックスカラーリングオン
vim.o.t_Co = 256
vim.o.background = "dark"

vim.o.display = "lastline" -- 長い行も一行で収まるように
vim.o.showmode = false
vim.o.showmatch = true -- 括弧の対応をハイライト
vim.o.matchtime = 8 -- 括弧の対を見つけるミリ秒数
vim.o.showcmd = true -- 入力中のコマンドを表示
-- vim.o.relativenumber = true
vim.o.wrap = true -- 画面幅で折り返す
vim.o.title = false -- タイトル書き換えない
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.api.nvim_set_hl(0, "VertSplit", { ctermbg = "NONE", bg = "NONE" })

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
