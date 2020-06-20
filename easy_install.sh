#!/bin/sh

if [ ! -x ~/.pod_local_replacing ]; then
  echo "clone plr into local repo..."
  git clone https://github.com/OpenFibers/pod_local_replacing.git pod_local_replacing
  mv pod_local_replacing .pod_local_replacing
fi

echo "update plr local repo..."
cd ~/.pod_local_replacing || exit
git pull
cd - || exit

add_alias_for_file(){
  adding_alias=$1
  file_path=$2
  echo "adding $adding_alias to $file_path"

  if grep -q "$adding_alias" "$file_path"; then
    echo "$file_path $adding_alias exist'"
  else
    echo "" >> "$file_path"
    echo "$adding_alias" >> "$file_path"
    echo "$adding_alias has been added to $file_path"
  fi
}

add_alias_for_file "alias plr='python3 ~/.pod_local_replacing/plr.py'" ~/.zshrc
add_alias_for_file "alias plr_update='bash <(curl -s https://raw.githubusercontent.com/OpenFibers/pod_local_replacing/master/easy_install.sh)'" ~/.zshrc
add_alias_for_file "alias plr='python3 ~/.pod_local_replacing/plr.py'" ~/.bash_profile
add_alias_for_file "alias plr_update='bash <(curl -s https://raw.githubusercontent.com/OpenFibers/pod_local_replacing/master/easy_install.sh)'" ~/.bash_profile
