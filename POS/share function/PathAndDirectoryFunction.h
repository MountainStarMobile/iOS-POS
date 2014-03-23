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
- (NSString*)getReportDriectoryInDocumentForCompoment:(NSString*)comp;
- (NSString*)getReportPathInDocumentForCompoment:(NSString*)comp andFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getSavedataDriectoryInDocumentForCompoment:(NSString*)comp;
- (NSString*)getSavedataPathInDocumentForComponent:(NSString*)comp andFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getInfoDriectoryInDocumentForComponent:(NSString*)comp;
- (NSString*)getInfoPathInDocumentForComponent:(NSString*)comp andFileName:(NSString*)file andExtension:(NSString*)ext;

- (NSString*)getDocumentPathForFileName:(NSString*)fileName andExtension:(NSString*)ext;
- (NSString*)getTempPathForFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getCachePathForFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getProvisionDirectoryInCache;
- (NSString*)getProvisionPathInCacheForFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getIntroDirectoryInCache;
- (NSString*)getIntroPathInCacheForFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getDmDirectoryInCache;
- (NSString*)getDmPathInCacheForFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getClassDirectoryInCache;
- (NSString*)getClassPathInCacheForFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getCatalogDirectoryInCache;
- (NSString*)getCatalogPathInCacheForFileName:(NSString*)file andExtension:(NSString*)ext;
@end
