# TODO: install anyenv
if [ ! -d ${HOME}/.anyenv ]; then 
  git clone https://github.com/anyenv/anyenv ~/.anyenv
  echo 'export PATH="${HOME}/.anyenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval"$(anyenv init -)"' >> ~/.bashrc
  #exec ${SHELL} -l
  source ${HOME}/.bashrc
  anyenv install --init
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
else
  echo "~/.anyenv が存在していたためインストールは実行されませんでした．"
fi

