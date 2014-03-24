//
//  MenuTableViewController.h
//  POS
//
//  Created by leo.chang on 2014/2/17.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

typedef NS_ENUM(NSInteger, PMenuOption) {
    PMenuOptionAnnounce = 0,
    PMenuOptionCreate = 1,
    PMenuOptionModify = 2,
    PMenuOptionSubTotal = 3,
    PMenuOptionQuery = 4,
    PMenuOptionSetting = 5,
    PMenuOptionCount = 6,
};

@class MenuTableViewController, RootView;
@protocol MenuOptionDelegate <NSObject>

- (void)menu:(MenuTableViewController*)menu didPickWithOption:(PMenuOption)option contentView:(RootView*)view;

@end

@interface MenuTableViewController : REFrostedViewController <UITableViewDataSource, UITableViewDelegate>

@property id <MenuOptionDelegate> delegate;
@property (nonatomic, strong) RootView *contentView;

@end
