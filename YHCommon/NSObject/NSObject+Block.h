//
//  NSObject+Block.h
//  GB_Football
//
//  Created by wsw on 16/8/2.
//  Copyright © 2016年 Go Brother. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Block)

/**
 延时调用

 @param block 时间到了的回调block
 @param delay 延时时长
 */
- (void)performBlock:(void(^)(void))block delay:(NSTimeInterval)delay;

@end
