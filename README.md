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


```
sudo bash <(curl -s https://raw.githubusercontent.com/OpenFibers/pod_local_replacing/master/easy_install.sh)
```

### How to use

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

### Update plr

```
plr_update
```