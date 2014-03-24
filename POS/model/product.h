//
//  product.h
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface product : NSObject

@property (nonatomic, strong) NSString *productNo;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *productType;
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSString *productLabel;
@property (nonatomic, strong) NSNumber *productPrice;
@property (nonatomic, strong) NSString *priceQual;
@property (nonatomic, strong) NSString *productUnit;
@property (nonatomic, strong) NSNumber *quantityLimit;
@property (nonatomic, strong) NSNumber *sort;
@property (nonatomic, strong) NSString *remarks;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *createUser;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *mdyUser;
@property (nonatomic, strong) NSString *mdyTime;
@property (nonatomic, strong) NSNumber *syncStatus;


@end
