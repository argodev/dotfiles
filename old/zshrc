if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# aliases

# show list with human-readable sizes
alias ll="ls -lh"

# fix the "doh! forgot sudo" problem
alias please='sudo $(fc -ln -1)'

# globapl protect
alias gpc='globalprotect connect -v vpn.ornl.gov'
alias gpd='globalprotect disconnect'
alias gps='globalprotect show --status'

# setup pandoc and docker
alias pandoc='docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) argodev/pandoc'



source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ru7/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ru7/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ru7/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ru7/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

