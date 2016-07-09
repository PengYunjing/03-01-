//
//  UIView+PYJFrameExtension.m
//  封装Frame扩展
//
//  Created by Apple on 16/6/2.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "UIView+PYJFrameExtension.h"

@implementation UIView (PYJFrameExtension)

+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setPyj_size:(CGSize)pyj_size
{
    CGRect frame = self.frame;
    frame.size = pyj_size;
    self.frame = frame;
}

- (void)setPyj_width:(CGFloat)pyj_width
{
    CGRect frame = self.frame;
    frame.size.width = pyj_width;
    self.frame = frame;
}

- (void)setPyj_height:(CGFloat)pyj_height
{
    CGRect frame = self.frame;
    frame.size.height = pyj_height;
    self.frame = frame;
}

- (void)setPyj_x:(CGFloat)pyj_x
{
    CGRect frame = self.frame;
    frame.origin.x = pyj_x;
    self.frame = frame;
}

- (void)setPyj_y:(CGFloat)pyj_y
{
    CGRect frame = self.frame;
    frame.origin.y = pyj_y;
    self.frame = frame;
}

- (void)setPyj_centerX:(CGFloat)pyj_centerX
{
    CGPoint center = self.center;
    center.x = pyj_centerX;
    self.center = center;
}

- (void)setPyj_centerY:(CGFloat)pyj_centerY
{
    CGPoint center = self.center;
    center.y = pyj_centerY;
    self.center = center;
}

- (CGFloat)pyj_centerX
{
    return self.center.x;
}

- (CGFloat)pyj_centerY
{
    return self.center.y;
}

- (CGSize)pyj_size
{
    return self.frame.size;
}

- (CGFloat)pyj_width
{
    return self.frame.size.width;
}

- (CGFloat)pyj_height
{
    return self.frame.size.height;
}

- (CGFloat)pyj_x
{
    return self.frame.origin.x;
}

- (CGFloat)pyj_y
{
    return self.frame.origin.y;
}

@end
