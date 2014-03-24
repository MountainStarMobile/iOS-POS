//
//  DatabaseAccess.m
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "DatabaseAccess.h"
#import "DatabaseConnection.h"
#import "DateFunction.h"
#import "bulletin.h"
#import "category.h"
#import "product.h"
#import "bill.h"
#import "billDetail.h"
#import "staff.h"
#import "customer.h"

@implementation DatabaseAccess

+ (DatabaseAccess*)databaseAccessInstance
{
    static id databaseAccessInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        databaseAccessInstance = [DatabaseAccess new];
    });
    
    return databaseAccessInstance;
}

#pragma mark - Category

- (void)saveCategoryData:(NSArray*)data
{
    BOOL saveInd = YES;
    for (category *item in data) {
        NSString *str = [NSString stringWithFormat:@"insert into category values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '0')",item.categoryType, item.categoryNo, item.categoryNo, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.categoryNo);
        }
    }
}

- (NSArray*)GetCategories
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"select * from category order by category_no"];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    while ([rs next])
    {
        @autoreleasepool {
            category *item = [category new];
            item.categoryType = [rs stringForColumn:@"category_type"];
            item.categoryNo = [rs stringForColumn:@"category_no"];
            item.categoryName = [rs stringForColumn:@"category_name"];
            item.status = [rs stringForColumn:@"status"];
            item.createTime = [rs stringForColumn:@"create_user"];
            item.createUser = [rs stringForColumn:@"create_time"];
            item.mdyUser = [rs stringForColumn:@"mdy_user"];
            item.mdyTime = [rs stringForColumn:@"mdy_time"];
            [array addObject:item];
        }
    }
    return array;
}

#pragma mark - Product
- (void)saveProducts:(NSArray*)data
{
    BOOL saveInd = YES;
    for (product *item in data) {
        NSString *str = [NSString stringWithFormat:@"insert into product values ('%@', '%@', '%@', '%@', '%@', %@, '%@', '%@', %@, %@, '%@', '%@', '%@', '%@', '%@', '%@', '0')", item.productNo, item.productId, item.productName, item.productType, item.productLabel, item.productPrice, item.priceQual, item.productUnit, item.quantityLimit, item.sort, item.remarks, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.productNo);
        }
    }
}

- (NSArray*)GetProducts
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"select * from product"];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    while ([rs next])
    {
        @autoreleasepool {
            product *item = [product new];
            item.productNo = [rs stringForColumn:@"product_no"];
            item.productId = [rs stringForColumn:@"prpoduct_id"];
            item.productType = [rs stringForColumn:@"product_type"];
            item.productName = [rs stringForColumn:@"product_name"];
            item.productLabel = [rs stringForColumn:@"product_label"];
            item.productPrice = [NSNumber numberWithInteger:[rs intForColumn:@"product_price"]];
            item.priceQual = [rs stringForColumn:@"product_qual"];
            item.productUnit = [rs stringForColumn:@"product_unit"];
            item.quantityLimit = [NSNumber numberWithInteger:[rs intForColumn:@"quantity_limit"]];
            item.sort = [NSNumber numberWithInteger:[rs intForColumn:@"sort"]];
            item.remarks = [rs stringForColumn:@"remarks"];
            [array addObject:item];
        }
    }
    return array;
}

#pragma mark - Staff

- (void)saveStaff:(NSArray*)data
{
    BOOL saveInd = YES;
    for (staff *item in data)
    {
        NSString *str = [NSString stringWithFormat:@"insert into staff values ('%@', '%@', '%@', '%@', '%@', %@, '%@', '%@', %@, %@, '%@', '%@', '%@', '%@', '%@', '%@', '0')", item.staffNo, item.staffRold, item.staffId, item.staffPwd, item.staffName, item.staffTel1, item.staffTel2, item.staffZip, item.staffAddr, item.arriveDate, item.leaveDate, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.staffName);
        }
    }
}

#pragma mark - Bulletin

- (void)saveBulletin:(NSArray*)data
{
    BOOL saveInd = YES;
    for (bulletin *item in data)
    {
        NSString *str = [NSString stringWithFormat:@"insert into bulletin values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@','%@', '%@', '0')",item.bulletinNo, item.bulletinType, item.start, item.end, item.content, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.bulletinNo);
        }
    }
}

- (NSArray*)GetRecentlyBulletins
{
    NSString *today = [[DateFunction dateFunctionInstance] DateToString:[NSDate date]];
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"select * from bulletin where %@ between start and end order by start desc", today];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    while ([rs next])
    {
        @autoreleasepool {
            bulletin *item = [bulletin new];
            item.bulletinNo = [rs stringForColumn:@"bulletin_no"];
            item.bulletinType = [rs stringForColumn:@"type"];
            item.start = [rs stringForColumn:@"start"];
            item.end = [rs stringForColumn:@"end"];
            item.content = [rs stringForColumn:@"content"];
            item.status = [rs stringForColumn:@"status"];
            item.createUser = [rs stringForColumn:@"create_user"];
            item.createTime = [rs stringForColumn:@"create_time"];
            item.mdyUser = [rs stringForColumn:@"mdy_user"];
            item.mdyTime = [rs stringForColumn:@"mdy_time"];
            [array addObject:item];
        }
    }
    
    return array;
}

#pragma mark - Bill ,Bill Detail
- (BOOL)existBillNoInBill:(NSString*)billNo
{
    int counter = 0;
    NSString *str = [NSString stringWithFormat:@"select count(*) from bill where bill_no = '%@'", billNo];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    if ([rs next])
    {
        counter = [rs intForColumnIndex:0];
    }
    
    if (counter > 0)
        return YES;
    return NO;
}

- (BOOL)saveBill:(bill*)b details:(NSArray*)data
{
    BOOL saveInd = YES;
    NSString *str = [NSString stringWithFormat:@"insert into staff values ('%@', '%@', '%@', '%@', '%@', '%@', %@, '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", b.billNo, b.billDate, b.billTime, b.reverseDate, b.customerNo, b.staffNo, b.amount, b.remarks, b.invoiceNo, b.cashier, b.staffNo, b.createUser, b.createTime, b.mdyUser, b.mdyTime, b.syncStats];
    
    [[DatabaseConnection GetPosDB] beginTransaction];
    
    saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
    
    if (saveInd)
    {
        NSLog(@"%@ -> save error", b.billNo);
        [[DatabaseConnection GetPosDB] rollback];
        return NO;
    }
    
    //儲存交易明細
    for (billDetail *item in data)
    {
        str = [NSString stringWithFormat:@"insert into bulletin values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@','%@', '%@', '%@', '%@', '%@', '%@')", item.billNo, item.itemNo, item.productNo, item.picec, item.price, item.amount, item.staffNo, item.remarks, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime, item.syncStatus];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.productNo);
        }
    }
    
    [[DatabaseConnection GetPosDB] commit];
    
    return saveInd;
}

- (NSArray*)GetBills
{
    NSMutableArray *array = [NSMutableArray array];
    
    return array;
}

- (NSArray*)GetBillDestails:(NSString*)billNo
{
    NSMutableArray *array = [NSMutableArray array];
    
    return array;
}

#pragma mark - customer

- (void)saveCustomer:(customer*)c
{
    
}

@end
