//
//  POSViewController.h
//  POS
//
//  Created by leo.chang on 2014/2/16.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POSViewController : UIViewController

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *dateLabel;

- (void)showMenu;

@end
