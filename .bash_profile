#
# Aliases
#
alias vimrc="vim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias bashprof="vim ~/.bash_profile && source ~/.bash_profile"
alias tmuxconf="vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"
alias zshtheme="vim ~/.oh-my-zsh/themes/mytheme.zsh-theme && source ~/.zshrc"
alias g=git
alias bat=batcat
alias v=vim
alias zshrc="vim ~/.zshrc"

bytecode() {
    out=`find . -name "*.class" | fzf | xargs javap -l -c -p -v `
    echo $out | vim - -c "set syntax=cpp"
}

