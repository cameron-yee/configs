eval "$(starship init zsh)"

# vim mode
bindkey -v

# Add exports
if [ -f ~/.zsh/exports ]; then
    source ~/.zsh/exports
else
    print "File not found: ~/.zsh/exports"
fi

# Add fzf support
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add aliases
if [ -f ~/.zsh/aliases ]; then
    source ~/.zsh/aliases
else
    print "File not found: ~/.zsh/aliases"
fi

# Add functions
if [ -f ~/.zsh/functions ]; then
    source ~/.zsh/functions
else
    print "File not found: ~/.zsh/functions"
fi

#For renaming files that are saved in Downloads directory
(fswatch -om fsevents_monitor ~/Downloads | xargs -n1 ~/Documents/misc/misc_scripts/rename_files.py || true) &!

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
