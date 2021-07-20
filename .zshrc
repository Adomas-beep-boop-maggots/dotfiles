#Lines configured by zsh-newuser-install 
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd nobeep extendedglob nomatch notify
bindkey -v
#End of lines configured by zsh-newuser-install
#The following lines were added by compinstall
zstyle :compinstall filename '/home/ade/.zshrc'

export PATH="${PATH}:/home/ade/bin"
export PATH="${PATH}:/home/ade/.local/bin"

autoload -Uz compinit
compinit
#End of lines added by compinstall
autoload -Uz promptinit
promptinit
eval "$(starship init zsh)"

#export MANPAGER="sh -c 'col -bx | bat --theme=Solarized\ \(light\) -l man -p'"
#export MANPAGER=most
#man() {
#  /usr/bin/man $* | \
#    col -b | \
#    vim -R -c 'set ft=man nomod nolist' -
#}


### ARCHIVE EXTRACTION
# usage: ex <file>

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

IFS=$SAVEIFS

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

alias vim='nvim'
alias v='nvim'
alias vim-old='/usr/bin/vim'

alias vc='nvim ~/.config/nvim/init.vim'
alias voc='nvim ~/.vimrc'
alias qtilec="nvim ~/.config/qtile/config.py"
alias zshc="nvim ~/.zshrc"
alias keyc="nvim ~/.config/sxhkd/sxhkdrc"

alias l='less -R'
alias ls='exa --color=always'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias tree='tree -C'

alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -lg --color=always --group-directories-first'  # long format
alias lla='exa -lga --color=always --group-directories-first' # my preferred listing
alias lt='exa -T --color=always --group-directories-first' # tree listing
alias lat='exa -Ta --color=always --group-directories-first' # tree listing
alias llt='exa -lgT --color=always --group-directories-first' # tree listing
alias llat='exa -Tlga --color=always --group-directories-first' # tree listing

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias df='df -h'
alias free='free -m' 

# get error messages from journalctl
alias jctlerr="journalctl -p 3 -xb"

alias sxiv="sxiv -a"

alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
