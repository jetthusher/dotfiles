# Escape insert like in ViM
bindkey -M viins			kj			vi-cmd-mode

# Make char/word/line removal in viins more useful
bindkey -M viins			$termkeys[backspace]	backward-delete-char
bindkey -M viins			^H			backward-delete-char
bindkey -M viins			^W			backward-kill-word
bindkey -M viins			^U			backward-kill-line

# Beginning and end of line as in ViM
bindkey -M viins			^B			beginning-of-line
bindkey -M viins			^E			end-of-line
