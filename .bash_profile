# fil: .bash_profile
# ver: 1.0
# ack: inspired by Paul Irish's gf3’s Sexy Bash Prompt (shamelessly copied from
# https://github.com/gf3/dotfiles) and “Extravagant Zsh Prompt”
# this ver has been hacked around to shamelessly give it that Paul Irish mood
# in subsequent ver, i will be making some more of my own hacks ...


PATH=$PATH:~/usr/local/bin:~/Data/Scripts:~/Data/Utils/rar:~/_Applications:~/_Applications/lynx:~/opt/local/bin:~/opt/local/sbin

# set title bar to current directory only ...
# PROMPT_COMMAND='echo -ne "\033]0;${PWD##/$HOME/~}\007"'
# PROMPT_COMMAND='echo -ne "\033]0;${PWD##/*/~}\007"'

# alias to quickly show if any Handbrake processes are running
alias hb='sudo ps -aef | grep HandBrakeCLI'
 
# alias for quick DNS cache flushing
alias fc='sudo dscacheutil -flushcache'
 
# enable the git bash completion commands ... using macports
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
# source ~/.git-completion 
 
# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults