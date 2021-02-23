echo "Install latest vim from source."

# as seen here:
# https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source

# update
sudo apt-get update
# remove current version 
# of vim, if installed
sudo apt remove vim vim-runtime gvim vim-*

# prerequries
sudo apt install libncurses5-dev libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python2-dev \
python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git

# clone into current version of vim
# and build it from source
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim82

# use checkinstall to be able 
# to easily uninstall vim
#sudo apt install checkinstall
#sudo checkinstall

# otherwise use make install instead of checkinstall 
sudo make install
