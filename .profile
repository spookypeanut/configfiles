export PATH PS1 LD_LIBRARY_PATH
if [[ `uname` == "Linux" ]]; then
    PATH=$HOME/apps/bin:${PATH}
fi
export PATH=$HOME/bin:${PATH}

source ~/.bashrc
