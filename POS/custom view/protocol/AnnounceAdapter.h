//
//  AnnounceAdapter.h
//  POS
//
//  Created by leo.chang on 2014/2/18.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define announceCellIdentifier @"announceCellIdentifier"
#define announceHeaderIdentifier @"announceHeaderIdentifier"

@class AnnounceItem;
@interface AnnounceAdapter : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;

@end
