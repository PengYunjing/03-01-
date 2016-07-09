//
//  PYJNavigationController.m
//  贷款计算器
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJNavigationController.h"
#import "UIView+PYJFrameExtension.h"

@interface PYJNavigationController ()

@end

@implementation PYJNavigationController


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) { // 如果push进来的不是第一个控制器
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back_button_highlighted"] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.pyj_size = CGSizeMake(70, 30);
        // 让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 让按钮的内容往左边偏移10
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        // [button sizeToFit];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:NO];
}

@end
