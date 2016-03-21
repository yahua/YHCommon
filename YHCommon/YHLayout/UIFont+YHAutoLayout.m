//
//  UIFont+YHAutoLayout.m
//  TestAutoLayer
//
//  Created by yahua on 16/3/14.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import "UIFont+YHAutoLayout.h"

#define kStandardWidth 540
#define kAutoLayoutScale  ([UIScreen mainScreen].bounds.size.width*1.0/kStandardWidth)

@implementation UIFont (YHAutoLayout)

+ (UIFont *)autoFontOfSize:(CGFloat)size {
    
    size = size * kAutoLayoutScale;
    return [UIFont systemFontOfSize:size];
}

@end
