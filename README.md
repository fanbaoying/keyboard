# keyboard

### 效果图：
![效果图](http://upload-images.jianshu.io/upload_images/2829694-dd7d49a581088f21.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)

在iOS8之前，iOS系统的输入法只能使用苹果官方提供的输入法。
对于中文来说，官方的输入法并不好用，或者说不够好用，词库，联想，云输入等都没有或者和搜狗输入法，百度输入法等有中国特色的输入法相比有一定的差距。
部分用户因为输入法的原因，选择了安卓等其他系统，或者选择了越狱。
iOS自定义键盘是iOS8系统新推出的功能，允许开发者开发第三方键盘。
众人拾柴火焰高，功能的开放，为iOS用户体验的提示必然带来更大的推动。
[系统默认的键盘](http://www.jianshu.com/p/e1c4d1c296ec)其中有满足要求的数字键盘。

但是为了满足视觉效果更美观，根据具功能需求，写了这个自定义收款键盘。该键盘支持整数最大6位数，小数点后2位数。下面介绍使用方法：

#### 1.获取代码
[源码地址(GitHub)](https://github.com/fanbaoying/keyboard)
去GitHub下载源码，记得点颗星哟！！！

![项目文件截图](http://upload-images.jianshu.io/upload_images/2829694-1bdde547bfcf6aba.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)

将KeyboardView.h、KeyboardView.m文件添加到项目中。
#### 2.KeyboardView的使用
在ViewController中添加下面代码:
```
#import "ViewController.h"

#import "KeyboardView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property(strong,nonatomic)KeyboardView *keyboardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
    
}

- (void)viewWillAppear:(BOOL)animated {

    //使用KeyboardView类
    self.keyboardView = [[KeyboardView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_keyboardView];
    [self.keyboardView showPopView];
    
    [self.keyboardView.myBtn1 addTarget:self action:@selector(myBtn1:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)myBtn1:(UIButton *)sender {

    NSLog(@"点击了收款按钮");
}
```
##### OK，到这里就可以使用自定义的收款键盘了。

#### KeyboardView内部代码详解

1. KeyboardView.h
```
//
//  KeyboardView.h
//  自定义金额键盘
//
//  Created by fby on 2017/9/22.
//  Copyright © 2017年 TextDemo. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface KeyboardView : UIView

//收款按钮，在ViewController中获取点击事件
@property(strong,nonatomic)UIButton *myBtn1;
//如果需要根据输入金额，来限制首款按钮，可使用moneyLab
@property(strong,nonatomic)UILabel *moneyLab;
//视图显示
-(void)showPopView;

@end
```
