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
badd +78 lib/main.dart
badd +109 ~/projects/android/boulderball/lib/providers/user_provider.dart
badd +235 ~/projects/android/boulderball/lib/providers/bundle_provider.dart
badd +324 ~/projects/android/boulderball/lib/screens/routes/route_details_screen.dart
badd +243 ~/projects/android/boulderball/lib/screens/performance_screen.dart
badd +47 lib/widgets/community/username_dialog.dart
badd +10 lib/models/user_model.dart
badd +115 ~/projects/android/boulderball/lib/widgets/routes/bundled_bundle_widget.dart
badd +1 ~/projects/android/boulderball/lib/widgets/routes/purchasable_route_widget.dart
badd +163 ~/projects/android/boulderball/lib/widgets/routes/bundle_widget.dart
badd +79 lib/screens/routes/bundle_list_screen.dart
argglobal
%argdel
$argadd lib/main.dart
edit ~/projects/android/boulderball/lib/widgets/routes/bundle_widget.dart
argglobal
balt ~/projects/android/boulderball/lib/widgets/routes/purchasable_route_widget.dart
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 163 - ((36 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 163
normal! 054|
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
