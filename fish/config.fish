set fish_greeting
export EDITOR=nvim
alias py=python
alias cal='cal -m'
alias vim=nvim
alias vimdiff='nvim -d'
alias icat='kitty +kitten icat'
alias vimcfg='vim ~/.vim/init.vim'
alias l='exa --group-directories-first --icons'
alias la='exa -la --group-directories-first --icons'
alias ll='exa -l --group-directories-first --icons'
alias lt='exa -T --icons'
alias lat='exa -aT --icons'
alias wget='wget -c'
alias mkdir='mkdir -pv'
alias opus2ogg='find . -name "*.opus" -exec rename .opus .ogg {} +'
alias vim.='vim (fzf)'
alias feh='feh -.'
export DOTNET_CLI_TELEMETRY_OPTOUT=1
starship init fish | source
