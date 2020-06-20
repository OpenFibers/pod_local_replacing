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
➜  Working... and not hard... actually very easy 🙄
➜  Replaced to local ref: DemoFooSDK
➜  diff --git a/DemoMainProject/Podfile b/DemoMainProject/Podfile
➜  index 78b9e7d..d4ed90f 100644
➜  --- a/DemoMainProject/Podfile
➜  +++ b/DemoMainProject/Podfile
➜  @@ -1 +1 @@
➜  -pod 'DemoFooSDK', :git => 'git@gitlab.mydomain.com:FooGroup/DemoFooSDK.git',:branch => 'develop'
➜  +pod 'DemoFooSDK' :path=>'../DemoFooSDK'
```

### Dependency

[Python3](https://www.python.org/download/releases/3.0/)  
git  
strongly recommend [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)  

### Install

Just execute in terminal:  

```bash
bash <(curl -s https://raw.githubusercontent.com/OpenFibers/pod_local_replacing/master/easy_install.sh)
```

If cannot save .bash_profile, manually update after install:  

```bash
sudo ~/.pod_local_replacing/easy_install.sh
```

### How to use plr (pod local replacing)

Make sure your main project folder and sdk folders are at a same path:

```
.
├── DemoBarSDK
│   └── BarFile.m
├── DemoFooSDK
│   └── FooFile.m
├── DemoMainProject
│   └── Podfile
├── README.md
└── ~

```

Then enter main project folder:

```
cd DemoMainProject
```

And call plr:

```
plr DemoFooSDK
➜  Replaced to local ref: DemoFooSDK
```

Also, it's case insensitive:

```
plr demofoosdk
➜  Replaced to local ref: DemoFooSDK
```

You can enter part of sdk name:

```
plr demobar
➜  Replaced to local ref: DemoBarSDK
```

Or same part of sdk names:

```
plr sdk
➜  Replaced to local ref: DemoFooSDK
➜  Replaced to local ref: DemoBarSDK
```

### How to use sac (search in all commits)

Searching keyword 'ABC' in all commits, and codes are few, just run:  

```
sac ABC
```

If there are mega codes, sac will be slow. So save sac result to a file:  

```
sac ABC > ABC_key_search.log
```

And tail in another terminal:  

```
tail -10000f ABC_key_search.log
```

The lastest results will be on top, and the oldest results will be on bottom. Results are like:  

```
commit_number_of_today:file_path:XXXXABCXXXX
commit_number_of_yestoday:file_path:XXXXABCXXXX
...
commit_number_of_jesus_birthday:file_path:XXXXABCXXXX
```  


### Update plr

```
plr_update
```