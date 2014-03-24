//
//  PathAndDirectoryFunction.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#define db_db @"db"
#define db_sqlite @"sqlite"
#define db_data @"pos"

@interface PathAndDirectoryFunction : NSObject

+ (PathAndDirectoryFunction*)pathAndDirectoryInstance;

- (NSString*)getDocumentDirectoryForComponent:(NSString*)comp;
- (NSString*)getDocumentPathForFileName:(NSString*)fileName andExtension:(NSString*)ext;
- (NSString*)getTempPathForFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getCachePathForFileName:(NSString*)file andExtension:(NSString*)ext;

@end
