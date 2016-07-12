//
//  PYJSettingLanguageController.m
//  贷款计算器
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJSettingLanguageController.h"

@interface PYJSettingLanguageController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;


@end

@implementation PYJSettingLanguageController

- (void)viewWillAppear:(BOOL)animated
{
    
}

static NSString *const PYJSettingLanguageCellID = @"PYJSettingLanguageCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.title = LanguageForKey(@"languageTypeKey");
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:PYJSettingLanguageCellID];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PYJSettingLanguageCellID];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"English";
        if ([LanguageManager.dataName isEqualToString:@"English.strings"]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"简体中文";
        if ([LanguageManager.dataName isEqualToString:@"Chanese.strings"]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"繁體中文";
        if ([LanguageManager.dataName isEqualToString:@"HongKong.strings"]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"한국의";
        if ([LanguageManager.dataName isEqualToString:@"Korean.strings"]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        LanguageManager.dataName = @"English.strings";
        LanguageManager.languageDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:LanguageManager.dataName ofType:nil]];
        LanguageManager.languageChange = YES;

        [self.tableview reloadData];
        self.title = LanguageForKey(@"languageTypeKey");
        
    }
    if (indexPath.row == 1) {
       LanguageManager.dataName = @"Chanese.strings";
       LanguageManager.languageDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:LanguageManager.dataName ofType:nil]];
        LanguageManager.languageChange = YES;
        
        [self.tableview reloadData];
        self.title = LanguageForKey(@"languageTypeKey");

    }
    if (indexPath.row == 2) {
        LanguageManager.dataName = @"HongKong.strings";
        LanguageManager.languageDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:LanguageManager.dataName ofType:nil]];
        LanguageManager.languageChange = YES;
        
        [self.tableview reloadData];
        self.title = LanguageForKey(@"languageTypeKey");
        
    }
    if (indexPath.row == 3) {
        LanguageManager.dataName = @"Korean.strings";
        LanguageManager.languageDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:LanguageManager.dataName ofType:nil]];
        LanguageManager.languageChange = YES;
        
        [self.tableview reloadData];
        self.title = LanguageForKey(@"languageTypeKey");
        
    }
    
}






@end
