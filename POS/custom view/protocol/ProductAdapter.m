//
//  ProductAdapter.m
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "ProductAdapter.h"
#import "productCell.h"
#import "ProductItem.h"

@implementation ProductAdapter

- (id)init
{
    self = [super init];
    if (self)
    {
        [self createdata];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _items.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    productCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:createCellIdentifier forIndexPath:indexPath];
    
    ProductItem *item = _items[indexPath.row];
    
    [cell.nameLabel setText:[NSString stringWithFormat:@"[%@]%@", _category, item.name ]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 150);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


- (void)createdata
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0 ; i < 30; i ++)
    {
        @autoreleasepool {
            ProductItem *item = [ProductItem new];
            item.Id = [NSNumber numberWithInteger:i];
            item.name = [NSString stringWithFormat:@"產品名稱%i", i];
            item.comment = [NSString stringWithFormat:@"產品說明"];
            item.price = @(100 * i);
            item.count = @0;
            item.stock = @100;
            [array addObject:item];
        }
    }
    
    self.items = [NSArray arrayWithArray:array];
}

@end
