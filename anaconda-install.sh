#!/bin/sh

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
#source ~/.bashrc
pyenv install anaconda-2.1.0
pyenv rehash
pyenv global anaconda-2.1.0
export PATH="$PYENV_ROOT/versions/anaconda-2.1.0/bin/:$PATH"
echo 'export PATH="$PYENV_ROOT/versions/anaconda-2.1.0/bin/:$PATH"' >> ~/.bashrc
#source ~/.bashrc
conda update conda
