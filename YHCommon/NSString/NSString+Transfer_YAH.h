//
//  NSString+Transfer.h
//  YHCommonDemo
//
//  Created by yahua on 16/5/23.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Transfer_YAH)

/** 首字符的中文拼音的首字母 (如果首字符不是中文则返回nil)*/
- (NSString *)firstCharPinyinFirstLetter;

@end
