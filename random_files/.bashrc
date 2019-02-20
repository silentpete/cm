#TODO: get some colors
eval $(dircolors -b)
export GREP_COLOR='01;32'
PROMPT_COMMAND='_PROMPT_EXIT_STATUS=$?; _PWD_RELATIVE="${PWD/#$HOME/~}"; printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
PS1="\$([[ \$UID -eq 0 ]] && echo \[\033[01\;31m\] || echo \[\033[01\;32m\])\u\[\033[01;30m\]@\[\033[01;34m\]\h\[\033[01;30m\](\$([[ \${#_PWD_RELATIVE} -gt 30 ]] && echo \[\033[01\;36m\]\${_PWD_RELATIVE:0:5}\[\033[01\;30m\]...\[\033[01\;36m\]\${_PWD_RELATIVE:\${#_PWD_RELATIVE}-22} || echo \[\033[01\;36m\]\$_PWD_RELATIVE)\[\033[01;30m\]) \$([[ \$_PROMPT_EXIT_STATUS -ne 0 ]] && echo \[\033[01\;31m\] || echo \[\033[01\;32m\])\\$\[\033[00m\] "
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -al'
alias la='ls -1Al'
alias '...'='cd $OLDPWD'
alias '..'='cd ..'
