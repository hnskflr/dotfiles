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
badd +75 lib/views/buzzer/screens/init_screen.dart
badd +14 lib/models/season.dart
badd +45 lib/views/buzzer/game_view.dart
badd +1 lib/main.dart
badd +103 lib/providers/buzzer_provider.dart
badd +34 lib/views/home/screens/home_screen.dart
badd +85 lib/views/buzzer/screens/select_mode_screen.dart
badd +51 lib/views/buzzer/screens/create_player_screen.dart
badd +445 /usr/lib/flutter/bin/cache/pkg/sky_engine/lib/core/list.dart
badd +90 lib/providers/game_provider.dart
argglobal
%argdel
$argadd lib/main.dart
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit lib/views/buzzer/screens/select_mode_screen.dart
argglobal
balt lib/models/season.dart
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=9
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
31
sil! normal! zo
45
sil! normal! zo
50
sil! normal! zo
70
sil! normal! zo
73
sil! normal! zo
102
sil! normal! zo
117
sil! normal! zo
120
sil! normal! zo
139
sil! normal! zo
141
sil! normal! zo
152
sil! normal! zo
let s:l = 83 - ((41 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 83
normal! 022|
lcd ~/projects/android/pocket_ninja/lib/providers
tabnext
edit ~/projects/android/pocket_ninja/lib/views/home/screens/home_screen.dart
argglobal
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=5
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
12
sil! normal! zo
14
sil! normal! zo
17
sil! normal! zo
let s:l = 34 - ((33 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 34
normal! 068|
lcd ~/projects/android/pocket_ninja/lib/views/home/screens
tabnext
edit ~/projects/android/pocket_ninja/lib/views/buzzer/game_view.dart
argglobal
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=4
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
25
sil! normal! zo
27
sil! normal! zo
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 039|
lcd ~/projects/android/pocket_ninja/lib/views/buzzer
tabnext
edit ~/projects/android/pocket_ninja/lib/views/buzzer/screens/init_screen.dart
argglobal
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=7
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
29
sil! normal! zo
let s:l = 57 - ((15 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 57
normal! 0
lcd ~/projects/android/pocket_ninja/lib/views/buzzer/screens
tabnext 1
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
