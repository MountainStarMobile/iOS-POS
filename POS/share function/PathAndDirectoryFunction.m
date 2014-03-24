//
//  PathAndDirectoryFunction.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "PathAndDirectoryFunction.h"

@implementation PathAndDirectoryFunction

+ (PathAndDirectoryFunction*)pathAndDirectoryInstance
{
    static id PathAndDirectoryInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        PathAndDirectoryInstance = [PathAndDirectoryFunction new];
    });
    
    return PathAndDirectoryInstance;
}

#pragma mark - 取得個人資料夾的路徑or檔案路徑
/**
 取得個人資料夾
 */
- (NSString*)getDocumentDirectoryForComponent:(NSString*)comp
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:comp];
    return documentsDirectory;
}

#pragma mark - 在document資料夾中取得完整路徑
- (NSString*)getDocumentPathForFileName:(NSString*)fileName andExtension:(NSString*)ext
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:fileName];
    fullPath = [fullPath stringByAppendingPathExtension:ext];
    return fullPath;
}

#pragma mark - 在 Temperary 資料夾中取得完整路徑
- (NSString*)getTempPathForFileName:(NSString*)file andExtension:(NSString*)ext;
{
    NSString *tempDirectory = NSTemporaryDirectory();
    NSString *fullPath = [tempDirectory stringByAppendingPathComponent:file];
    fullPath = [fullPath stringByAppendingPathExtension:ext];
    return fullPath;
}

#pragma mark - 在 Cache 資料夾中取得完整路徑
- (NSString*)getCachePathForFileName:(NSString*)file andExtension:(NSString*)ext
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *cacheFile = [cachePath stringByAppendingPathComponent:file];
    cacheFile = [cacheFile stringByAppendingPathExtension:ext];
    return cacheFile;
}

@end
