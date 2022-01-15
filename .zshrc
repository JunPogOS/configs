# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

PROMPT='%(?.%F{green}%n.%F{red}Oof)%f %B%F{240}%1~%f%b %# '


# Git 
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Change cursor based on vi mode (from luke smith)
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

source $HOME/.config/zsh/alias
source $HOME/.config/zsh/programs

export _JAVA_AWT_WM_NONREPARENTING=1 # Fixes java applications
export PATH="$PATH:$HOME/.local/bin"

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY

# Extension specific defaults
alias -s mkv="mpv"
alias -s txt="$EDITOR"
alias -s flac="mpv"
alias -s mp3="mpv"
alias -s sh="bash"
alias -s c="$EDITOR"
alias -s py="python3"
alias -s png="feh"
alias -s jpg="feh"
alias -s gif="feh"
alias -s html="$BROWSER"
