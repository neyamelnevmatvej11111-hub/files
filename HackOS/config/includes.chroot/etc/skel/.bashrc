# HackOS .bashrc
case $- in *i*) ;; *) return;; esac

export PATH="$PATH:/usr/local/bin"
export HISTSIZE=5000
export HISTCONTROL=ignoredups
shopt -s checkwinsize

PS1='\[\e[1;32m\]hackos\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '

alias ll='ls -alh --color=auto'
alias la='ls -A --color=auto'
alias ..='cd ..'
alias ports='ss -tulpn'
alias myip='hackos-net'

# подсказка при первом входе
if [ ! -f "$HOME/.hackos_seen" ]; then
  echo "Подсказка: набери 'hackos' чтобы увидеть все команды."
  touch "$HOME/.hackos_seen"
fi
