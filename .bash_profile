#
# Aliases
#
alias vimrc="vim ~/.vimrc"
alias vimp="vim ~/.vim/.vim.plug"
alias bashprof="vim ~/.bash_profile && source ~/.bash_profile"
alias zshtheme="vim ~/.oh-my-zsh/themes/mytheme.zsh-theme && source ~/.zshrc"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias bytecode="find . -name \"*.class\" | fzf | xargs javap -l -c -p | vim - -c \"set syntax=java\""
alias g=git

