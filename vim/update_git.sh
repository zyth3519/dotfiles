NVIM_INIT_DIR=$HOME/.config/nvim
CONFIG_DIR=$HOME/.vim

NVIM_INIT_FILE=$HOME/.config/nvim/init.vim
VIM_INIT_FILE=$HOME/.vimrc
GLOBAL_FILE=$HOME/.vim/global.vim


rm -rf .vimrc
rm -rf .vim


mkdir .vim
cp -r $HOME/.vim/config .vim
cp $HOME/.vim/global.vim .vim
cp $HOME/.vimrc .
cp $HOME/.vim/coc-settings.json .vim

