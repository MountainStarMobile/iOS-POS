//
//  DatabaseConnections.h
//  POS
//
//  Created by Leo Chang on 2/21/14.
//  Copyright (c) 2014 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseConnections : NSObject

+ (FMDatabase*)GetPOSDB;

@end
