#!/bin/sh

echo "install william's IDE"

sudo apt-get update &&
sudo apt-get upgrade &&

# ############# vim config
# install vim requirements
echo "config vim"
sudo apt-get install ctags && 
pip install yapf && 
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle &&
cp ./.vimrc ~/.vimrc &&
# install vim bundle
vim +PluginInstall +qall &&
# install ycm
cd ~/.vim/bundle/YouCompleteMe &&
install.sh --clang-completer  

# ############# tmux config
echo "config tmux"
sudo apt-get install tmux &&
cp ./.tmux.conf ~/.tmux.conf &&
echo "alias tmux='tmux -2'" >> ~/.bashrc &&
source ~/.bashrc &&
mkdir -p ~/.tmux/plugins &&
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm &&
echo ""

# requirements
# cmake
# pip
# git
