### Demo

Simply replacing lines in Podfile with local reference at the same ../ level.

```
cd DemoMainProject
./plr foo
git --no-pager diff
git checkout .
cd -
```

Output: 

```
Working... and not hard... actually very easy 🙄
Replaced to local ref: foo
diff --git a/DemoMainProject/Podfile b/DemoMainProject/Podfile
index 78b9e7d..d4ed90f 100644
--- a/DemoMainProject/Podfile
+++ b/DemoMainProject/Podfile
@@ -1 +1 @@
-pod 'FooSDK' :git=>'git@gitlab.mydomain.com:group/repo_name.git', :branch =>'develop'
+pod 'FooSDK' :path=>'DemoFooSDK'
```

### Dependency

[Python3](https://www.python.org/download/releases/3.0/)  
git  
strongly recommend [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)  

### Install and Update


```
bash <(curl -s https://raw.githubusercontent.com/OpenFibers/pod_local_replacing/master/easy_install.sh)
```
