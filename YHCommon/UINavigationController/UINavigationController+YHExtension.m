//
//  UINavigationController+YHExtension.m
//  YHCommonDemo
//
//  Created by 王时温 on 16/3/10.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import "UINavigationController+YHExtension.h"


@implementation UINavigationController (YHExtension)

- (void)pushViewController:(UIViewController *)viewController removeOtherViewController:(UIViewController *)otherViewController animated:(BOOL)animated {
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
    [viewControllers removeObject:otherViewController];
    [viewControllers addObject:viewController];
    [self setViewControllers:viewControllers animated:animated];
}

@end
