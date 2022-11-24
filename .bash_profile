#
# Exports
#
export JDK_17="~/.jdks/corretto-17.0.5/"
export JDK_11="~/.jdks/corretto-11.0.17/"
export JDK_1_8="~/.jdks/corretto-1.8.0_352/"
export JDK_1_7=$JDK_1_8
export JDK_1_6=$JDK_1_8
export JAVA_HOME=$JDK_11

#
# Aliases
#
alias vimrc="vim ~/.vimrc"
alias vimp="vim ~/.vim/.vim.plug"
alias bashprof="vim ~/.bash_profile && source ~/.bash_profile"
alias zshtheme="vim ~/.oh-my-zsh/themes/mytheme.zsh-theme && source ~/.zshrc"
alias bytecode="find . -name \"*.class\" | fzf | xargs javap -l -c -p | code -"
alias g=git

