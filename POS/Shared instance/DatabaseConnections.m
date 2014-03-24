//
//  DatabaseConnections.m
//  POS
//
//  Created by Leo Chang on 2/21/14.
//  Copyright (c) 2014 Good-idea Consulgint Inc. All rights reserved.
//

#import "DatabaseConnections.h"
#import "PathAndDirectoryFunction.h"
#import "FMDatabase.h"

@implementation DatabaseConnections

+ (FMDatabase*)GetPOSDB
{
    NSError *error = nil;
    NSString *dbPath = [[PathAndDirectoryFunction pathAndDirectoryInstance] getDocumentPathForFileName:db_pos andExtension:db_sqlite];
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:db_pos ofType:db_sqlite];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dbPath])
    {
        if (![[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:dbPath error:&error])
        {
            NSLog(@"faild to copy POS.sqlite (%@)", error);
        }
    }
    //create singleton object
    static FMDatabase *db = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        db = [FMDatabase databaseWithPath:dbPath];
        if ([db open])
        {
            NSLog(@"open control.sqlite succeed");
        }
    });
    
    return db;
}

@end
