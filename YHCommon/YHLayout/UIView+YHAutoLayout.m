//
//  UIView+YHLayout.m
//  TestAutoLayer
//
//  Created by yahua on 16/3/14.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import "UIView+YHAutoLayout.h"
#import "UIView+YHLayout.h"

#import <objc/runtime.h>

#define kYHAutoLayoutScale  ([UIScreen mainScreen].bounds.size.width*1.0/[UIView standardWidth])

@implementation UIView (YHAutoLayout)

static char kStandardWidth;
+ (void)setStandardUIWidth:(CGFloat)width {
    
    objc_setAssociatedObject(self, &kStandardWidth, @(width), OBJC_ASSOCIATION_RETAIN);
}

+ (CGFloat)standardWidth {
    
    NSNumber *width = objc_getAssociatedObject(self, &kStandardWidth);
    return [width floatValue];
}

#pragma mark - positon and size

- (void)auto_left:(CGFloat)left {
    
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(left*kYHAutoLayoutScale, CGRectGetMinY(oldFrame), CGRectGetWidth(oldFrame), CGRectGetHeight(oldFrame));
    self.frame = newFrame;
}

- (void)auto_top:(CGFloat)top {
    
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(CGRectGetMinX(oldFrame), top*kYHAutoLayoutScale, CGRectGetWidth(oldFrame), CGRectGetHeight(oldFrame));
    self.frame = newFrame;
}

- (void)auto_right:(CGFloat)right {
    
    UIView *superView = self.superview;
    if (!superView) {
        return;
    }
    self.left = superView.width-right*kYHAutoLayoutScale-CGRectGetWidth(self.frame);
}

- (void)auto_bottom:(CGFloat)bottom {
    
    UIView *superView = self.superview;
    if (!superView) {
        return;
    }
    self.top = superView.height-bottom*kYHAutoLayoutScale-CGRectGetHeight(self.frame);
}

- (void)auto_width:(CGFloat)width {
    
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(CGRectGetMinX(oldFrame), CGRectGetMinY(oldFrame), width*kYHAutoLayoutScale, CGRectGetHeight(oldFrame));
    self.frame = newFrame;
}

- (void)auto_height:(CGFloat)height {
    
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(CGRectGetMinX(oldFrame), CGRectGetMinY(oldFrame), CGRectGetWidth(oldFrame), height*kYHAutoLayoutScale);
    self.frame = newFrame;
}

- (void)auto_size:(CGSize)size {
    
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(CGRectGetMinX(oldFrame), CGRectGetMinY(oldFrame), size.width*kYHAutoLayoutScale, size.height*kYHAutoLayoutScale);
    self.frame = newFrame;
}

- (void)auto_frame:(CGRect)frame {
    
    CGRect newFrame = CGRectMake(CGRectGetMinX(frame)*kYHAutoLayoutScale, CGRectGetMinY(frame)*kYHAutoLayoutScale, CGRectGetWidth(frame)*kYHAutoLayoutScale, CGRectGetHeight(frame)*kYHAutoLayoutScale);
    self.frame = newFrame;
}

#pragma mark - for other view

- (void)auto_top:(CGFloat)top FromView:(UIView *)view {
    
    CGFloat topRatio = top / [UIView standardWidth];
    CGFloat topValue = topRatio * self.superview.width;
    [self top:topValue FromView:view];
}

- (void)auto_bottom:(CGFloat)bottom FromView:(UIView *)view {
    
    CGFloat bottomRatio = bottom / [UIView standardWidth];
    CGFloat bottomValue = bottomRatio * self.superview.width;
    [self bottom:bottomValue FromView:view];
}

- (void)auto_left:(CGFloat)left FromView:(UIView *)view {
    
    CGFloat leftRatio = left / [UIView standardWidth];
    CGFloat leftValue = leftRatio * self.superview.width;
    [self left:leftValue FromView:view];
}

- (void)auto_right:(CGFloat)right FromView:(UIView *)view {
    
    CGFloat rightRatio = right / [UIView standardWidth];
    CGFloat rightValue = rightRatio * self.superview.width;
    [self right:rightValue FromView:view];
}

#pragma mark - for parent

- (void)auto_topInContainer:(CGFloat)top {
    
    CGFloat topRatio = top / [UIView standardWidth];
    CGFloat topValue = topRatio * self.superview.width;
    [self topInContainer:topValue shouldResize:YES];
}

- (void)auto_bottomInContainer:(CGFloat)bottom {
    
    CGFloat bottomRatio = bottom / [UIView standardWidth];
    CGFloat bottomValue = bottomRatio * self.superview.width;
    [self bottomInContainer:bottomValue shouldResize:YES];
}

- (void)auto_leftInContainer:(CGFloat)left {
    
    CGFloat leftRatio = left / [UIView standardWidth];
    CGFloat leftValue = leftRatio * self.superview.width;
    [self leftInContainer:leftValue shouldResize:YES];
}

- (void)auto_rightInContainer:(CGFloat)right {
    
    CGFloat rightRatio = right / [UIView standardWidth];
    CGFloat rightValue = rightRatio * self.superview.width;
    [self rightInContainer:rightValue shouldResize:YES];
}


@end
