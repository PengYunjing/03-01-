//
//  PYJLanguageManager.m
//  贷款计算器
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJLanguageManager.h"

@implementation PYJLanguageManager


- (void)setDataName:(NSString *)dataName
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:dataName forKey:LANGUAGE_SET];
    [def synchronize];
    _dataName = dataName;
}

- (NSDictionary *)languageDict
{
    if (!_languageDict) {
        _languageDict = [NSDictionary dictionary];
    }
    return _languageDict;
}

static id _instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (!_instance) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}

+ (PYJLanguageManager *)sharedPYJLanguageManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_instance) {
            _instance = [[self alloc] init];
        }
    });
    return _instance;
}

- (id)copy
{
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

@end
