//
//  PYJLanguageManager.h
//  贷款计算器
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PYJLanguageManager : NSObject

@property (nonatomic, strong) NSDictionary *languageDict;

@property (nonatomic, assign) BOOL languageChange;

@property (nonatomic, copy) NSString *dataName;

+ (PYJLanguageManager *)sharedPYJLanguageManager;


@end
