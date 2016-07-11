//
//  PYJSettingController.m
//  贷款计算器
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJSettingController.h"
#import "PYJAboutUsController.h"
#import "PYJSettingLanguageController.h"
#import "PYJSettingCell.h"
#import "UIImage+animatedGIF.h"

@interface PYJSettingController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PYJSettingController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    
    if (LanguageManager.languageChange) {
        
        [self viewDidLoad];
        [self.tableView reloadData];

    }
}

static NSString * const PYJSettingCellID = @"PYJSettingCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = LanguageForKey(@"settingTitleKey");
    
    UIBarButtonItem *backButton = [UIBarButtonItem appearance];
    backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain  target:self action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PYJSettingCell" bundle:nil] forCellReuseIdentifier:PYJSettingCellID];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PYJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:PYJSettingCellID];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 0) {
        cell.title.text = LanguageForKey(@"versionKey");
        cell.imageV.image = [UIImage imageNamed:@"version_button48px"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    if (indexPath.row == 1) {
        cell.title.text = LanguageForKey(@"languageTypeKey");
        cell.imageV.image = [UIImage imageNamed:@"language_button_48px"];
    }
    if (indexPath.row == 2) {
        cell.title.text = LanguageForKey(@"aboutKey");
        cell.imageV.image =[UIImage imageNamed:@"we_button48px"];
    }
    if (indexPath.row == 3) {
        cell.title.text = LanguageForKey(@"appraiseKey");
        cell.imageV.image = [UIImage imageNamed:@"good_button48px"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        [self method1];
    }
    if (indexPath.row == 2) {
        [self method2];
    }
    if (indexPath.row == 3) {
        [self method3];
    }
}

- (void)method1 {
    PYJSettingLanguageController *vc = [[PYJSettingLanguageController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)method2 {
    PYJAboutUsController *vc = [[PYJAboutUsController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)method3 {
    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id315987135"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}


@end
