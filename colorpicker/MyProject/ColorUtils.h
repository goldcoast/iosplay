//
//  ColorUtils.h
//  Practice
//
//  Created by cindy on 15/11/22.
//  Copyright (c) 2015年 Tait.X. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImageColor : NSObject

+ (int)getNumber;
+ (void)setNumber:(int)number;


+ (NSArray*)getRGBAsFromImage:(UIImage*)image atX:(int)x andY:(int)y count:(int)count;

@end
