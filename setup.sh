#!/bin/bash

#############################
##
## (注 作りかけです!!なにかあっても
##     責任は取れないお(^^)
##
#############################

###変数の設定
################
DOT_DIR="${HOME}/dotfiles"


# シンボリックリンクを貼るために削除する
# ファイル，ディレクトリ名を取得
item_names=()
for item_name in `ls -a ${DOT_DIR}`
do
  if [[ ${item_name} =~ ^\..* ]]; then 
    if [[ ${item_name} =~ .git* ]]; then
      continue
    fi
    if [ ${item_name} == "." ] || [ ${item_name} == ".." ]; then
      continue
    fi
    item_names+=(${item_name})
  fi
done

# 削除OKか確認
echo "================================"
for item_name in ${item_names[@]}
do
  echo "${HOME}/${item_name}"
done
echo -e "================================\n"

read -e -p "上記のファイル・ディレクトリが存在していた場合，削除されます．よろしいですか？[y/N]" is_conti

# リンクを貼るために~/の古いファイルがあれば削除
if [ ${is_conti} == 'y' ] || [ ${is_conti} == 'Y' ]; then
  for item_name in ${item_names[@]}
  do
    item_path="${HOME}/${item_name}"
    if [ -e ${item_path} ]; then
      rm -r ${item_path}
    fi
    ln -sfv ${DOT_DIR}/${item_name} ${HOME}
  done
else
  echo "処理を中断しました"
  exit 0 
fi
