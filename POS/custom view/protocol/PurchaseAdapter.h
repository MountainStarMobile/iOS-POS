//
//  PurchaseAdapter.h
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define purchaseItemCellIdeitnfier @"purchaseItemCellIdeitnfier"

@interface PurchaseAdapter : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSDictionary *details;

@end
