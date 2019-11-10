export PS1="\w : "
export PATH=$PATH:/Users/samlee/.ssi/bin

alias clea='clear'
alias clera='clear'
alias sl='ls'
alias rls='clear'
alias k='kubectl'
eval $(thefuck --alias)
alias gl="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"

alias tigs='tig status'

alias drip='ssi-drip-toolkit'

#GIT
alias gc='git checkout'
alias gb='git branch'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export PYTHONPATH="/Users/samlee/2s/Data/semantics-soccer"

export PATH="$HOME/.cargo/bin:$PATH"
