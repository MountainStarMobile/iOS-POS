//
//  CreateView.m
//  POS
//
//  Created by leo.chang on 2014/2/18.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "CreateView.h"

@implementation CreateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)show
{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 1.f;
        //self.frame = CGRectMake(0, 81, 1024, 768 - 80);
    } completion:^(BOOL finished){

    }];
}

- (void)hide
{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0.f;
        //self.frame = CGRectMake(1024, 81, 1024, 768 - 80);
    } completion:^(BOOL finished){
        
    }];
}

@end