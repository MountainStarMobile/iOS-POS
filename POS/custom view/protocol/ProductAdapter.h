//
//  ProductAdapter.h
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define createCellIdentifier @"createCellIdentifier"

@interface ProductAdapter : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSInteger test;
}
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *category;

@end
