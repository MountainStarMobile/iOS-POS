//
//  CreateAdapter.h
//  POS
//
//  Created by Leo Chang on 2/19/14.
//  Copyright (c) 2014 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define createCellIdentifier @"createCellIdentifier"

@interface CreateAdapter : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSInteger test;
}
@property (nonatomic, strong) NSArray *items;

@end
