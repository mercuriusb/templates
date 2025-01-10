export ZSH=~/.zsh

autoload -U compinit; compinit
source $ZSH/fzf-tab/fzf-tab.plugin.zsh
source $ZSH/agnoster/agnoster.zsh-theme

alias ll='ls -la'
alias la='ls -A'
alias l='ls -l'

alias sshcopyid='ssh-copy-id -i ~/.ssh/id_rsa.pub '
alias less='bat --style="plain"'
alias bat='bat --style="plain"'
alias vi='vim'

alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"

alias dcup='docker compose up'
alias dcupd='docker compose up -d'
alias dcps='docker compose ps'
alias dclog='docker compose logs'
alias dctail='docker compose logs -f'
alias dcstatus='docker compose status'


export TERM=xterm-256color
export BAT_THEME="Monokai Extended"

