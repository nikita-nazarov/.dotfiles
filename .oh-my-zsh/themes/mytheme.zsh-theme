username() {
   # echo "%{$FG[085]%}%n%{$reset_color%}"
   echo "%F{045}%b%n%f%b"
}

# current directory, two levels deep
directory() {
   echo "%2~"
}

current_time() {
   echo "%{$fg[white]%}%*%{$reset_color%}"
}

git_branch_name() {	
  local NAME=$(git branch --show-current 2>/dev/null)
  if [ ! -z "$NAME" ]; then
    echo " ($NAME)" 
  fi
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

UP_CORNER='╭─'
DOWN_CORNER='╰─'

build_theme() {
  echo "${UP_CORNER} %B$(username) [$(directory)]" 
  echo "${DOWN_CORNER}$ "
}

# putting it all together	
#PROMPT='%B$(username) $(directory)$(git_branch_name): '
PROMPT="$(build_theme)"
RPROMPT='$(current_time)'

