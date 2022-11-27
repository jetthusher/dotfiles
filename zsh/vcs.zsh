# Enable git in prompt

autoload +X -U vcs_info

# Taken from https://github.com/zsh-users/zsh/blob/f9e9dce5443f323b340303596406f9d3ce11d23a/Misc/vcs_info-examples#L155-L170
# Used for marking untracked files
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[unstaged]+='%F{08}%B?%f%b'
    fi
}

# No need to enable anything but git
zstyle ':vcs_info:*' enable		git

# To make sure (un)staged changes and untracked files are visible
zstyle ':vcs_info:*' check-for-changes	true
zstyle ':vcs_info:*' unstagedstr	'%F{red}%B±%b%f'
zstyle ':vcs_info:*' stagedstr		'%F{yellow}%B+%b%f'
zstyle ':vcs_info:git*+set-message:*'	hooks git-untracked

# Formats used most of the time
zstyle ':vcs_info:*' formats		' %F{08}(%f%F{cyan}%b%F{08})%f%c%u'

# Formats used when using interactive merging or there are conflicts
zstyle ':vcs_info:*' actionformats	' %F{08}(%f%F{cyan}%b|%F{yellow}%a%F{08})%f%c%u'
