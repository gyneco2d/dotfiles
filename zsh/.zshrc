source "$ZDOTDIR/.zprompt"

alias ls='ls -G'
alias idea='open -a "intellij idea"'
alias goland='open -a goland'
alias relogin='exec $SHELL -l'
alias reconf='source ~/.zprofile'
alias s_tlab='ssh -L 27000:tlabwn05:27000 g1644060@cc2000.kyoto-su.ac.jp -fN;
              ssh -L 27001:tlabwn05:27001 g1644060@cc2000.kyoto-su.ac.jp -fN'
alias k_tlab='pkill -f tlabwn05'
