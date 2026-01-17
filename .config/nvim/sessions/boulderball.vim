let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/projects/android/boulderball
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +40 lib/main.dart
badd +109 lib/providers/user_provider.dart
badd +235 lib/providers/bundle_provider.dart
badd +324 lib/screens/routes/route_details_screen.dart
badd +243 lib/screens/performance_screen.dart
badd +47 lib/widgets/community/username_dialog.dart
badd +10 lib/models/user_model.dart
badd +115 lib/widgets/routes/bundled_bundle_widget.dart
badd +1 lib/widgets/routes/purchasable_route_widget.dart
badd +23 lib/widgets/routes/bundle_widget.dart
badd +79 lib/screens/routes/bundle_list_screen.dart
argglobal
%argdel
$argadd lib/main.dart
edit lib/main.dart
argglobal
balt lib/widgets/routes/bundle_widget.dart
setlocal foldmethod=indent
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
41
sil! normal! zo
57
sil! normal! zo
66
sil! normal! zo
80
sil! normal! zo
81
sil! normal! zo
let s:l = 66 - ((37 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 66
normal! 0
tabnext 1
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
