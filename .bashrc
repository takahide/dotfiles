if [ -f ~/.qabashrc ] ; then
. ~/.qabashrc
fi

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias br="vim ~/.bashrc"
alias vr="vim ~/.vimrc"
alias sr="source ~/.bashrc"

alias dl="cd ~/Downloads"
alias ff="open -a Firefox"

alias ls='ls -G'
alias ll='ls -Gl'
alias la='ls -Ga'

alias g="git"

alias memo='v ~/memo'

alias cmcopy='history | tail -n 2 | head -n 1 | perl -pe "s/^ *\d+ *//g" | pbcopy'

alias takahide="ssh -p 20128 takahide@133.242.179.106"

#wifi
alias wifi='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s'

#this gives better color to the ls command
export LSCOLORS=gxfxcxdxbxegedabagacad

function mvdl() {
  mv ~/Downloads/$1 $2
}

function en() {
  open -a "/Applications/Google Chrome.app" http://eowp.alc.co.jp/search?q=$1
  open -a "/Applications/Google Chrome.app" https://www.google.co.jp/search?q=$1
  open -a "/Applications/Google Chrome.app" "https://www.google.co.jp/search?tbm=isch&q=$1"
}

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/Cellar/vim/7.4.826/bin/:$PATH
export PATH=/usr/local/mysql/bin:~/node_modules/coffee-script/bin:$PATH
export PATH=/Users/TAKAHIDE/.rbenv/shims:$PATH

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#cdでタイポしても自動的に正しいパスに移動してくれる
shopt -s cdspell

#重複するコマンドを履歴に残さない
export HISTCONTROL=ignoreboth:erasedups
#コマンド履歴数を増やす
export HISTFILESIZE=10000
export HISTSIZE=10000



#rails用便利コマンド

function r() {
  cd /Users/TAKAHIDE/3oc/rails/$1
}

function print_root_dir() {
  root_dir=`pwd | sed -e "s/.*rails\/\([^\/]*\)\/.*$/\1/g"`
  rails_dir=`pwd | sed -e "s/\(.*rails\)\/[^\/]*\/.*$/\1/g"`
  
  if [ "`pwd`" != "$root_dir" ]; then
    echo $rails_dir/$root_dir
  else
    pwd
  fi
}

function print_controllers_dir() {
  root_path=`print_root_dir`
  echo $root_path/app/controllers
}

function print_models_dir() {
  root_path=`print_root_dir`
  echo $root_path/app/models
}

function print_views_dir() {
  root_path=`print_root_dir`
  echo $root_path/app/views
}

function print_helpers_dir() {
  root_path=`print_root_dir`
  echo $root_path/app/helpers
}

function print_cs_dir() {
  root_path=`print_root_dir`
  echo $root_path/app/assets/stylesheets
}

function print_js_dir() {
  root_path=`print_root_dir`
  echo $root_path/app/assets/javascripts
}

function cdr() {
  cd `print_root_dir`
}

function ct() {
  vim `print_controllers_dir`/$1
}

function md() {
  vim `print_models_dir`/$1
}

function vw() {
  vim `print_views_dir`/$1/$2
}

function hl() {
  vim `print_helpers_dir`/$1
}

function cs() {
  vim `print_cs_dir`/$1
}

function js() {
  vim `print_js_dir`/$1
}

function rt() {
  vim `print_root_dir`/config/routes.rb
}

function cr() {
  vim `print_root_dir`/lib/tasks/cron.rb
}

function comp_r() {
  COMPREPLY=( $(compgen -W "$(ls '/Users/TAKAHIDE/3oc/rails/')" ) )
}

function comp_ct() {
  COMPREPLY=( $(compgen -W "$(ls $(print_controllers_dir))" $2) )
}

function comp_md() {
  COMPREPLY=( $(compgen -W "$(ls $(print_models_dir))" $2) )
}

function comp_vw() {
  if [ "$3" = "vw" ]; then
    COMPREPLY=( $(compgen -W "$(ls $(print_views_dir))" $2) )
  else
    COMPREPLY=( $(compgen -W "$(ls $(print_views_dir)/$3)" $2) )
  fi
}

function comp_hl() {
  COMPREPLY=( $(compgen -W "$(ls $(print_helpers_dir))" $2) )
}

function comp_cs() {
  COMPREPLY=( $(compgen -W "$(ls $(print_cs_dir))" $2) )
}

function comp_js() {
  COMPREPLY=( $(compgen -W "$(ls $(print_js_dir))" $2) )
}

complete -F comp_r r
complete -F comp_ct ct
complete -F comp_md md
complete -F comp_vw vw
complete -F comp_hl hl 
complete -F comp_cs cs
complete -F comp_js js

function pc() {
  rails r "$1.columns.each { |c| p [ c.name, c.type ] }"
}


alias mg='vim `print_root_dir`/db/migrate/$(ls -t `print_root_dir`/db/migrate | head -1)'

alias sakuraip='echo "133.242.179.106"'
alias screen='ff "vnc://192.168.48.18"'

# ctrl+wでスラッシュ削除できるようにする設定
stty werase undef
bind '\C-w:unix-filename-rubout'

alias gitpush='git add .; git commit -m "something"; git push origin master'

export SECRET_KEY=6e4b220e0c8327eca033b9bff79c91c8
export BASIC_USER=yay
export BASIC_PASS=onisuzume

