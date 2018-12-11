//
//  NumberConverter.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTNumberConverter.h"

@interface NTNumberConverter()

@property (nonatomic, retain)NSArray* upToTen;
@property (nonatomic, retain)NSArray* upToNinety;
@property (nonatomic, retain)NSArray* fromTenToTwenty;
@property (nonatomic, retain)NSArray* fractional;
@property (nonatomic, retain)NSString* minus;

@end

@implementation NTNumberConverter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.upToTen = [NSArray arrayWithObjects:@"Ноль", @"Один", @"Два", @"Три", @"Четыре", @"Пять",
                   @"Шесть", @"Семь", @"Восемь", @"Девять", nil];
        self.upToNinety = [NSArray arrayWithObjects:@"Двадцать", @"Тридцать", @"Сорок", @"Пятьдесят",
                      @"Шестьдесят", @"Семьдесят", @"Восемьдесят", @"Девяносто", nil];
        self.fromTenToTwenty = [NSArray arrayWithObjects:@"Десять", @"Одиннадцать", @"Двенадцать",
                           @"Тринадцать", @"Четырнадцать", @"Пятнадцать", @"Шестнадцать",
                           @"Семнадцать", @"Восемнадцать", @"Девятнадцать", nil];
        self.fractional = [NSArray arrayWithObjects:@"Целых", @"Десятых", @"Сотых", nil];
        self.minus = @"Минус";
        [_upToTen retain];
        [_upToNinety retain];
        [_fromTenToTwenty retain];
        [_fractional retain];
    }
    return self;
}

-(NSString*)convertFloatToWords: (float) number{
    NSString *strNumber = [NSString stringWithFormat:@"%.02f",number];
    NSString* resultString = @"";
    int fractionalPart = -1;
    int integerPart = [strNumber intValue];
    if (number < 0) {
        resultString = [NSString stringWithFormat:@"%@%@", self.minus, resultString];
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
        buf = [self.fractional objectAtIndex:0];
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
        return [NSString stringWithFormat:@"%@ %@",res,[self.fractional objectAtIndex: 1]];
    }
    return [NSString stringWithFormat:@"%@ %@",res,[self.fractional objectAtIndex: 2]];
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
                 return [self.upToTen objectAtIndex: i];
            } else if([type isEqualToString:@"FromTenToTwenty"]){
                return [self.fromTenToTwenty objectAtIndex: i];
            }else if ([type isEqualToString:@"UpToNinety"]){
                return [self.upToNinety objectAtIndex: i-2];
            }
        }
    }
    return @"222";
}

- (void)dealloc
{
    [_upToTen release];
    [_upToNinety release];
    [_fromTenToTwenty release];
    [_fractional release];
    [super dealloc];
}

@end
