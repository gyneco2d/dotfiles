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


############ Prompt settings ############
# Reference : PROMPTING in bash manual

function length()
{
  echo -n ${#1}
}

function init-prompt-git-branch()
{
  git symbolic-ref HEAD 2>/dev/null >/dev/null &&
  echo "$(git symbolic-ref HEAD 2>/dev/null | sed 's/^refs\/heads\///')"
}

if which git 2>/dev/null >/dev/null
then
  export PS1_GIT_BRANCH='\[\e[$[COLUMNS]D\]\[\e[32m\]\[\e[$[COLUMNS-$(length $(init-prompt-git-branch))]C\]$(init-prompt-git-branch)\[\e[$[COLUMNS]D\]\[\e[0m\]'
else
  export PS1_GIT_BRANCH=
fi
# export PS1="\[\e[32;1m\]\u@\H \[\e[33;1m\]\w $PS1_GIT_BRANCH\n\[\e[36;1m\]\t \[\e[0m\]\$ "
export PS1="\[\e[35m\]\n\u \[\e[36m\]\w$PS1_GIT_BRANCH\n\[\e[35m\]>\[\e[0m\] "

############ Another way ############
# # These files from `https://github.com/git/git/tree/master/contrib/completion`
# if [ -f /usr/local/git/contrib/completion/git-prompt.sh ] ; then
#     source /usr/local/git/contrib/completion/git-prompt.sh
# fi
# if [ -f /usr/local/git/contrib/completion/git-completion.bash ] ; then
#     source /usr/local/git/contrib/completion/git-completion.bash
# fi
# # changes not staged for commit => show `*`
# # changes to be commited => show `+`
# GIT_PS1_SHOWDIRTYSTATE=true
# # untracked files exists => show `%`
# GIT_PS1_SHOWUNTRACKEDFILES=true
# # stash exists => show `$`
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto
# export PS1='\[\e[35m\]\n\u \[\e[36m\]\w\n\[\033[31m\]$(__git_ps1) \[\e[35m\]>\[\e[0m\] '


############ Alias `ls -G` to `ls`. ############
#                 1234567890123456789ABC
# export LSCOLORS=exfxcxdxbxegedabagacad  # デフォルト
export LSCOLORS=exfxcxdxbxegedabagacgx
alias ls='ls -G'


############ scan-build ############
PATH=$PATH:/usr/local/checker/bin


############ ant setting ############
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"
export ANT_HOME="/usr/local/ant"
PATH=$PATH:$ANT_HOME/bin
export ANT_OPTS="-Dfile.encoding=UTF-8 -Xmx512m -Xss256k"


############ composer setting ############
export PATH="$PATH:~/.composer/vendor/bin"


