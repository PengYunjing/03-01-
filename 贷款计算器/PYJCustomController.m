//
//  PYJCustomController.m
//  贷款计算器
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJCustomController.h"

@interface PYJCustomController ()
@property (weak, nonatomic) IBOutlet UILabel *textLebel;

@property (weak, nonatomic) IBOutlet UIButton *raiseButton;

@end

@implementation PYJCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *string = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"custom.txt" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 12;
    paragraphStyle.paragraphSpacing = 14;
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    
    self.textLebel.attributedText = attributedString;
    
    [self.raiseButton setTitle:@"众筹支持作者" forState:UIControlStateNormal];
    self.raiseButton.layer.cornerRadius = 10;
    self.raiseButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.raiseButton.layer.shadowOffset = CGSizeMake(3, 3);
    self.raiseButton.layer.shadowOpacity = 0.5;
    self.raiseButton.layer.shadowRadius = YES;
}

- (IBAction)back {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)raise {
    
}

@end
