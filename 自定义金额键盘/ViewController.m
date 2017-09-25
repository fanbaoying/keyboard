//
//  ViewController.m
//  自定义金额键盘
//
//  Created by 范保莹 on 2017/9/19.
//  Copyright © 2017年 TextDemo. All rights reserved.
//

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
    
    self.keyboardView = [[KeyboardView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_keyboardView];
    [self.keyboardView showPopView];
    
    [self.keyboardView.myBtn1 addTarget:self action:@selector(myBtn1:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)myBtn1:(UIButton *)sender {

    NSLog(@"点击了收款按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
