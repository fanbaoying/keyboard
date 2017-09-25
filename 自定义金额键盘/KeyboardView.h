//
//  KeyboardView.h
//  自定义金额键盘
//
//  Created by 范保莹 on 2017/9/22.
//  Copyright © 2017年 TextDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardView : UIView

@property(strong,nonatomic)UIButton *myBtn1;
@property(strong,nonatomic)UILabel *moneyLab;

-(void)showPopView;

@end
