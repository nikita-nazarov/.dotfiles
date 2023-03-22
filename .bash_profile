
export JAVA_HOME="/usr/local/google/home/nikitanazarov/IdeaProjects/studio-main/prebuilts/studio/jdk/jdk17/linux/"
export JDK_1_8="/usr/local/google/home/nikitanazarov/.jdks/corretto-1.8.0_362/"
export JDK_1_7=$JDK_1_8
export JDK_1_6=$JDK_1_8

#
# Aliases
#
alias vimrc="vim ~/.vimrc"
alias vim=nvim
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias bashprof="vim ~/.bash_profile && source ~/.bash_profile"
alias tmuxconf="vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"
alias zshtheme="vim ~/.oh-my-zsh/themes/mytheme.zsh-theme && source ~/.zshrc"
alias bytecode="find . -name \"*.class\" | fzf | xargs javap -l -c -p | (code - &)"
alias g=git
alias bat=batcat

