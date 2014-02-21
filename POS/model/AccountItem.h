//
//  AccountItem.h
//  POS
//
//  Created by Leo Chang on 2/21/14.
//  Copyright (c) 2014 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountItem : NSObject

@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSDate *lgoinDate;

@end
