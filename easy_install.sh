#!/bin/sh
cd ~
rm -rf '.pod_local_replacing'
git clone https://github.com/OpenFibers/pod_local_replacing.git pod_local_replacing
mv pod_local_replacing .pod_local_replacing
cd -

if grep -q "alias plr='python3 ~/.pod_local_replacing/plr.py'" ~/.zshrc; then
  echo 'zshrc alias has already been added'
else
  echo "" >> ~/.zshrc
  echo "alias plr='python3 ~/.pod_local_replacing/plr.py'" >> ~/.zshrc
fi

if grep -q "alias plr='python3 ~/.pod_local_replacing/plr.py'" ~/.bash_profile; then
  echo 'bash_profile alias has already been added'
else
  echo "" >> ~/.bash_profile
  echo "alias plr='python3 ~/.pod_local_replacing/plr.py'" >> ~/.bash_profile
fi
