function! Align_Space()      
    let current_line = getline('.')
    let replacement = substitute(current_line,'\([()a-zA-Z0-9_]\)\([!|^&=<>%*/+-]\)','\1 \2','g')    
    let newline = substitute(replacement,'\([!|^&=<>%*/+-]\)\([()a-zA-Z0-9_]\)','\1 \2','g')    
    let replacement = substitute(newline,'\([^&]\)\(\s*\)\(&\)\s*\([()a-zA-Z0-9_]\)','\1 \3\4','g')
    let newline = substitute(replacement,'\s\+->','->','g')
    let replacement = substitute(newline,'\s\+++','++','g')
    let newline = substitute(replacement,'\s\+--','--','g')
    
    let replacement = newline
    
    if '"' == matchstr(replacement,'"')
        let newline = substitute(replacement,'%\s+','%','g')
    else
        let newline = replacement
    endif
    call setline('.',newline)    
    if newline != current_line    
        call cursor(line('.'),col('.') + 1)    
    endif
endfunction  
autocmd CursorMovedI *.[ch] call Align_Space()
