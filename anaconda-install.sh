#!/bin/sh

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
#source ~/.bashrc
pyenv install anaconda3-4.1.1
pyenv rehash
pyenv global anaconda3-4.1.1
export PATH="$PYENV_ROOT/versions/anaconda3-4.1.1/bin/:$PATH"
echo 'export PATH="$PYENV_ROOT/versions/anaconda3-4.1.1/bin/:$PATH"' >> ~/.bashrc
#source ~/.bashrc
conda update conda
