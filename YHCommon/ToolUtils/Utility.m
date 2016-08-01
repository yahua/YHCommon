//
//  Utility.m
//  GB_Football
//
//  Created by weilai on 16/2/18.
//  Copyright © 2016年 GoBrother. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "Utility.h"

#define LS(key) NSLocalizedString(key, nil)
#define CV_PI   3.1415926535897932384626433832795

@implementation Utility

NSError *makeError(NSInteger errorCode, NSString *description)
{
    NSString *desc = description;
    if (desc == nil) {
        desc = LS(@"ErrorDefault");
    }
    
    return [[NSError alloc] initWithDomain:@"T-go" code:errorCode userInfo:@{NSLocalizedDescriptionKey: desc}];
}

+ (ScreenSizeMode)getScreenSizeMode
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    NSInteger screenHeight = screenSize.size.height;
    if (screenHeight == 480)
    {
        return ScreenSizeMode_35;
    }
    else if (screenHeight == 568)
    {
        return ScreenSizeMode_40;
    }
    else if (screenHeight == 667)
    {
        return ScreenSizeMode_47;
    }
    else if (screenHeight == 736)
    {
        return ScreenSizeMode_55;
    }
    else if (screenHeight == 1024)
    {
        return ScreenSizeMode_97;
    }
    return ScreenSizeMode_35;
}
//版本
+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //NSString *name = [infoDictionary objectForKey:@"CFBundleName"];
    NSString *name = @"版本";
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    NSString *build = [infoDictionary objectForKey:@"CFBundleVersion"];
//    NSString *label = [NSString stringWithFormat:@"%@ v%@.%@", name, version, build];
    NSString *label = [NSString stringWithFormat:@"%@ v%@", name, version];
    return label;
}

// 版本号
+ (NSInteger)appVersionCode
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    return build ? [build integerValue] : 0;
}

// 包名
+ (NSString *)appBundleIdentifier
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleIdentifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    
    return bundleIdentifier;
}

// 计算年龄
+ (NSString*)fromDateToAge:(NSDate*)date
{

    NSDate *myDate = date;
    NSDate *nowDate = [NSDate date];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSYearCalendarUnit;
    
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:myDate toDate:nowDate options:0];
    NSInteger year = [comps year];
    
    return [NSString stringWithFormat:@"%lu", (long)year];
}

+ (BOOL)createFolderWithFolder:(NSString *)folder
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *parentFolder = [folder stringByDeletingLastPathComponent];
    BOOL isDir = YES;
    BOOL isExists = [fileManager fileExistsAtPath:folder isDirectory:&isDir];
    if (isExists && isDir)
    {
        return YES;
    }
    if (![parentFolder isEqualToString:@"/"] && ![fileManager fileExistsAtPath:parentFolder])
    {
        if (![Utility createFolderWithFolder:parentFolder])
        {
            return NO;
        };
    }
    if (![fileManager fileExistsAtPath:folder])
    {
        NSError *error = nil;
        [fileManager createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:&error];
        if (error)
        {
            return NO;
        }
    }
    return YES;
}


//Dictionary转string
+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [Utility jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"%@:%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

+(NSString *) jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [Utility jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [Utility jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [Utility jsonStringWithArray:object];
    }
    return value;
}

+(NSString *) jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"%@",
            [string stringByReplacingOccurrencesOfString:@"\n" withString:@""]
            ];
}

+(NSString *) jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [Utility jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

// 计算星期几
+ (NSString *)weekFromDate:(long)dateValue
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateValue];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekdayCalendarUnit fromDate:date];
    
    // 1(星期天) 2(星期一) 3(星期二) 4(星期三) 5(星期四) 6(星期五) 7(星期六)
    NSInteger weekDay = [comp weekday];
    switch (weekDay) {
        case 2:
            return LS(@"周一");
            
        case 3:
            return LS(@"周二");
            
        case 4:
            return LS(@"周三");
            
        case 5:
            return LS(@"周四");
            
        case 6:
            return LS(@"周五");
            
        case 7:
            return LS(@"周六");
            
        case 1:
            return LS(@"周日");
            
        default:
            break;
    }
    
    return @"";
    
}

// 获取当月的天数
+ (NSInteger)getNumberOfDaysInMonth:(NSDate *)date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]; // 指定日历的算法
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit
                                   inUnit: NSMonthCalendarUnit
                                  forDate:date];
    return range.length;
}

// 坐标转换
+ (NSArray *)transformPointArray:(NSArray *)fourPoints origPoints:(NSArray *)origPoints size:(CGSize)size tansX:(BOOL)tansX tansY:(BOOL)transY
{
//    if (fourPoints == nil || [fourPoints count] < 4 || origPoints == nil) {
//        return nil;
//    }
    if (fourPoints == nil || origPoints == nil) {
        return nil;
    }
    
//    NSArray *tFourPoints = [Utility minAreaRectPointArray:fourPoints];
//    NSArray *tFourPoints = [Utility minAreaRect:fourPoints];
    NSMutableArray *tFourPoints = [NSMutableArray new];
    [tFourPoints addObjectsFromArray:fourPoints];
    if (tFourPoints == nil || [tFourPoints count] != 6) {
        return nil;
    }
    
    NSMutableArray *transPoints = [NSMutableArray new];
    // 最小外切矩形的size
    NSValue *sizeValue = tFourPoints[4];
    CGSize tSize = [sizeValue CGSizeValue];
    // 旋转角度
    NSNumber *angleValue = tFourPoints[5];
//    double angle = [angleValue doubleValue];
    double angle = (90 - fabs([angleValue doubleValue]))*CV_PI/180.f;
    
    // 坐标系转换的参照点
    CGPoint referPoint = CGPointMake(0, 0);
    int index = -1;
    for (int i = 0; i < 4; i++) {
        NSValue *pointValue = tFourPoints[i];
        CGPoint point = [pointValue CGPointValue];
        
        if (index == -1) {
            referPoint.x = point.x;
            referPoint.y = point.y;
            index = i;
            continue;
        }
        
        if (referPoint.y > point.y) {
            referPoint.x = point.x;
            referPoint.y = point.y;
        } else if (referPoint.y == point.y && referPoint.x > point.x) {
            referPoint.x = point.x;
            referPoint.y = point.y;
        }
    }
    
    // 转化坐标系
    for (NSValue *origPoint in origPoints) {
        CGPoint oPoint = [origPoint CGPointValue];
        
        NSValue *tPointValue = [Utility transformPoint:oPoint referPoint:referPoint origSize:size tranSize:tSize angle:angle tansX:tansX tansY:transY];
        if (tPointValue != nil) {
            [transPoints addObject:tPointValue];
        }
    }
    
    return transPoints;
}

// 转换单点坐标系
+ (NSValue *)transformPoint:(CGPoint)point referPoint:(CGPoint)referPoint origSize:(CGSize)origSize tranSize:(CGSize)tranSize angle:(double)angle tansX:(BOOL)tansX tansY:(BOOL)transY
{
    CGFloat xDist = (point.x - referPoint.x);
    CGFloat yDist = (point.y - referPoint.y);
    double distance = sqrt((xDist * xDist) + (yDist * yDist));
    double pAngle = atan(yDist/xDist);
    pAngle = (pAngle < 0) ? (CV_PI - fabs(pAngle)) : pAngle;
    double tAngle = fabs(pAngle) - fabs(angle);
    // 不在范围内
    if (tAngle > CV_PI/2.f || tAngle < 0.f) {
        return nil;
    }
    
    double txDist = cos(tAngle) * distance;
    double tyDist = sin(tAngle) * distance;
    if (txDist > tranSize.height || tyDist > tranSize.width) {
        return nil;
    }
    
    // 判断坐标是否反转
    CGSize tempTSize;
    double tempTXDist = 0.f;
    double tempTYDist = 0.f;
    if ((origSize.width > origSize.height && tranSize.width > tranSize.height) || (origSize.height > origSize.width && tranSize.height > tranSize.width)) {
        tempTSize.width = tranSize.height;
        tempTSize.height = tranSize.width;
        tempTXDist = txDist;
        tempTYDist = tyDist;
        
    } else {
        tempTSize.width = tranSize.width;
        tempTSize.height = tranSize.height;
        tempTXDist = tyDist;
        tempTYDist = txDist;
    }
    
    double rxDist = origSize.width / tempTSize.width * tempTXDist;
    double ryDist = origSize.height / tempTSize.height * tempTYDist;
    
    if (tansX) {
        rxDist = origSize.width - rxDist;
    }
    
    if (transY) {
        ryDist = origSize.height - ryDist;
    }
    
    CGPoint rPoint = CGPointMake((int)floor(rxDist), (int)floor(ryDist));
    return [NSValue valueWithCGPoint:rPoint];
}

@end
