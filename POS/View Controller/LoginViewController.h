//
//  LoginViewController.h
//  POS
//
//  Created by leo.chang on 2014/2/16.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, loginSection) {
    loginSectionField = 0,
    loginSectionButton = 1,
};

@interface LoginViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *aTableView;

@end
