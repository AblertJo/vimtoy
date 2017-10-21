
function! Align_Space() 
    let current_line = getline('.')
 
 
 
    let replacement = substitute(current_line,'\([()a-zA-Z0-9_]\)\([!|^&=<>%*/+-]\)','\1 \2','g')
    let newline = substitute(replacement,'\([!|^&=<>%*/+-]\)\([()a-zA-Z0-9_]\)','\1 \2','g')
   
    call setline('.',newline)
    if current_line != newline
    	call cursor(line('.'),col('.') + 1)
    endif
endfunction 
autocmd CursorMovedI *.[ch] call Align_Space()
