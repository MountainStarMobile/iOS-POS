//
//  CustomerInfo.h
//  POS
//
//  Created by Leo Chang on 2/21/14.
//  Copyright (c) 2014 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomerInfo : NSObject

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *tel;

@end
