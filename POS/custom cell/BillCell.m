//
//  BillCell.m
//  POS
//
//  Created by leo.chang on 2014/3/25.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "BillCell.h"

@implementation BillCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
