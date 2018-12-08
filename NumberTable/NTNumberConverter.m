//
//  NumberConverter.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTNumberConverter.h"

@implementation NTNumberConverter

NSArray* upToTen;
NSArray* upToNinety;
NSArray* fromTenToTwenty;
NSArray* fractional;
NSString* minus;

- (instancetype)init
{
    self = [super init];
    if (self) {
        upToTen = [NSArray arrayWithObjects:@"Ноль", @"Один", @"Два", @"Три", @"Четыре", @"Пять",
                   @"Шесть", @"Семь", @"Восемь", @"Девять", nil];
        upToNinety = [NSArray arrayWithObjects:@"Двадцать", @"Тридцать", @"Сорок", @"Пятьдесят",
                      @"Шестьдесят", @"Семьдесят", @"Восемьдесят", @"Девяносто", nil];
        fromTenToTwenty = [NSArray arrayWithObjects:@"Десять", @"Одиннадцать", @"Двенадцать",
                           @"Тринадцать", @"Четырнадцать", @"Пятнадцать", @"Шестнадцать",
                           @"Семнадцать", @"Восемнадцать", @"Девятнадцать", nil];
        fractional = [NSArray arrayWithObjects:@"Целых", @"Десятых", @"Сотых", nil];
        minus = @"Минус";
        [upToTen retain];
        [upToNinety retain];
        [fromTenToTwenty retain];
        [fractional retain];
    }
    return self;
}



-(NSString*)convertFloatToWords: (float) number{
    NSString *strNumber = [NSString stringWithFormat:@"%.02f",number];
    NSString* resultString = @"";

    int fractionalPart = -1;
    int integerPart = [strNumber intValue];
    if (number < 0) {
        resultString = [NSString stringWithFormat:@"%@%@",minus, resultString];
        integerPart *= -1;
        if ((number > 9) || (number < -9)) {
            fractionalPart = [[strNumber substringFromIndex:4] intValue];
        }else{
             fractionalPart = [[strNumber substringFromIndex:3] intValue];
        }
    } else{
        if (number > 9) {
            fractionalPart = [[strNumber substringFromIndex:3] intValue];
        }else{
            fractionalPart = [[strNumber substringFromIndex:2] intValue];
        }
    }

    NSString *buf = @"";
    if (number != (int)number){
        buf = [fractional objectAtIndex:0];
    }
    resultString = [NSString stringWithFormat:@"%@ %@ %@ %@",resultString, [self convertIntegerPartOfNumber: integerPart], buf, [self convertFractionalPartOfNumber: fractionalPart]];
    return resultString;
}





-(NSString*)convertFractionalPartOfNumber:(int) number{

    if (number == 0){
        return @"";
    }
    BOOL isHundredths = YES;
    if(number %  10 == 0){
        number /= 10;
        isHundredths = !isHundredths;
    }
    
    NSString *res = [self convertIntegerPartOfNumber: number];
    if (!isHundredths) {
        return [NSString stringWithFormat:@"%@ %@",res,[fractional objectAtIndex: 1]];
    }
    return [NSString stringWithFormat:@"%@ %@",res,[fractional objectAtIndex: 2]];
}


-(NSString*)convertIntegerPartOfNumber:(int) number{
    if (number < 10){
        return [self selectNumberFormOneToNine:number withType:@"UpToTen"];
    }else if ((number > 19)&&(number < 100)){
        NSString* ones;
        NSString* tens = [self selectNumberFormOneToNine: number / 10 withType:@"UpToNinety"];
        if (number % 10 != 0){
            ones = [self selectNumberFormOneToNine: number % 10 withType:@"UpToTen"];
        }else{
            ones = @"";
        }
        
        return [NSString stringWithFormat:@"%@ %@", tens, ones];
        
    }else{
        int tmp = number % 10;
        return [self selectNumberFormOneToNine:tmp withType:@"FromTenToTwenty"];
    }
    return @"Ошибка";
}

-(NSString*)selectNumberFormOneToNine:(int) number withType:(NSString*) type{
    for (int i = 0; i < 10; i++) {
        if (number == i) {
            if ([type  isEqualToString: @"UpToTen"]){
                 return [upToTen objectAtIndex: i];
            } else if([type isEqualToString:@"FromTenToTwenty"]){
                return [fromTenToTwenty objectAtIndex: i];
            }else if ([type isEqualToString:@"UpToNinety"]){
                return [upToNinety objectAtIndex: i-2];
            }
        }
    }
    return @"222";
}

- (void)dealloc
{
    [upToTen release];
    [upToNinety release];
    [fromTenToTwenty release];
    [fractional release];
    
    [super dealloc];
}

@end
