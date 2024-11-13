#!/bin/bash

echo "install william's IDE"

work_path=$(dirname $(readlink -f $0))
# sudo yum update &&
# sudo yum upgrade &&
# ############# vim config
# install vim requirements
echo "config vim"
pip install yapf && 
if [[ -d ~/.vim/bundle/vundle ]]; then
    rm -rf ~/.vim/bundle/vundle
fi
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle &&
cp ./.vimrc ~/.vimrc &&
# install vim bundle
vim +PluginInstall +qall &&
# install ycm
cd ~/.vim/bundle/YouCompleteMe &&
python install.py

# ############# tmux config
echo "config tmux"
cd $work_path &&
cp .tmux.conf ~/.tmux.conf &&
echo "alias tmux='tmux -2'" >> ~/.bashrc &&
source ~/.bashrc &&
mkdir -p ~/.tmux/plugins &&
if [[ -d ~/.tmux/plugins/tpm ]]; then
    rm -rf ~/.tmux/plugins/tpm
fi
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm &&
echo "success"

# requirements
# cmake
# pip
# git
