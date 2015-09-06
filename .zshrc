# Path to your oh-my-zsh installation.
export ZSH=/Users/takahide/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby osx bundler brew rails emoji-clock)

# User configuration


export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"
export CC=/usr/bin/gcc

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
fpath=(/usr/local/share/zsh-completions $fpath)




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

function c() {
  vim `print_controllers_dir`/$1
}

function m() {
  vim `print_models_dir`/$1
}

function v() {
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
  compadd $(ls "$HOME/3oc/rails/")
}

function comp_c() {
  compadd $(ls $(print_controllers_dir))
}

function comp_m() {
  compadd $(ls $(print_models_dir))
}

function comp_v() {
  if [ "$CURRENT" = "2" ]; then
    compadd $(ls $(print_views_dir))
  else
    compadd $(ls $(print_views_dir)/${words[2]})
    
  fi
}

function comp_hl() {
  compadd $(ls $(print_helpers_dir))
}

function comp_cs() {
  compadd $(ls $(print_cs_dir))
}

function comp_js() {
  compadd $(ls $(print_js_dir))
}

compdef comp_r r
compdef comp_c c
compdef comp_m m
compdef comp_v v
compdef comp_hl hl 
compdef comp_cs cs
compdef comp_js js

function pc() {
  rails r "$1.columns.each { |c| p [ c.name, c.type ] }"
}


alias mg='vim `print_root_dir`/db/migrate/$(ls -t `print_root_dir`/db/migrate | head -1)'

alias sakuraip='echo "133.242.179.106"'
alias gitpush='git add .; git commit -m "something"; git push origin master'

export SECRET_KEY=6e4b220e0c8327eca033b9bff79c91c8
export BASIC_USER=yay
export BASIC_PASS=onisuzume

