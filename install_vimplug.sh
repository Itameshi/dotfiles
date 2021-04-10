#install vim-plug

if [ ! -e ${HOME}/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo 'vim-plugは既にインストールされています．'
fi
