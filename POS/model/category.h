//
//  category.h
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface category : NSObject

@property (nonatomic, strong) NSString *categoryType;
@property (nonatomic, strong) NSString *categoryNo;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *createUser;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *mdyUser;
@property (nonatomic, strong) NSString *mdyTime;
@property (nonatomic, strong) NSNumber *syncStatus;


@end
