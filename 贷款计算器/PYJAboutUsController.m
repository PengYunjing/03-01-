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

- (void)viewWillAppear:(BOOL)animated{

    if (LanguageManager.languageChange) {
        
        [self viewDidLoad];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = LanguageForKey(@"aboutKey");
    
    NSString *stringName = nil;
    if ([LanguageManager.dataName isEqualToString:@"English.strings"]) {
        stringName = @"aboutUsEnglish.txt";
    }
    if ([LanguageManager.dataName isEqualToString:@"Chanese.strings"]) {
        stringName = @"aboutUsChanese.txt";
    }
    if ([LanguageManager.dataName isEqualToString:@"HongKong.strings"]) {
        stringName = @"aboutUsHongKong.txt";
    }
    if ([LanguageManager.dataName isEqualToString:@"Korean.strings"]) {
        stringName = @"aboutUsKorean.txt";
    }
    
    NSString *string = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:stringName ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    
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
