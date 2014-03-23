//
//  PurchaseCell.h
//  POS
//
//  Created by leo.chang on 2014/3/23.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchaseCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *productLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) IBOutlet UILabel *pieceLabel;
@property (nonatomic, strong) IBOutlet UILabel *amountLabel;
@property (nonatomic, strong) IBOutlet UILabel *staffLabel;

@end
