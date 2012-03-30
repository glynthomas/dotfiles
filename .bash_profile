# fil: .bash_profile
# ver: 1.1
# cha: removed extraneous items.
# ack: inspired by gf3’s sexy bash prompt and “Extravagant Zsh Prompt”
# shamelessly ;-) copied from https://github.com/glynology/dotfiles


PATH=$PATH:~/usr/local/bin:~/Data/Scripts:~/Data/Utils/rar:~/_Applications:~/_Applications/lynx:~/opt/local/bin:~/opt/local/sbin


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