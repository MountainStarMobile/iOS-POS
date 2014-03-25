//
//  CreateView.h
//  POS
//
//  Created by leo.chang on 2014/2/18.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "RootView.h"

typedef NS_ENUM(NSInteger, MenuType)
{
    MenuTypeCreate = 0,
    MenuTypeModify = 1,
    MenuTypeCommit = 2,
    MenuTypeQuery = 3,
};

@protocol CreateViewDelegate <NSObject>

- (void)switchCategory:(NSString*)category;

@end

@interface CreateView : RootView <UITextFieldDelegate>

@property (weak) id <CreateViewDelegate> delegate;

@property (nonatomic, strong) IBOutlet UICollectionView *aCollectionView;

@property (nonatomic, strong) IBOutlet UITableView *aTableView;

@property (nonatomic, strong) IBOutlet UILabel *todayLabel;
@property (nonatomic, strong) IBOutlet UIButton *staffButton;
@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *telField;
@property (nonatomic, strong) IBOutlet UIButton *birthButton;

@property (nonatomic, strong) IBOutlet UILabel *productTitle;
@property (nonatomic, strong) IBOutlet UILabel *productLabel;

@property (nonatomic, strong) IBOutlet UILabel *unitTitle;
@property (nonatomic, strong) IBOutlet UITextField *unitField;

@property (nonatomic, strong) IBOutlet UILabel *subTotalTitle;
@property (nonatomic, strong) IBOutlet UILabel *subTotal;

@property (nonatomic, strong) IBOutlet UIButton *actionButton;

@property (nonatomic) MenuType type;
@property (nonatomic, strong) NSString *customerName;
@property (nonatomic, strong) NSString *customerTelephone;
@property (nonatomic, strong) NSString *units;

- (IBAction)chooseCategoryButtonPress:(UIButton*)sender;

- (IBAction)chooseStaffButtonPress:(UIButton*)sender;
- (IBAction)chooseBirthdayButtonPress:(UIButton*)sender;

@end
