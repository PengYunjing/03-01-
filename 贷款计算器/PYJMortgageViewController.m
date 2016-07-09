//
//  PYJMortgageViewController.m
//  房贷计算器精简无广告版
//
//  Created by Apple on 16/5/24.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJMortgageViewController.h"
#import "PYJCalculatorViewController.h"
#import "UIImage+animatedGIF.h"
#import "PYJSettingController.h"

@interface PYJMortgageViewController () <UITableViewDataSource, UITabBarDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *principalField; // 贷款金额

@property (weak, nonatomic) IBOutlet UITextField *durationTime; // 贷款期限

@property (weak, nonatomic) IBOutlet UITextField *rate; // 利率

@property (weak, nonatomic) IBOutlet UILabel *totalMoneyLabel; // 累计还款总额

@property (assign, nonatomic) double totalMoney; // 累计还款总额

@property (weak, nonatomic) IBOutlet UILabel *totalInterestLabel; // 累计支付利息

@property (assign, nonatomic) double totalInterest; // 累计支付利息

@property (weak, nonatomic) IBOutlet UILabel *everyRepayment; // 每期还款

@property (assign, nonatomic) double surplus; // 剩余还款本金

@property (assign, nonatomic) double mi; // 本期支付利息

@property (assign, nonatomic) double mm; // 本期还款本金

@property (strong, nonatomic) NSMutableArray *everyMoney; 

@property (strong, nonatomic) NSMutableArray *monthsArray; // 期数

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *methods;

@property (weak, nonatomic) IBOutlet UIButton *calculatorButton;

@property (weak, nonatomic) IBOutlet UIButton *settingButton;

@property (strong, nonatomic) PYJCalculatorViewController *calculatorVc;

@property (strong, nonatomic) PYJSettingController *settingVc;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightItem;
@end

@implementation PYJMortgageViewController

- (NSMutableArray *)everyMoney{
    if (_everyMoney == nil) {
        _everyMoney = [NSMutableArray array];
    }
    return _everyMoney;
}

- (NSMutableArray *)monthsArray{
    if (_monthsArray == nil) {
        _monthsArray = [NSMutableArray array];
    }
    return _monthsArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.title = @"贷款计算器";
    
    NSURL *urlCalculator = [[NSBundle mainBundle] URLForResource:@"calculator_button" withExtension:@"gif"];
    [self.calculatorButton setImage:[UIImage animatedImageWithAnimatedGIFURL:urlCalculator] forState:UIControlStateNormal];
    NSURL *urlSetting = [[NSBundle mainBundle] URLForResource:@"setting_button" withExtension:@"gif"];
    [self.settingButton setImage:[UIImage animatedImageWithAnimatedGIFURL:urlSetting] forState:UIControlStateNormal];

    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:(UIEdgeInsetsZero)];
    }
    
    self.principalField.delegate = self;
    self.durationTime.delegate = self;
    self.rate.delegate = self;
    
    
    [self setUpCalculator];
}

#pragma mark - 创建计算器
- (void)setUpCalculator{
    PYJCalculatorViewController *vc = [[PYJCalculatorViewController alloc] init];
    vc.view.hidden = YES;
    self.calculatorVc = vc;
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:(UIEdgeInsetsZero)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:(UIEdgeInsetsZero)];
    }
}

#pragma mark - 点击开始计算
- (IBAction)compute{
    
    if (self.principalField.text.length == 0) {
        [self showWithTitle:@"请输入贷款总额(万元)"];
        return;
    }else if (self.durationTime.text.length == 0) {
        [self showWithTitle:@"请输入按揭年数(年)"];
        return;
    }else if (self.rate.text.length == 0) {
        [self showWithTitle:@"请输入年利率(%)"];
        return;
    }else {
        
        if (self.methods.selectedSegmentIndex == 0) {
            [self method1];
        }else if (self.methods.selectedSegmentIndex == 1) {
            [self method2];
        }

    }
    
    [self.tableView reloadData];
    
}

#pragma mark - 点击屏幕收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - 点击跳转到便捷计算器
- (IBAction)calculator {
    [self.view endEditing:YES];
    self.calculatorVc.view.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.calculatorVc.view.transform = CGAffineTransformIdentity;
        self.calculatorVc.view.hidden = NO;
    } completion:nil];
    
}

#pragma mark - 点击进入设置
- (IBAction)setting {
    PYJSettingController *vc = [[PYJSettingController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 等额本息计算方法
- (void)method1{
    
    self.contentView.hidden = NO;
    [self.monthsArray removeAllObjects];
    [self.everyMoney removeAllObjects];
    [self.view endEditing:YES];
    
    double p = self.principalField.text.doubleValue * 10000; // 贷款金额
    double i = 0.01 * self.rate.text.doubleValue / 12; // 月利率
    double n = self.durationTime.text.doubleValue * 12; // 还款期数(按月算)
    double a = (p * i * pow(1 + i, n)) / (pow(1 + i, n) - 1); // 每月还本付息金额
    
    self.everyRepayment.text = [NSString stringWithFormat:@"%.1f", a];
    
    self.totalInterest = 0;
    self.totalMoney = 0;
    self.surplus = p;
    self.mi = 0;
    self.mm = 0;
    for (NSUInteger x = 1 ; x < n + 1; x++) {
        self.mi = self.surplus * i;
        self.mm = a - self.mi;
        self.surplus -= self.mm;
        
        self.totalMoney += self.mi + self.mm;
        self.totalInterest += self.mi;
        
        NSString *aStr = [NSString stringWithFormat:@"%.1f", a];
        NSString *mmStr = [NSString stringWithFormat:@"%.1f", self.mm];
        NSString *miStr = [NSString stringWithFormat:@"%.1f", aStr.doubleValue - mmStr.doubleValue];
        
        [self.everyMoney addObject:[NSString stringWithFormat:@"%.1f(%@/%@)",a, mmStr, miStr]];
        [self.monthsArray addObject:[NSString stringWithFormat:@"%zd", x]];
    }
    
    self.totalMoneyLabel.text = [NSString stringWithFormat:@"%.1f", self.totalMoney];
    self.totalInterestLabel.text = [NSString stringWithFormat:@"%.1f", self.totalInterest];
    
    self.totalMoney = 0;
    self.totalInterest = 0;
    
}

#pragma mark - 等额本金计算方法
- (void)method2{
    
    self.contentView.hidden = NO;
    [self.monthsArray removeAllObjects];
    [self.everyMoney removeAllObjects];
    [self.view endEditing:YES];
    
    double p = self.principalField.text.doubleValue * 10000; // 贷款金额
    double i = 0.01 * self.rate.text.doubleValue / 12; // 月利率
    double n = self.durationTime.text.doubleValue * 12; // 还款期数(按月算)
    
    self.totalInterest = 0;
    self.totalMoney = 0;
    self.mi = 0;
    self.mm = p / n;
    double y = self.mm * i; // 每月利息减少金额
    self.mi = p * i;
    self.everyRepayment.text = @"不固定";
    
    for (NSUInteger x = 1 ; x < n + 1; x++) {
        
        double a = self.mm + self.mi; // 每月还本付息金额
        
        self.totalInterest += self.mi;
        
        NSString *aStr = [NSString stringWithFormat:@"%.1f", a];
        NSString *mmStr = [NSString stringWithFormat:@"%.1f", self.mm];
        NSString *miStr = [NSString stringWithFormat:@"%.1f", aStr.doubleValue - mmStr.doubleValue];
        
        [self.everyMoney addObject:[NSString stringWithFormat:@"%@(%@/%@)", aStr, mmStr, miStr]];
        [self.monthsArray addObject:[NSString stringWithFormat:@"%zd", x]];
        self.mi -= y;
    }
    
    self.totalMoney = self.totalInterest + p;
    self.totalInterestLabel.text = [NSString stringWithFormat:@"%.1f", self.totalInterest];
    self.totalMoneyLabel.text = [NSString stringWithFormat:@"%.1f", self.totalMoney];
    
}

- (IBAction)choose:(UISegmentedControl *)sender {
    
    if (self.methods.selectedSegmentIndex == 0) {
        if ((self.principalField.text.length) && (self.durationTime.text.length) && (self.rate.text.length)) {
            [self method1];
        }else {
            return;
        }
    }else if (self.methods.selectedSegmentIndex == 1) {
        if ((self.principalField.text.length) && (self.durationTime.text.length) && (self.rate.text.length)) {
            [self method2];
        }else {
            return;
        }
    }
    [self.tableView reloadData];
}

#pragma mark - 当输入为空时创建一个弹窗
- (void)showWithTitle:(NSString *)title{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - 清空所有
- (IBAction)cleanBtn:(id)sender {
    [self.view endEditing:YES];
    self.principalField.text = nil;
    self.durationTime.text = nil;
    self.rate.text = nil;
    
    self.totalMoney = 0;
    self.totalInterest = 0;
    self.totalMoneyLabel.text = [NSString stringWithFormat:@"%.0f", self.totalMoney];
    self.totalInterestLabel.text = [NSString stringWithFormat:@"%.0f", self.totalInterest];
    self.everyRepayment.text = @"0";
    
    [self.monthsArray removeAllObjects];
    [self.everyMoney removeAllObjects];
    [self.tableView reloadData];
    
    self.contentView.hidden = YES;
    
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.durationTime.text.doubleValue * 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:ID];
    }
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = self.monthsArray[indexPath.row];
    cell.detailTextLabel.text = self.everyMoney[indexPath.row];
    
    UIColor *color = self.view.backgroundColor;
    cell.backgroundColor = color;
    return cell;
    
}

#pragma mark - <UITextFieldDelegate>
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.principalField) {
        [self.durationTime becomeFirstResponder];
    }
    if (textField == self.durationTime) {
        [self.rate becomeFirstResponder];
    }
    if (textField == self.rate) {
        [self.view endEditing:YES];
        [self compute];
    }
    
    return YES;
}


@end
