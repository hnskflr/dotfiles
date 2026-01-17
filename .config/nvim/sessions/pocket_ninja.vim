let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/projects/android/pocket_ninja
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 .flutter-plugins
badd +5 lib/views/widgets/hexagon.dart
badd +20 lib/views/game/widgets/player_selector_icon.dart
badd +22 lib/views/widgets/player_with_icon.dart
badd +5554 /opt/flutter/packages/flutter/lib/src/widgets/basic.dart
badd +87 lib/views/friends_list/screens/player_details_screen.dart
badd +35 term://~/.local/share/nvim/lazy/coq_nvim//3998:/sbin/python3
badd +1 term://~/.local/share/nvim/lazy/coq_nvim//29565:/sbin/python3
badd +4847 ~/.local/state/nvim/mason.log
badd +35 lib/views/game/game_view.dart
badd +196 /usr/lib/flutter/packages/flutter/lib/src/material/app_bar.dart
badd +26 lib/views/game/screens/select_mode_screen.dart
badd +37 term://~/.local/share/nvim/lazy/coq_nvim//87752:/sbin/python3
badd +11 lib/models/game.dart
badd +89 lib/views/buzzer/screens/init_screen.dart
badd +14 lib/models/season.dart
badd +1 lib/main.dart
badd +103 lib/providers/buzzer_provider.dart
badd +51 lib/views/buzzer/screens/create_player_screen.dart
badd +445 /usr/lib/flutter/bin/cache/pkg/sky_engine/lib/core/list.dart
badd +90 lib/providers/game_provider.dart
badd +119 lib/views/buzzer/screens/select_mode_screen.dart
badd +56 lib/views/bootcamp/screens/bootcamp_screen.dart
badd +15 lib/models/move.dart
argglobal
%argdel
$argadd lib/main.dart
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit lib/views/bootcamp/screens
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 62 + 104) / 208)
exe 'vert 2resize ' . ((&columns * 145 + 104) / 208)
argglobal
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/projects/android/pocket_ninja
wincmd w
argglobal
if bufexists(fnamemodify("~/projects/android/pocket_ninja/lib/views/buzzer/screens/select_mode_screen.dart", ":p")) | buffer ~/projects/android/pocket_ninja/lib/views/buzzer/screens/select_mode_screen.dart | else | edit ~/projects/android/pocket_ninja/lib/views/buzzer/screens/select_mode_screen.dart | endif
if &buftype ==# 'terminal'
  silent file ~/projects/android/pocket_ninja/lib/views/buzzer/screens/select_mode_screen.dart
endif
balt ~/projects/android/pocket_ninja/lib/views/buzzer/screens/init_screen.dart
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=6
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
41
sil! normal! zo
113
sil! normal! zo
119
sil! normal! zo
133
sil! normal! zo
151
sil! normal! zo
let s:l = 121 - ((10 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 121
normal! 027|
wincmd w
exe 'vert 1resize ' . ((&columns * 62 + 104) / 208)
exe 'vert 2resize ' . ((&columns * 145 + 104) / 208)
tabnext
edit ~/projects/android/pocket_ninja/lib/views/bootcamp/screens/bootcamp_screen.dart
argglobal
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=5
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
29
sil! normal! zo
33
sil! normal! zo
35
sil! normal! zo
37
sil! normal! zo
40
sil! normal! zo
43
sil! normal! zo
63
sil! normal! zo
65
sil! normal! zo
68
sil! normal! zo
let s:l = 42 - ((41 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 42
normal! 011|
lcd ~/projects/android/pocket_ninja
tabnext
edit ~/projects/android/pocket_ninja/lib/models/move.dart
argglobal
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=1
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
10
sil! normal! zo
11
sil! normal! zo
15
sil! normal! zo
let s:l = 14 - ((13 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 017|
lcd ~/projects/android/pocket_ninja
tabnext 3
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
