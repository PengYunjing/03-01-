//  PYJCalculatorViewController.m
//  计算器
//
//  Created by Apple on 16/4/30.
//  Copyright © 2016年 PYJ. All rights reserved.

/*
 功能:所有运算符均可混合连算
 */


#import "PYJCalculatorViewController.h"

@interface PYJCalculatorViewController ()

@property (weak, nonatomic) UILabel *showLabel;
@property (strong, nonatomic) NSMutableString *string;
@property (assign, nonatomic) double num1, num2;
@property (strong, nonatomic) NSString *str;
@property (weak, nonatomic) UIView *swipeView;
@property (strong, nonatomic) UIButton *selectedBtn;

@end

@implementation PYJCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat windowW = [UIScreen mainScreen].bounds.size.width;
    CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
    
    // 创建一个View用来存放手势
    UIView *swipeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, windowW, windowH * 2 / 7)];
    _swipeView = swipeView;
    [self.view addSubview:_swipeView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // 设置显示框
    CGFloat disLabelX = 5 ;
    CGFloat disLabelY = windowH / 7 ;
    CGFloat disLabelW = windowW - 2 * disLabelX;
    CGFloat disLabelH = disLabelY ;
    UILabel *disLabel = [[UILabel alloc] initWithFrame:CGRectMake(disLabelX - 5, disLabelY,disLabelW, disLabelH)];
    disLabel.textAlignment = NSTextAlignmentRight;
    disLabel.font = [UIFont systemFontOfSize:windowH / 8];
    disLabel.textColor = [UIColor whiteColor];
    disLabel.text = @"0";
    [disLabel setNumberOfLines:0];
    disLabel.adjustsFontSizeToFitWidth = YES; // 一行显示不下，若设置此属性为YES，则会降低字体大小，以显示全部内容。
    
    _showLabel = disLabel;
    [self.view addSubview:disLabel];
    
    // 创建按钮
    CGFloat btnW = windowW / 4;
    CGFloat btnH = windowH / 7;
    
    for (int i = 0; i < 20; i++) {
        
        NSInteger row = i / 4;
        NSInteger column = i % 4;
        CGFloat btnX = column * btnW;
        CGFloat btnY = row * btnH +  windowH * 2 / 7;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, btnY + 10, btnW, btnH);
        
        btn.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        [btn setBackgroundImage:[UIImage imageNamed:@"highlighted"] forState:UIControlStateHighlighted];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:40]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        [self.view addSubview:btn];

        if (i == 0) {
            [btn setTitle:@"C" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
            [btn setBackgroundImage:[UIImage imageNamed:@"highlighted02"] forState:UIControlStateHighlighted];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:30]];
            [btn addTarget:self action:@selector(clean) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 1) {
            [btn setTitle:@"±" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
            [btn setBackgroundImage:[UIImage imageNamed:@"highlighted02"] forState:UIControlStateHighlighted];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:40]];
            [btn addTarget:self action:@selector(zhengfu:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 2) {
            [btn setTitle:@"%" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
            [btn setBackgroundImage:[UIImage imageNamed:@"highlighted02"] forState:UIControlStateHighlighted];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:30]];
            [btn addTarget:self action:@selector(computer:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 3) {
            [btn setTitle:@"÷" forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_background"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_highlighted"] forState:UIControlStateHighlighted];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:45]];
            [btn addTarget:self action:@selector(computer:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 4) {
            [btn setTitle:@"7" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 5) {
            [btn setTitle:@"8" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 6) {
            [btn setTitle:@"9" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 7) {
            [btn setTitle:@"×" forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_background"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_highlighted"] forState:UIControlStateHighlighted];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:45]];
            [btn addTarget:self action:@selector(computer:) forControlEvents:UIControlEventTouchUpInside];            
            
        } else if (i == 8) {
            [btn setTitle:@"4" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 9) {
            [btn setTitle:@"5" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 10) {
            [btn setTitle:@"6" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 11) {
            [btn setTitle:@"−" forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_background"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_highlighted"] forState:UIControlStateHighlighted];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:45]];
            [btn addTarget:self action:@selector(computer:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 12) {
            [btn setTitle:@"1" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];

        } else if (i == 13) {
            [btn setTitle:@"2" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
        
        } else if (i == 14) {
            [btn setTitle:@"3" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 15) {
            [btn setTitle:@"+" forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_background"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_highlighted"] forState:UIControlStateHighlighted];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:45]];
            [btn addTarget:self action:@selector(computer:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 16) {
            [btn setTitle:@"0" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 17) {
            [btn setImage:[UIImage imageNamed:@"arrow_thick_thin_down"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 18) {
            [btn setTitle:@"." forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(input:) forControlEvents:UIControlEventTouchUpInside];
            
        } else if (i == 19) {
            [btn setTitle:@"=" forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_background"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"orange_highlighted"] forState:UIControlStateHighlighted];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:45]];
            [btn addTarget:self action:@selector(computer:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        }
    
        _string = [NSMutableString string]; //初始化可变字符串，分配内存
    
        _str = [[NSString alloc] init];
    
    // 创建一个轻扫手势，左右轻扫为撤销输入
    [self setUpSwipe];
    
}

- (void)zhengfu:(id)sender{ // 如果输入的是@"±"

    if (_num1 == 0) {
        return;
    }
    
    if ([_str isEqualToString:@"%"]) {
        _num2 = _num1;
        _str = @"";
        [_string setString:@""]; //字符串清零
    }
    
    if ([_str isEqualToString:@"="]) {
        _num1 = -_num2;
        _num2 = _num1;
        _showLabel.text = [self changeFloat:[NSString stringWithFormat:@"%f", _num1]]; // 调用方法去掉小数点后多余的0
        [_string setString:[NSString stringWithFormat:@"%f", _num1]]; // 如果上次按了@"±"，再次按下@"±"时，则再取反，可以反复按@"±"
    }
    
    else
    {
        _num1 =  - _num1;
        _showLabel.text = [self changeFloat:[NSString stringWithFormat:@"%f", _num1]]; // 调用方法去掉小数点后多余的0
        
        [_string setString:[NSString stringWithFormat:@"%f", _num1]]; // 如果上次按了@"±"，再次按下@"±"时，则再取反，可以反复按@"±"
        
        NSInteger len = _string.length - 7;
        NSString *tempString = [_string substringWithRange:NSMakeRange(0, len)];
        [_string setString:tempString];
    }
}

- (void)input:(id)sender{
    
    if ([[sender currentTitle] isEqualToString:@"."])
    {
        if ([_string rangeOfString:@"."].location != NSNotFound){ //判断_string 是否已经含有@"."
            return;
        }else if ([_string isEqualToString:@""]) {
            [_string setString:@"0"];
        }
        if ([_str isEqualToString:@"="])
        {
            _num1 = 0;
            _num2 = 0;
        }

    }
    if ([[sender currentTitle] isEqualToString:@"0"])
    {
        if ([_showLabel.text isEqualToString:@"0"]){
            return;
        }

    }

    // 拼接连续输入的数值
    [_string appendString:[sender currentTitle]];
    _showLabel.text = [NSString stringWithString:_string];
    _num1 = [_showLabel.text doubleValue];
    
    if ([_str isEqualToString:@"="]) {
        _num2 = _num1;
    }
    
}

- (void)computer:(UIButton *)sender{
    self.selectedBtn.selected = NO;
    if ([[sender currentTitle] isEqualToString:@"+"] || [[sender currentTitle] isEqualToString:@"−"] || [[sender currentTitle] isEqualToString:@"×"] || [[sender currentTitle] isEqualToString:@"÷"]) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"orange_selected"] forState:UIControlStateSelected];
        sender.selected = YES;
        self.selectedBtn = sender;
    }

    if ([_str isEqualToString:@""]) //当str里为空
    {
        _num2 = _num1;
        _str = [sender currentTitle]; //保存运算符
        [_string setString:@""]; //字符串清零
    }
    else
    {
        [self calculation];
        
        _str = [sender currentTitle]; // 保存运算符
        [_string setString:@""]; //字符串清零
        if (isnan(_num2) || (isinf(_num2))) {
            _showLabel.text = @"错误";
        }else{
            _showLabel.text = [self changeFloat:[NSString stringWithFormat:@"%f", _num2]]; // 调用方法去掉小数点后多余的0
        }
    }
    
    if ([[sender currentTitle] isEqualToString:@"%"])
    {
        double num3 = _showLabel.text.doubleValue * 0.01;
        _num1 = num3;
        _showLabel.text = [self changeFloat:[NSString stringWithFormat:@"%f", num3]]; // 调用方法去掉小数点后多余的0
    }


}

- (void)calculation{
    
    if ([_str isEqualToString:@"="]) { // 如果之前的符号是@"="
        _num2 = _showLabel.text.doubleValue;
    }
    if ([_str isEqualToString:@"+"]) //如果之前的符号是@"+"
    {
        _num2 += _num1; //num2是运算符号左边的数值，还是计算结果
    }
    if ([_str isEqualToString:@"−"]) //如果之前的符号是@"−"
    {
        _num2 -= _num1;
    }
    if ([_str hasPrefix:@"×"]) //判断字符串是否以@"×"字符开始
    {
        _num2 *= _num1;
    }
    if ([_str isEqualToString:@"÷"]) //如果之前的符号是@"÷"
    {
        _num2 /= _num1;
    }
    if ([_str isEqualToString:@"%"]) //如果之前的符号是@"%"
    {
        _num2 = _num2 * 0.01;
    }
    
}

- (void)clean{
    [_string setString:@""]; //清空字符
    _num1 = 0;
    _num2 = 0;
    _str = @"";
    _showLabel.text = @"0"; //保证下次输入时清零
    self.selectedBtn.selected = NO;
}
// 去除小数点后多余的0
-(NSString *)changeFloat:(NSString *)stringFloat
{
    const char *floatChars = [stringFloat UTF8String];
    NSUInteger length = [stringFloat length];
    NSUInteger zeroLength = 0;
    long int i = length-1;
    for(; i>=0; i--)
    {
        if(floatChars[i] == '0'/*0x30*/) {
            zeroLength++;
        } else {
            if(floatChars[i] == '.')
                i--;
            break;
        }
    }
    NSString *returnString;
    if(i == -1) {
        returnString = @"0";
    } else {
        returnString = [stringFloat substringToIndex:i+1];
    }
    return returnString;
}

//轻扫手势用来撤销
- (void)setUpSwipe{
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.swipeView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.swipeView addGestureRecognizer:swipeRight];
}
- (void)swipe:(UISwipeGestureRecognizer *)swipe{
    [self back:self];
    
}
-(void)back:(id)sender
{
    if (![_showLabel.text isEqualToString:@""] && ![_str isEqualToString:@"="] && ![_str isEqualToString:@"%"])//判断不是空, 上一个运算符不是@"="、@"±"、@"%"
    {
        if ([_string isEqualToString:@""])
        {
            return;
        }
        else
        {
            [_string deleteCharactersInRange:NSMakeRange ([_string length]-1,1)];//删除最后一个字符
            _showLabel.text = [NSString stringWithString:_string];//显示结果
            
            _num1 = _string.doubleValue;
            
            if ([_string isEqualToString:@""])
            {
                _showLabel.text = @"0";
            }
            
        }
        
    }
}


- (void)goBack
{

    
    self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:NO];
    }];
    
}


@end
