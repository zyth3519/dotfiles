NVIM_INIT_DIR=$HOME/.config/nvim
CONFIG_DIR=$HOME/.vim

NVIM_INIT_FILE=$HOME/.config/nvim/init.vim
VIM_INIT_FILE=$HOME/.vimrc
GLOBAL_FILE=$HOME/.vim/global.vim

if [ ! -d $NVIM_INIT_DIR ]; then
  mkdir -p $NVIM_INIT_DIR
fi

if [ ! -d $CONFIG_DIR ]; then
  mkdir -p $CONFIG_DIR
fi

echo "复制文件"
echo .vimrc '>>' $NVIM_INIT_FILE
echo .vimrc '>>' $VIM_INIT_FILE
echo .vim '>>' $CONFIG_DIR

cp .vimrc $NVIM_INIT_FILE
cp .vimrc $VIM_INIT_FILE
cp -r .vim/* $CONFIG_DIR

BASH_CONFIG_FILE=$HOME/.bashrc

# cat .bashrc >> $BASH_CONFIG_FILE

echo ""
echo "安装vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ''
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'