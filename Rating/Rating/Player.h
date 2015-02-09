//
//  Player.h
//  Rating
//
//  Created by Tait on 15/2/9.
//  Copyright (c) 2015年 Tait. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

@end
