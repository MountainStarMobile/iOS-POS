//
//  AnnouncementView.h
//  POS
//
//  Created by leo.chang on 2014/2/18.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "RootView.h"

@protocol AnnounceDelegate <NSObject>

@end
@interface AnnouncementView : RootView

@property (nonatomic, strong) id <AnnounceDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITableView *aTableView;

@end
