export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

alias code='code-insiders'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/aditya/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/aditya/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/aditya/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/adiyta/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function git() {
    if [[ $@ == "tree" ]]; then
        command git log --oneline --decorate --all --graph
    else
        command git "$@"
    fi
}

export PATH="$PATH:/usr/local/bin:/usr/local/bin/protoc:/opt/homebrew/bin:/opt/homebrew/Cellar/protoc-gen-go/1.28.0/bin:/opt/homebrew/Cellar/protoc-gen-go-grpc/1.2.0/bin:/usr/local/mysql/bin"


source ~/.bashrc
