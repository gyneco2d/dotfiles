#    __                        __                                       ___      ___
#   /\ \                      /\ \                                    /'___\ __ /\_ \
#   \ \ \____     __      ____\ \ \___            _____   _ __   ___ /\ \__//\_\\//\ \      __
#    \ \ '__`\  /'__`\   /',__\\ \  _ `\         /\ '__`\/\`'__\/ __`\ \ ,__\/\ \ \ \ \   /'__`\
#   __\ \ \L\ \/\ \L\.\_/\__, `\\ \ \ \ \        \ \ \L\ \ \ \//\ \L\ \ \ \_/\ \ \ \_\ \_/\  __/
#  /\_\\ \_,__/\ \__/.\_\/\____/ \ \_\ \_\        \ \ ,__/\ \_\\ \____/\ \_\  \ \_\/\____\ \____\
#  \/_/ \/___/  \/__/\/_/\/___/   \/_/\/_/  _______\ \ \/  \/_/ \/___/  \/_/   \/_/\/____/\/____/
#                                          /\______\\ \_\
#                                          \/______/ \/_/
#

########### .bashrc reading ############
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

########### LANG ############
export LANG=ja_JP.UTF-8

############ Prompt settings ############
# Reference : PROMPTING in bash manual
[ -r ~/.bash_prompt ] && [ -f ~/.bash_prompt ] && source ~/.bash_prompt

############ Git completion ############
# These files from `https://github.com/git/git/tree/master/contrib/completion`
if [ -f /usr/local/git/contrib/completion/git-prompt.sh ]; then
  source /usr/local/git/contrib/completion/git-prompt.sh
fi
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  source /usr/local/git/contrib/completion/git-completion.bash
fi

##### Another way to display current branch name #####
# # changes not staged for commit => show `*`
# # changes to be commited => show `+`
# GIT_PS1_SHOWDIRTYSTATE=true
# # untracked files exists => show `%`
# GIT_PS1_SHOWUNTRACKEDFILES=true
# # stash exists => show `$`
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto
# export PS1='\[\e[35m\]\n\u \[\e[36m\]\w\n\[\033[31m\]$(__git_ps1) \[\e[35m\]>\[\e[0m\] '

############ LSCOLORS ############
#                 1234567890123456789ABC
# export LSCOLORS=exfxcxdxbxegedabagacad  # default
export LSCOLORS=exfxcxdxbxegedabagacgx

############ scan-build ############
PATH=$PATH:/usr/local/checker/bin

############ Apache Ant ############
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"
export ANT_HOME="/usr/local/ant"
PATH=$PATH:$ANT_HOME/bin
export ANT_OPTS="-Dfile.encoding=UTF-8 -Xmx512m -Xss256k"
export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`

############ Composer ############
export PATH="$PATH:~/.composer/vendor/bin"

############ Ruby ############
eval "$(rbenv init -)"

############ pyenv ############
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

############ nodebrew ############
export PATH=$HOME/.nodebrew/current/bin:$PATH
