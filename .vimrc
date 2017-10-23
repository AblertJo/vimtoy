function! Align_Space()      
    let current_line = getline('.')
    let replacement = substitute(current_line,'\([()a-zA-Z0-9_]\)\([!|^&=<>%*/+-]\)','\1 \2','g')    
    let newline = substitute(replacement,'\([!|^&=<>%*/+-]\)\([()a-zA-Z0-9_]\)','\1 \2','g')    
    let replacement = substitute(newline,'\([^&]\)\(&\)\s*\([()a-zA-Z0-9_]\)','\1 \2\3','g')    
    call setline('.',replacement)    
    if replacement != current_line    
        call cursor(line('.'),col('.') + 1)    
    endif
endfunction  
autocmd CursorMovedI *.[ch] call Align_Space()
