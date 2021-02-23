#!/bin/bash

echo "Install .vimrc"

echo "Install vim."
sudo apt install vim vim-youcompleteme
vam install youcompleteme
# if apt is not desired prefere
# to uncommit the latter instead
#echo "Install latest vim."
#./install_vim_from_source.sh


echo "Install vim-plug package manager."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc $HOME -i

echo "Launch vim-plug install script after Plug setup by vimrc"
vim -u .vimrc -c "PlugInstall"

#echo "Install youcompleteme"
#cd ~/.vim/plugged/YouCompleteMe
#git submodule update --init --recursive
#python3 install.py --all

wget https://raw.githubusercontent.com/ycm-core/ycmd/master/.ycm_extra_conf.py -O cpp.ycm_extra_conf.py
wget https://raw.githubusercontent.com/ycm-core/YouCompleteMe/master/.ycm_extra_conf.py -O python.ycm_extra_conf.py
cp cpp.ycm_extra_conf.py ~/.ycm_extra_conf.py -i
