//
//  TradeInfo.h
//  POS
//
//  Created by Leo Chang on 2/21/14.
//  Copyright (c) 2014 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TradeInfo : NSObject

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *employeeId;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSNumber *count;

/*
 subtotal of price
 */
@property (nonatomic, strong) NSNumber *subtotal;

@end
