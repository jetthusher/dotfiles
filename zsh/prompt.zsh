# Last non-zero exit code
PROMPT="%(?..%F{08}[%B%(!.%F{green}.%F{red})%?%b%f%F{08}]%f )"

# Username
PROMPT+='%B%(!.%F{red}.%F{green})%n%b%f'

# Current directory, turncated to 30 characters
PROMPT+=':%30<..<%B%F{blue}%~%<<%b%f'

# Add git info (more in `vcs.zsh')
PROMPT+='$vcs_info_msg_0_'

# Privilege status
PROMPT+=' %#'

# Shell level
PROMPT+='%(2L.:%F{08}%L%f.) '
