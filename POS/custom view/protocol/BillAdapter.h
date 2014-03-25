//
//  BillAdapter.h
//  POS
//
//  Created by leo.chang on 2014/3/25.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define billCellIdentifier @"billCellIdentifier"

@interface BillAdapter : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *items;

@end
