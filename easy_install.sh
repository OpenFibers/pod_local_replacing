#!/bin/sh
cd ~
rm -rf '.pod_local_replacing'
git clone https://github.com/OpenFibers/pod_local_replacing.git pod_local_replacing
mv pod_local_replacing .pod_local_replacing
cd -

if grep -q "alias plr='python3 ~/.pod_local_replacing/plr.py'" ~/.zshrc; then
  echo 'zshrc alias exist'
else
  echo "" >> ~/.zshrc
  echo "alias plr='python3 ~/.pod_local_replacing/plr.py'" >> ~/.zshrc
  echo "alias plr_update='bash <(curl -s https://raw.githubusercontent.com/OpenFibers/pod_local_replacing/master/easy_install.sh)'" >> ~/.zshrc
  echo 'zshrc alias has been added'
fi

if grep -q "alias plr='python3 ~/.pod_local_replacing/plr.py'" ~/.bash_profile; then
  echo 'bash_profile alias exist'
else
  echo "" >> ~/.bash_profile
  echo "alias plr='python3 ~/.pod_local_replacing/plr.py'" >> ~/.bash_profile
  echo "alias plr_update='bash <(curl -s https://raw.githubusercontent.com/OpenFibers/pod_local_replacing/master/easy_install.sh)'" >> ~/.bash_profile
  echo 'bash_profile alias has been added'
fi
