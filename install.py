#!/usr/bin/python3
import os

print("安装软件")
os.system("sudo pacman -S --need neovim git nodejs npm xclip python-pip yarn git proxychains-ng nerd-fonts-complete powerline powerline-fonts lazygit")

print("配置代理")
os.system("sudo nvim /etc/proxychains.conf")

print("配置镜像源")
os.system("npm config set registry https://registry.npm.taobao.org")
os.system("yarn config set registry https://registry.npm.taobao.org/")
os.system("pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple")

print("安装依赖")
os.system("pip3 install --user pynvim")
os.system("sudo npm install -g js-beautify")


print("安装Plug-vim")
os.system("proxychains sh -c 'curl -fLo '${XDG_DATA_HOME:-$HOME/.local/share}'/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'")

print("复制配置")
os.system("cp ./init.vim ~/.config/nvim/init.vim")
os.system("cp ./.vim/coc-settings.json ~/.config/nvim/coc-settings.json")
os.system("cp -rf ./.vim ~/")

print("安装vim插件")
os.system("proxychains nvim -S ./install/plug.vim")

print("安装coc插件")
os.system("nvim -S ./install/coc.vim")

print("安装高亮")
os.system("proxychains nvim -S ./install/treesitter.vim")
