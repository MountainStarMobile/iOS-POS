//
//  ProductItem.h
//  POS
//
//  Created by Leo Chang on 2/19/14.
//  Copyright (c) 2014 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductItem : NSObject

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *stock;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSString *imageUrl;

@end
