//
//  UIView+PYJFrameExtension.h
//  封装Frame扩展
//
//  Created by Apple on 16/6/2.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PYJFrameExtension)

@property (nonatomic, assign) CGSize pyj_size;
@property (nonatomic, assign) CGFloat pyj_width;
@property (nonatomic, assign) CGFloat pyj_height;
@property (nonatomic, assign) CGFloat pyj_x;
@property (nonatomic, assign) CGFloat pyj_y;
@property (nonatomic, assign) CGFloat pyj_centerX;
@property (nonatomic, assign) CGFloat pyj_centerY;

/** 从xib中创建一个控件 */
+ (instancetype)viewFromXib;
@end
