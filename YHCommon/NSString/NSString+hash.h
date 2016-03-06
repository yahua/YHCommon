//
//  NSString+MD5.h
//  YHCommonDemo
//
//  Created by 王时温 on 16/3/4.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (hash)

- (NSString *)MD5;

- (NSString *)hmacSha1WithKey:(NSString*)key;

@end