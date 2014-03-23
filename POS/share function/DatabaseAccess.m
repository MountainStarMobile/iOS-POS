//
//  DatabaseAccess.m
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "DatabaseAccess.h"
#import "DatabaseConnection.h"
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
        NSString *str = [NSString stringWithFormat:@"insert into category values ('%@', '%@', '%@', '%@', '%@', %@, '%@', '%@', %@, %@, '%@', '%@', '%@', '%@', '%@', '%@', '0')", item.productNo, item.productId, item.productName, item.productType, item.productLabel, item.productPrice, item.priceQual, item.productUnit, item.quantityLimit, item.sort, item.remarks, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
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
        NSString *str = [NSString stringWithFormat:@"insert into category values ('%@', '%@', '%@', '%@', '%@', %@, '%@', '%@', %@, %@, '%@', '%@', '%@', '%@', '%@', '%@', '0')", item.staffNo, item.staffRold, item.staffId, item.staffPwd, item.staffName, item.staffTel1, item.staffTel2, item.staffZip, item.staffAddr, item.arriveDate, item.leaveDate, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.staffName);
        }
    }
}

#pragma mark - Bulletin

#pragma mark - Bill

#pragma mark - Bill Detail

@end
