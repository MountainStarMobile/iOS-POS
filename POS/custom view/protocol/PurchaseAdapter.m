//
//  PurchaseAdapter.m
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "PurchaseAdapter.h"
#import "PurchaseCell.h"
#import "bill.h"
#import "billDetail.h"

@implementation PurchaseAdapter

- (id)init
{
    self = [super init];
    if (self)
    {
        [self createData];
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 22;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 22)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, tableView.frame.size.width, 20)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor darkGrayColor]];
    [titleLabel setText:@"單號"];
    [headerView addSubview:titleLabel];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    PurchaseCell *cell = [tableView dequeueReusableCellWithIdentifier:purchaseItemCellIdeitnfier forIndexPath:indexPath];
    
    billDetail *item = _items[row];
    
    
    [cell.productLabel setText:item.productNo];
    [cell.priceLabel setText:[NSString stringWithFormat:@"%@",item.price]];
    [cell.pieceLabel setText:[NSString stringWithFormat:@"%@",item.picec]];
    [cell.amountLabel setText:[NSString stringWithFormat:@"%@",item.amount]];
    [cell.staffLabel setText:item.staffNo];
    
    return cell;
    
}

- (void)createData
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0 ; i < 10; i++)
    {
        @autoreleasepool {
            
            
            billDetail *detail = [billDetail new];
            detail.productNo = [NSString stringWithFormat:@"美甲1"];
            detail.price = [NSNumber numberWithInteger:i];
            detail.picec = [NSNumber numberWithInteger:i];
            detail.amount = [NSNumber numberWithInteger:(i*i)];
            detail.staffNo = [NSString stringWithFormat:@"張星星"];
            
            [array addObject:detail];
        }
    }
    self.items = [NSArray arrayWithArray:array];
}

@end
