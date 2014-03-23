//
//  DateFunction.m
//  TimeCounter
//
//  Created by 張星星 on 12/3/31.
//  Copyright (c) 2012年 Mountain Star Smart. All rights reserved.
//

#import "DateFunction.h"

@implementation DateFunction

+ (DateFunction*)dateFunctionInstance
{
    static id dateFunctionInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFunctionInstance = [DateFunction new];
    });
    
    return dateFunctionInstance;
}
#pragma mark 民國年轉西元日期
- (NSDate*)chinsesDateToDate:(NSString*)dateString
{
    if ([dateString length] < 9)
    {
        return [NSDate date];
    }
    NSRange range = NSMakeRange(0, 3);
    NSInteger year = [[dateString substringWithRange:range] integerValue];
    range = NSMakeRange(4, 2);
    NSInteger mon = [[dateString substringWithRange:range] integerValue];
    range = NSMakeRange(7, 2);
    NSInteger day = [[dateString substringWithRange:range] integerValue];
    if (year < 1911)
        year += 1911;
    NSString *newDate = [NSString stringWithFormat:@"%04i/%02i/%02i", year, mon, day];
    return [self StringToDate:newDate];
}

#pragma mark 西元年轉民國年(字串)
- (NSString*)dateToChineseDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    NSArray *dateCom = [strDate componentsSeparatedByString:@"/"];
    if ([dateCom count] == 3)
    {
        NSUInteger year = [[dateCom objectAtIndex:0] integerValue];
        NSUInteger mon = [[dateCom objectAtIndex:1] integerValue];
        NSUInteger day = [[dateCom objectAtIndex:2] integerValue];
        if (year > 1911)
            year -= 1911;
        return [NSString stringWithFormat:@"%03i/%02i/%02i", year, mon, day];
    }
    return [NSString stringWithFormat:@"000/01/01"];
}
#pragma mark 西元日期轉字串
- (NSString*)DateToString:(NSDate*) aDate
{
    if (aDate == nil)
        return @"";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:aDate];
    return strDate;
}
#pragma mark 西元日期轉日期字串
- (NSString*)DateToFullString:(NSDate *)aDate
{
    if (aDate == nil)
        return @"";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:aDate];
    return strDate;
}
#pragma mark 西元日期取得時間格式(HH:mm)
- (NSString*)GetTimeFormatWithDate:(NSDate*)date
{
    if (date == nil)
        return @"";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

#pragma mark 西元字串轉日期
- (NSDate*)StringToDate:(NSString*) aString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSDate *date = [dateFormatter dateFromString:aString];
    return date;
}
#pragma mark 字串轉日期格式
- (NSDate*)FullStringToDate:(NSString *)aString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:aString];
    return date;
}
#pragma mark 字串轉日期(秒格式為00)
- (NSDate*)FullStringToDateWithoutSecond:(NSString *)aString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSDate *date = [dateFormatter dateFromString:aString];
    return date;
}

#pragma mark 字串取得年月(102/01)
- (NSString*)GetYearAndMonthWithDate:(NSString *)dateString
{
    NSDate *aDate = [self StringToDate:dateString];
    //取得年、月、曰
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | 
    NSMonthCalendarUnit |
    NSDayCalendarUnit | 
    NSWeekdayCalendarUnit | 
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    //NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:aDate];
    NSInteger year =[comps year];       //年
    NSInteger mon = [comps month];     //月
    NSString *yearMonString = [NSString stringWithFormat:@"%02i-%02i",year,mon];
    return yearMonString;
}
#pragma mark - 判斷日期間距
- (NSString*)GetDaysBetweenDate1:(NSDate*)date1 andDate2:(NSDate*)date2
{
    NSTimeInterval intervals = [date1 timeIntervalSinceDate:date2];
    NSInteger days = 0;
    if (intervals <= 0)
        days = -1;
    else 
    {
        NSNumber *result =  [NSNumber numberWithDouble:(int)intervals / (60 * 60 * 24)];
        days = [result integerValue];
        days = 30 - days;
    }
    return [NSString stringWithFormat:@"%i",days];
}

#pragma mark 取得每週的星期幾
- (NSInteger)GetWeekdayOfDate:(NSDate*)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSWeekdayOrdinalCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSUInteger weekday = [comps weekday];
    return weekday;
}
#pragma mark 計算實際年齡
- (NSInteger)calculateRealAge:(NSDate *)dateOfBirth;
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *dateComponentsNow = [calendar components:unitFlags fromDate:[NSDate date]];
    NSDateComponents *dateComponentsBirth = [calendar components:unitFlags fromDate:dateOfBirth];
    
    if (([dateComponentsNow month] < [dateComponentsBirth month]) ||
        (([dateComponentsNow month] == [dateComponentsBirth month]) && ([dateComponentsNow day] < [dateComponentsBirth day])))
    {
        return [dateComponentsNow year] - [dateComponentsBirth year] - 1;
    }
    else
    {
        return [dateComponentsNow year] - [dateComponentsBirth year];
    }
}

#pragma mark 計算保險年齡
- (NSInteger)calculateInsuranceAge:(NSDate *)dateOfBirth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger insurAge = 0;
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *addComponents = [[NSDateComponents alloc] init];
    [addComponents setMonth:-6];
    NSDate *cntBirthDate = [calendar dateByAddingComponents:addComponents toDate:dateOfBirth options:0];
    NSDateComponents *dateComponentsNow = [calendar components:unitFlags fromDate:[NSDate date]];
    NSDateComponents *dateComponentsBirth = [calendar components:unitFlags fromDate:cntBirthDate];
    if (([dateComponentsNow month] < [dateComponentsBirth month]) ||
        (([dateComponentsNow month] == [dateComponentsBirth month]) && ([dateComponentsNow day] <= [dateComponentsBirth day])))
    {
        insurAge = [dateComponentsNow year] - [dateComponentsBirth year] - 1;
    }
    else
    {
        insurAge = [dateComponentsNow year] - [dateComponentsBirth year];
    }
    if (insurAge > 1911)
    {
        insurAge -= 1911;
    }
    return insurAge;
}

#pragma mark 判斷是否為潤年
- (BOOL)checkIsLeapYearOfYear:(NSUInteger)year
{
    if (year < 1911)
    {
        year += 1911;
    }
    if (year % 400 == 0)
    {
        return YES;
    }
    else if (year % 100 == 0)
    {
        return YES;
    }
    else if (year % 4 == 0)
    {
        return YES;
    }
    return NO;
}
@end
