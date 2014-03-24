//
//  DatabaseAccess.h
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseAccess : NSObject

+ (DatabaseAccess*)databaseAccessInstance;

- (void)saveCategoryData:(NSArray*)data;
- (NSArray*)GetCategories;

- (void)saveProducts:(NSArray*)data;
- (NSArray*)GetProducts;
- (void)saveStaff:(NSArray*)data;

@end
