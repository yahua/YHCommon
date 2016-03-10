//
//  UINavigationController+YHExtension.h
//  YHCommonDemo
//
//  Created by 王时温 on 16/3/10.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (YHExtension)

/**
 *  @author wangsw, 16-03-10 16:03:31
 *
 *  push时移除已存在的某个控制器
 *
 *  @param viewController      要push的viewcontroller
 *  @param otherViewController 要remove的viewcontroller
 *  @param animated            是否显示动画
 */
- (void)pushViewController:(UIViewController *)viewController removeOtherViewController:(UIViewController *)otherViewController animated:(BOOL)animated;

@end
