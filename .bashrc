#PERSO

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ~='cd ~'
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'

# Easy report
alias ls='ls -Fh --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias l='ls -l'
alias la='ls -lA'
alias lr='ls -R'
alias lf='ls -l | grep "^-"'
alias l.f='ls -ld .* | grep "^-"'
alias ld='ls -l | grep "^d"'
alias l.d='ls -ld .* | grep "^d"'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fdir='find . -type d -name'
alias ff='find . -type f -name'
alias h='history'
alias hgrep='history | grep'
alias lgrep='ls -l | grep'
alias lagrep='ls -lA | grep'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,.tldr,node_modules,Trash,vendor}'
alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -iv'
alias mkdir='mkdir -v'
alias rm='rm -i'
alias rmf='rm -rf'
alias p='ps axo pid,user,pcpu,comm'
alias uptime='uptime -p'
alias free='free -h'
alias disk='df -h | grep sd \
    | sed -e "s_/dev/sda[1-9]_\x1b[34m&\x1b[0m_" \
    | sed -e "s_/dev/sd[b-z][1-9]_\x1b[33m&\x1b[0m_" \
    | sed -e "s_[,0-9]*[MG]_\x1b[36m&\x1b[0m_" \
    | sed -e "s_[0-9]*%_\x1b[32m&\x1b[0m_" \
    | sed -e "s_9[0-9]%_\x1b[31m&\x1b[0m_" \
    | sed -e "s_/mnt/[-_A-Za-z0-9]*_\x1b[34;1m&\x1b[0m_"'
alias alu='apt list --upgradable'
alias preview='fzf --height=50% --layout=reverse --preview="bat --color=always {}"'

# Bookmarks
alias dl='cd ~/Téléchargements && ls -lA'
alias doc='cd ~/Documents && ls -lA'

# Shortcuts
alias c='clear'
#alias cat='bat'
alias ch='echo > ~/.bash_history && echo > ~/.zsh_history'
alias cz='echo > ~/.z'
alias e='exit'
alias htop-user='htop -u "$USER"'
alias incognito='unset HISTFILE'
alias ip-address='curl -s -H "Accept: application/json" https://ipinfo.io/json | jq "del(.loc, .postal)"'
alias mp3-dl='youtube-dl --ignore-config --extract-audio \
    --audio-format "mp3" --audio-quality 0 --embed-thumbnail \
    --add-metadata --metadata-from-title "%(artist)s - %(title)s" \
    --output "$HOME/Downloads/%(title)s.%(ext)s"'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias timer='echo "Timer started. Stop with Ctrl-D." && date "+%a, %d %b %H:%M:%S" && time cat && date "+%a, %d %b %H:%M:%S"'
alias tldr='tldr -t base16'

#Man en couleur

man() {
     env \
     LESS_TERMCAP_mb=$'\E[01;31m' \
     LESS_TERMCAP_md=$'\E[01;38;5;74m' \
     LESS_TERMCAP_me=$'\E[0m' \
     LESS_TERMCAP_se=$'\E[0m' \
     LESS_TERMCAP_so=$'\E[1;44;33m' \
     LESS_TERMCAP_ue=$'\E[0m' \
     LESS_TERMCAP_us=$'\E[04;38;5;146m' \
     man "$@"
}

#Crées un user+mdp sql aléatoirement
alias sql='sudo sh /home/ocb/script/CreateUserMariadb.sh'
