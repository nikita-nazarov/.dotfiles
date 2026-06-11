export DB_HOME=~/universe/launch

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
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias nvim="/snap/bin/nvim"
alias pt="~/universe/experimental/nikita-nazarov_data/phoenix-toolkit/pt"

export DEBUG=--test_arg=--debug=5005
export TERM=xterm-256color

alias d=docker

bytecode() {
    out=`find . -name "*.class" | fzf | xargs javap -l -c -p -v `
    echo $out | vim - -c "set syntax=cpp"
}

docker-clean() {
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
}

dfzf() {
	local container_id=`docker ps | fzf | awk '{print $1;}'`
	docker exec -it $container_id bash
}

