//
//  CreateView.h
//  POS
//
//  Created by leo.chang on 2014/2/18.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "RootView.h"

@protocol CreateViewDelegate <NSObject>

- (void)switchCategory:(NSString*)category;

@end
@interface CreateView : RootView

@property (weak) id <CreateViewDelegate> delegate;

@property (nonatomic, strong) IBOutlet UICollectionView *aCollectionView;

@property (nonatomic, strong) IBOutlet UITableView *aTableView;

- (IBAction)chooseCategoryButtonPress:(UIButton*)sender;

@end
