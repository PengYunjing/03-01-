//
//  PYJAboutUsController.m
//  贷款计算器
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJAboutUsController.h"

@interface PYJAboutUsController ()
@property (weak, nonatomic) IBOutlet UILabel *textLebel;

@end

@implementation PYJAboutUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"aboutUs.txt" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 12;
    paragraphStyle.paragraphSpacing = 14;
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    
    self.textLebel.attributedText = attributedString;
}

- (IBAction)back {

    [self.navigationController popViewControllerAnimated:YES];
}


@end
