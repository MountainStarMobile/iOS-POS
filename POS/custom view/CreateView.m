//
//  CreateView.m
//  POS
//
//  Created by leo.chang on 2014/2/18.
//  Copyright (c) 2014年 Good-idea Consulgint Inc. All rights reserved.
//

#import "CreateView.h"
#import "MathFunction.h"

enum
{
    InputFieldTagName = 1,
    InputFieldTagTel = 2,
    InputFieldTagUnit = 3,
};

@interface CreateView()


@end

@implementation CreateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    if (_type == MenuTypeCreate)
    {
        [self.actionButton setTitle:@"加入" forState:UIControlStateNormal];
        [self hideUnUseControl:NO];
    }
    else if (_type == MenuTypeModify)
    {
        [self.actionButton setTitle:@"修改" forState:UIControlStateNormal];
        [self hideUnUseControl:YES];
    }
    else if (_type == MenuTypeQuery)
    {
        [self.actionButton setTitle:@"查詢" forState:UIControlStateNormal];
        [self hideUnUseControl:YES];
    }
    else if (_type == MenuTypeCommit)
    {
        [self.actionButton setTitle:@"查詢" forState:UIControlStateNormal];
        [self hideUnUseControl:YES];
    }
}

- (void)hideUnUseControl:(BOOL)value
{
    [self.productTitle setHidden:value];
    [self.productLabel setHidden:value];
    [self.unitTitle setHidden:value];
    [self.unitField setHidden:value];
    [self.subTotalTitle setHidden:value];
    [self.subTotal setHidden:value];
}


- (IBAction)chooseCategoryButtonPress:(UIButton*)sender
{
    [self.delegate switchCategory:@"111"];
}

- (IBAction)chooseStaffButtonPress:(UIButton*)sender
{
    
}

- (IBAction)chooseBirthdayButtonPress:(UIButton*)sender
{
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *result = [[textField text] stringByReplacingCharactersInRange:range withString:string];
    NSInteger tag = [textField tag];
    switch (tag)
    {
        case InputFieldTagName:
            self.customerName = result;
            break;
        case InputFieldTagTel:
            self.customerTelephone = result;
            break;
        case InputFieldTagUnit:
            if ([[MathFunction mathFunctionInstance] isPureInt:result])
            {
                self.units = result;
            }
            else
            {
                return NO;
            }
            break;
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSInteger tag = [textField tag];
    switch (tag)
    {
        case InputFieldTagName:
            self.customerName = textField.text;
            break;
        case InputFieldTagTel:
            self.customerTelephone = textField.text;
            break;
        case InputFieldTagUnit:
            if ([[MathFunction mathFunctionInstance] isPureInt:textField.text])
            {
                self.units = textField.text;
            }
            break;
    }
    NSLog(@"result : %@", textField.text);
}


@end
