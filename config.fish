set fish_greeting
export EDITOR=nvim
alias py=python
alias cal='cal -m'
alias vim=nvim
alias vimdiff='nvim -d'
alias icat='kitty +kitten icat'
alias vimcfg='vim ~/.vim/init.vim'
alias l='exa'
alias la='exa -la'
alias ll='exa -l'
alias lt='exa -T'
alias lat='exa -aT'
alias wget='wget -c'
alias mkdir='mkdir -pv'
alias opus2ogg='find . -name "*.opus" -exec rename .opus .ogg {} +'

starship init fish | source
