//
//  PYJCHSLanguage.h
//  贷款计算器
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 PYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PYJCHSLanguage : NSObject

@property (nonatomic, copy) NSString *titleKey;
@property (nonatomic, copy) NSString *totalLoanKey;
@property (nonatomic, copy) NSString *totalLoanPlaceholderKey;
@property (nonatomic, copy) NSString *mortgageYearKey;
@property (nonatomic, copy) NSString *mortgageYearPlaceholderKey;
@property (nonatomic, copy) NSString *annualRateKey;
@property (nonatomic, copy) NSString *annualRatePlaceholderKey;
@property (nonatomic, copy) NSString *totalLoanUnitKey;
@property (nonatomic, copy) NSString *mortgageYearUnitKey;
@property (nonatomic, copy) NSString *equalInstallmentPaymentKey;
@property (nonatomic, copy) NSString *equalRepaymentOfPrincipalKey;
@property (nonatomic, copy) NSString *computeKey;
@property (nonatomic, copy) NSString *emptyKey;
@property (nonatomic, copy) NSString *TotalAmountOfRepaymentKey;
@property (nonatomic, copy) NSString *TotalPaymentOfInterestKey;
@property (nonatomic, copy) NSString *eachRepaymentAmountKey;
@property (nonatomic, copy) NSString *numberKey;
@property (nonatomic, copy) NSString *paymentKey;

+ (instancetype)languageWithDict;


@end
