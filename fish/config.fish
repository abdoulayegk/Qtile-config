# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

#
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line
# https://fishshell.com
# cSpell:words ajeetdsouza cppflags ldflags pkgconfig pnpm nvim Nord gopath nvimpager ripgreprc ripgrep zoxide joshmedeski sharkdp neovim lucc


# neofetch
# To get ride of the greeting message of fish
set -Ux fish_greeting # disable fish greeting

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###


function fish_greeting
    echo ""
    # echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end


set TERM "xterm-256color"                         # Sets the terminal type
# ~/.config/fish/config.fish

starship init fish | source


# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB


# ~/.config/fish/config.fish


starship init fish | source # https://starship.rs/
zoxide init fish | source # 'ajeetdsouza/zoxide'

set -Ux BAT_THEME Nord # 'sharkdp/bat' cat clone 
set -Ux EDITOR nvim # 'neovim/neovim' text editor 
set -Ux fish_greeting # disable fish greeting
set -U FZF_DEFAULT_COMMAND "fd -H -E '.git'"
# set -Ux GOPATH (go env GOPATH) # https://golang.google.cn/
# set -Ux KIT_EDITOR /opt/homebrew/bin/nvim # https://www.scriptkit.com/
set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8
set -Ux NODE_PATH "~/.nvm/versions/node/v16.19.0/bin/node" # 'nvm-sh/nvm'
set -Ux PAGER ~/.local/bin/nvimpager # 'lucc/nvimpager'
set -Ux VISUAL nvim

set -Ux FZF_DEFAULT_OPTS "--reverse \
--border rounded \
--no-info \
--pointer='' \
--marker=' ' \
--ansi \
--color='16,bg+:-1,gutter:-1,prompt:4,pointer:5,marker:6'"

set -Ux FZF_TMUX_OPTS "-p \
--reverse \
--border rounded \
--no-info \
--pointer='' \
--marker=' ' \
--ansi \
--color='16,bg+:-1,gutter:-1,prompt:4,pointer:5,marker:6'"

set -Ux FZF_CTRL_R_OPTS "--border-label=' history ' \
--header='ctrl-d: delete' \
--prompt='  '"

# ordered by priority - bottom up
# fish_add_path /opt/homebrew/bin # https://brew.sh/
# fish_add_path /opt/homebrew/sbin
# fish_add_path /opt/homebrew/opt/sqlite/bin
# fish_add_path /opt/homebrew/opt/openjdk/bi
fish_add_path $GOPATH/bin
fish_add_path $PNPM_HOME
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/tmux/plugins/tmux-nvr/bin
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.config/bin # my custom scripts

set EDITOR neovim

alias vim='nvim'

#Pacman Shortcuts
alias sync="sudo pacman -Syyy"
alias install="sudo pacman -S"
alias update="sudo pacman -Syyu"
alias search="sudo pacman -Ss"
alias search-local="sudo pacman -Qs"
alias pkg-info="sudo pacman -Qi"
alias local-install="sudo pacman -U"
alias clr-cache="sudo pacman -Scc"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias remove="sudo pacman -R"
alias autoremove="sudo pacman -Rns"
alias clearnup="sudo pacman -Rns $(pacman -Qtdq)"


alias dotc='cd ~/.config'
alias dots='cd ~/.config/sxhkd'
alias kt='vim ~/.config/kitty/kitty.conf'
alias dotn='cd ~/.config/nvim/'

alias jnb="jupyter notebook"
alias jl="jupyter lab"
alias ca="conda activate"
alias da="conda deactivate"
alias torch="conda activate torch"
alias envs="conda info --envs"


alias mp='makepkg -si'
alias sv='sudo nvim'
alias v='nvim'
alias orph="sudo pacman -Rns $(pacman -Qtdq)"

# tty-clock on terminal
alias cl='tty-clock'


alias rm='rm -rf'
[ -f ~/.fzf.fish ] && source ~/.fzf.fish

# export PATH="$HOME/.local/bin/:$PATH"
alias pr='paru -S'

alias wifi='/usr/local/bin/rofi-wifi-menu/rofi-wifi-menu.sh'

# git
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

# direcotry
alias demo='cd ~/Desktop/Demo'
alias zindi='cd ~/Desktop/Python/Zindi'


# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# ~/.tmux/plugins
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
# ~/.config/tmux/plugins
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin

# Anaconda

 set -U fish_user_paths "$HOME/miniconda3/bin" $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/balde/miniconda3/bin/conda
    eval /home/balde/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
set -Ux PAGER ~/.local/bin/nvimpager # 'lucc/nvimpager'


## Starship prompt
if status --is-interactive
   source ("/usr/bin/starship" init fish --print-full-init | psub)
end

alias za='zathura'
alias yy='yazi'

alias pu='paru -Sua'
