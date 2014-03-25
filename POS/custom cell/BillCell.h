//
//  BillCell.h
//  POS
//
//  Created by leo.chang on 2014/3/25.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *billNoLabel;
@property (nonatomic, strong) IBOutlet UILabel *billDateLabel;
@property (nonatomic, strong) IBOutlet UILabel *customerNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *staffNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *amountLabel;
@property (nonatomic, strong) IBOutlet UILabel *statusLabel;

@end
