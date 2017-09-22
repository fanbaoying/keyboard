//
//  KeyboardView.m
//  自定义金额键盘
//
//  Created by 范保莹 on 2017/9/22.
//  Copyright © 2017年 TextDemo. All rights reserved.
//

#import "KeyboardView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//小数点后2为
#define MINCOUNT 3

//最大金额
#define MAXMONEY 9

@interface KeyboardView()

@property(strong,nonatomic)UIView *contentView;

@property(strong,nonatomic)UIButton *myBtn;
@property(strong,nonatomic)NSArray *titleArr;

@property(strong,nonatomic)UILabel *reminderLab;

@property(strong,nonatomic)NSString *numberString;

@property(strong,nonatomic)UILabel *moneyLab;

@property(strong,nonatomic)UILabel *lab;

@property(assign,nonatomic)int maxMoney;
@end

@implementation KeyboardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIView *)contentView
{
    if (!_contentView)
    {
        _contentView=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-SCREEN_WIDTH-3, SCREEN_WIDTH, SCREEN_WIDTH+3)];
        _contentView.backgroundColor=[UIColor purpleColor];
    }
    
    return _contentView;
}

-(instancetype)init
{
    if (self=[super init])
    {
        self= [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        
    }
    
    return self;
    
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self=[super initWithFrame:frame])
    {
        
        self.backgroundColor=[UIColor lightTextColor];
        
        [self createPopViewContent];
        
        
    }
    return self;
    
    
}

-(void)createPopViewContent
{
    
    [self addSubview:self.contentView];
    
}

-(void)showPopView
{
    
    [self content];
    
    self.numberString = @"";
    self.maxMoney = 9;
    
    self.reminderLab = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-SCREEN_WIDTH-33, SCREEN_WIDTH-20, 30)];
    self.reminderLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:_reminderLab];
    
    self.moneyLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 70)];
    self.moneyLab.text = @"0.00";
    self.moneyLab.font = [UIFont systemFontOfSize:50.0];
    self.moneyLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_moneyLab];
    
    self.lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, SCREEN_WIDTH-40, 1)];
    self.lab.backgroundColor = [UIColor whiteColor];
    [self addSubview:_lab];
    
}

- (void)content {
    
    self.titleArr = @[@"7",@"8",@"9",@"delete",@"4",@"5",@"6",@"1",@"2",@"3",@"收款",@"0",@"."];
    
    for (int i = 0; i < _titleArr.count; i ++) {
        
        if (i >= 0 && i < 4) {
            int count1 = (SCREEN_WIDTH-3)*i/4+i;
            
            if (i == 3) {
                self.myBtn = [[UIButton alloc]initWithFrame:CGRectMake(count1, 0, (SCREEN_WIDTH-3)/4, SCREEN_WIDTH/2+1)];
                self.myBtn.backgroundColor = [UIColor whiteColor];
                [self.myBtn setTitleColor:[UIColor blackColor] forState:0];
                self.myBtn.tag = 6000+i;
                [self.myBtn setImage:[UIImage imageNamed:_titleArr[i]] forState:0];
                [self.myBtn addTarget:self action:@selector(myBtn:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:_myBtn];
            }else {
                self.myBtn = [[UIButton alloc]initWithFrame:CGRectMake(count1, 0, (SCREEN_WIDTH-3)/4, SCREEN_WIDTH/4)];
                self.myBtn.backgroundColor = [UIColor whiteColor];
                [self.myBtn setTitleColor:[UIColor blackColor] forState:0];
                self.myBtn.titleLabel.font = [UIFont systemFontOfSize:30.0];
                self.myBtn.tag = 6000+i;
                [self.myBtn setTitle:_titleArr[i] forState:0];
                [self.myBtn addTarget:self action:@selector(myBtn:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:_myBtn];
            }
        }else if (i >= 4 && i < 7) {
            int count2 = (SCREEN_WIDTH-3)*(i-4)/4+(i-4);
            
            self.myBtn = [[UIButton alloc]initWithFrame:CGRectMake(count2, SCREEN_WIDTH/4+1, (SCREEN_WIDTH-3)/4, SCREEN_WIDTH/4)];
            self.myBtn.backgroundColor = [UIColor whiteColor];
            [self.myBtn setTitleColor:[UIColor blackColor] forState:0];
            self.myBtn.titleLabel.font = [UIFont systemFontOfSize:30.0];
            self.myBtn.tag = 6000+i;
            [self.myBtn setTitle:_titleArr[i] forState:0];
            [self.myBtn addTarget:self action:@selector(myBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:_myBtn];
            
            
        }else if (i >= 7 && i < 11) {
            int count3 = (SCREEN_WIDTH-3)*(i-7)/4+(i-7);
            
            if (i == 10) {
                self.myBtn = [[UIButton alloc]initWithFrame:CGRectMake(count3, SCREEN_WIDTH/2+2, (SCREEN_WIDTH-3)/4, SCREEN_WIDTH/2+1)];
                self.myBtn.backgroundColor = [UIColor whiteColor];
                [self.myBtn setTitleColor:[UIColor blackColor] forState:0];
                self.myBtn.titleLabel.font = [UIFont systemFontOfSize:30.0];
                self.myBtn.tag = 6000+i;
                [self.myBtn setTitle:_titleArr[i] forState:0];
                [self.myBtn addTarget:self action:@selector(myBtn:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:_myBtn];
                
            }else {
                
                self.myBtn = [[UIButton alloc]initWithFrame:CGRectMake(count3, SCREEN_WIDTH/2+2, (SCREEN_WIDTH-3)/4, SCREEN_WIDTH/4)];
                self.myBtn.backgroundColor = [UIColor whiteColor];
                [self.myBtn setTitleColor:[UIColor blackColor] forState:0];
                self.myBtn.titleLabel.font = [UIFont systemFontOfSize:30.0];
                self.myBtn.tag = 6000+i;
                [self.myBtn setTitle:_titleArr[i] forState:0];
                [self.myBtn addTarget:self action:@selector(myBtn:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:_myBtn];
            }
            
        }else if (i >= 11 && i < 13) {
            int count3 = (SCREEN_WIDTH-3)*(i-10)/4+(i-10);
            
            if (i == 11) {
                self.myBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*3/4+3, (SCREEN_WIDTH-3)*2/4+1, SCREEN_WIDTH/4)];
                self.myBtn.backgroundColor = [UIColor whiteColor];
                [self.myBtn setTitleColor:[UIColor blackColor] forState:0];
                self.myBtn.titleLabel.font = [UIFont systemFontOfSize:30.0];
                self.myBtn.tag = 6000+i;
                [self.myBtn setTitle:_titleArr[i] forState:0];
                [self.myBtn addTarget:self action:@selector(myBtn:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:_myBtn];
            }else {
                
                self.myBtn = [[UIButton alloc]initWithFrame:CGRectMake(count3, SCREEN_WIDTH*3/4+3, (SCREEN_WIDTH-3)/4, SCREEN_WIDTH/4)];
                self.myBtn.backgroundColor = [UIColor whiteColor];
                [self.myBtn setTitleColor:[UIColor blackColor] forState:0];
                self.myBtn.titleLabel.font = [UIFont systemFontOfSize:30.0];
                self.myBtn.tag = 6000+i;
                [self.myBtn setTitle:_titleArr[i] forState:0];
                [self.myBtn addTarget:self action:@selector(myBtn:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:_myBtn];
            }
            
        }
        
        
    }
    
    
    
}

- (void)myBtn:(UIButton *)sender {
    
    if ([_numberString isEqualToString:[NSString stringWithFormat:@""]]) {
        
        if (sender.tag == 6000) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"7"];
        }else if (sender.tag == 6001) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"8"];
        }else if (sender.tag == 6002) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"9"];
        }else if (sender.tag == 6003) {
            self.numberString = [NSString stringWithFormat:@""];
            self.moneyLab.text = [NSString stringWithFormat:@"0.00"];
        }else if (sender.tag == 6004) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"4"];
        }else if (sender.tag == 6005) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"5"];
        }else if (sender.tag == 6006) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"6"];
        }else if (sender.tag == 6007) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"1"];
        }else if (sender.tag == 6008) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"2"];
        }else if (sender.tag == 6009) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"3"];
        }else if (sender.tag == 6010) {
            
        }else if (sender.tag == 6011) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"0"];
        }else if (sender.tag == 6012) {
            self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"0."];
        }
        
    }else{
        
        if (self.moneyLab.text.length < _maxMoney) {
            if (sender.tag == 6000) {
                
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"7"];
                        break;
                    }
                }
            }else if (sender.tag == 6001) {
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"8"];
                        break;
                    }
                }
            }else if (sender.tag == 6002) {
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"9"];
                        break;
                    }
                }
            }else if (sender.tag == 6003) {
                
                if (_numberString.length > 0) {
                    self.numberString = [_numberString substringToIndex:_numberString.length-1];
                    if (_numberString.length == 0) {
                        self.moneyLab.text = [NSString stringWithFormat:@"0.00"];
                    }
                }
            }else if (sender.tag == 6004) {
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"4"];
                        break;
                    }
                }
            }else if (sender.tag == 6005) {
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"5"];
                        break;
                    }
                }
            }else if (sender.tag == 6006) {
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"6"];
                        break;
                    }
                }
            }else if (sender.tag == 6007) {
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"1"];
                        break;
                    }
                }
            }else if (sender.tag == 6008) {
                
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"2"];
                        break;
                    }
                }
                
            }else if (sender.tag == 6009) {
                
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"3"];
                        break;
                    }
                }
                
            }else if (sender.tag == 6010) {
                
                
                
            }else if (sender.tag == 6011) {
                
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
                        NSLog(@"string is %@",minNumber);
                        if (minNumber.length >= MINCOUNT) {
                            break;
                        }
                        
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"0"];
                        break;
                    }
                }
                
            }else if (sender.tag == 6012) {
                
                for (int i = 0; i < _numberString.length; i ++) {
                    //截取字符串中的每一个字符
                    NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
                    NSLog(@"string is %@",s);
                    if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
                        break;
                    }
                    if (i == _numberString.length-1) {
                        self.numberString = [NSString stringWithFormat:@"%@%@",_numberString,@"."];
                        break;
                    }
                }
            }
        }else {
            
            if (sender.tag == 6003) {
                
                if (_numberString.length > 0) {
                    self.numberString = [_numberString substringToIndex:_numberString.length-1];
                    if (_numberString.length == 0) {
                        self.moneyLab.text = [NSString stringWithFormat:@"0.00"];
                    }
                }
            }
        }
        
        
    }
    
    
    
    self.reminderLab.text = [NSString stringWithFormat:@"%@",_numberString];
    NSLog(@"%@",_numberString);
    
    for (int i = 0; i < _numberString.length; i ++) {
        //截取字符串中的每一个字符
        NSString *s = [_numberString substringWithRange:NSMakeRange(i, 1)];
//        NSLog(@"%@",s);
        if ([s isEqualToString:[NSString stringWithFormat:@"."]]) {
            NSString *minNumber = [_numberString substringWithRange:NSMakeRange(i, _numberString.length-i)];
//            NSLog(@"%@",minNumber);
            if (minNumber.length >= MINCOUNT) {
                self.moneyLab.text = [NSString stringWithFormat:@"%@",_numberString];
                self.maxMoney = 9;
                break;
            }else if (minNumber.length >= MINCOUNT-1) {
                
                self.moneyLab.text = [NSString stringWithFormat:@"%@0",_numberString];
                break;
            }else if (minNumber.length >= MINCOUNT-2) {
                
                self.moneyLab.text = [NSString stringWithFormat:@"%@00",_numberString];
                break;
            }
            
        }
        if (i == _numberString.length-1) {
            self.moneyLab.text = [NSString stringWithFormat:@"%@.00",_numberString];
            break;
        }
        
    }

    
}



@end
