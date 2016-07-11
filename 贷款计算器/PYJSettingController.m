//
//  PYJSettingController.m
//  贷款计算器
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJSettingController.h"
#import "PYJAboutUsController.h"
#import "PYJCustomController.h"
#import "PYJSettingCell.h"
#import "UIImage+animatedGIF.h"

@interface PYJSettingController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PYJSettingController

static NSString * const PYJSettingCellID = @"PYJSettingCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PYJSettingCell" bundle:nil] forCellReuseIdentifier:PYJSettingCellID];
}

- (IBAction)back {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PYJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:PYJSettingCellID];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 0) {
        cell.title.text = @"版本：1.0";
        cell.imageV.image = [UIImage imageNamed:@"version_button48px"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
//    if (indexPath.row == 1) {
//        cell.title.text = @"量身定制专业版";
//        NSURL *url = [[NSBundle mainBundle] URLForResource:@"member_ diamond_icon" withExtension:@"gif"];
//        cell.imageV.image = [UIImage animatedImageWithAnimatedGIFURL:url];
//    }
    if (indexPath.row == 1) {
        cell.title.text = @"关于我们";
        cell.imageV.image =[UIImage imageNamed:@"we_button48px"];
    }
    if (indexPath.row == 2) {
        cell.title.text = @"评价";
        cell.imageV.image = [UIImage imageNamed:@"good_button48px"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (indexPath.row == 1) {
//        [self method1];
//    }
    if (indexPath.row == 1) {
        [self method2];
    }
    if (indexPath.row == 2) {
        [self method3];
    }
}

- (void)method1 {
    PYJCustomController *vc = [[PYJCustomController alloc] init];
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
