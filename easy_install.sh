#!/bin/sh
cd ~
rm -rf '.pod_local_replacing'
git clone https://github.com/OpenFibers/pod_local_replacing.git pod_local_replacing
mv pod_local_replacing .pod_local_replacing
cd -
echo "" >> ~/.zshrc
echo "alias plr='python3 ~/.pod_local_replacing/plr.py'" >> ~/.zshrc
echo "" >> ~/.bash_profile
echo "alias plr='python3 ~/.pod_local_replacing/plr.py'" >> ~/.bash_profile
