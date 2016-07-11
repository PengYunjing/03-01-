//
//  PYJCHSLanguage.m
//  贷款计算器
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import "PYJCHSLanguage.h"

@implementation PYJCHSLanguage

+ (instancetype)languageWithDict
{
    PYJCHSLanguage *language = [[PYJCHSLanguage alloc] init];
    
    language.titleKey = @"贷款计算器";
    language.totalLoanKey = @"贷款总额";
    language.totalLoanPlaceholderKey = @"请输入金额...";
    language.mortgageYearKey = @"按揭年数";
    language.mortgageYearPlaceholderKey = @"请输入期限...";
    language.annualRateKey = @"年利率";
    language.annualRatePlaceholderKey = @"请输入利率...";
    language.totalLoanUnitKey = @"万";
    language.mortgageYearUnitKey = @"年";
    language.equalInstallmentPaymentKey = @"等额本息";
    language.equalRepaymentOfPrincipalKey = @"等额本金";
    language.computeKey = @"计算";
    language.emptyKey = @"清空";
    language.TotalAmountOfRepaymentKey = @"累计返款总额(元)";
    language.TotalPaymentOfInterestKey = @"累计支付利息(元)";
    language.eachRepaymentAmountKey = @"每期还款(元)";
    language.numberKey = @"期数";
    language.paymentKey = @"本期还款(本金/利息)(元)";
    
    return language;
}

@end
