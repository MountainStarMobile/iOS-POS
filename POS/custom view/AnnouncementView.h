//
//  AnnouncementView.h
//  POS
//
//  Created by leo.chang on 2014/2/18.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnnounceDelegate <NSObject>

@end
@interface AnnouncementView : UIView

@property (nonatomic, strong) id <AnnounceDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITableView *aTableView;

- (void)show;
- (void)hide;

@end
