//
//  bill.m
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "bill.h"

@implementation bill

- (id)init
{
    self = [super init];
    if (self)
    {
        self.syncStatus = [NSNumber numberWithInteger:syncStatusNeed];
    }
    return self;
}

@end
