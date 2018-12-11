//
//  ChartUIView.m
//  NumberTable
//
//  Created by Savely on 06.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTChartView.h"


@implementation NTChartView


// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    CGRect drawRect = CGRectMake(rect.origin.x, rect.origin.y,rect.size.width, rect.size.height);
    CGContextSetRGBFillColor(context, 130.0f/255.0f, 60.0f/255.0f, 180.0f/255.0f, 1.0f);
    CGContextFillRect(context, drawRect);
    [self drawInscriptions:rect context:context];
    
    [self drawCoordinateGrid:rect context:context ];

}

-(void) drawCoordinateGrid:(CGRect) rect context:(CGContextRef) context{
    
    int bottomIndent = 32;
    CGContextFillRect(context, CGRectMake(rect.size.width/2-1, 0, 2, rect.size.height));
    CGContextFillRect(context, CGRectMake(0, rect.size.height-bottomIndent, rect.size.width,2));
    int max = [self maxCount];
    double nintyPersent = 0.9;
    int verticalSize;
    int step = [self setStep];
    int part = [self setPart:step];
   
    for (int i = 0 ; i<part; i++) {
        CGContextSetRGBFillColor(context, 0, 255, 0, 0.5);
        verticalSize = (i*(rect.size.height-bottomIndent)/max)*nintyPersent*step;
        
        CGContextFillRect(context, CGRectMake(rect.size.width/2-5, rect.size.height-verticalSize - bottomIndent, 10, 2));
        
        NSString *text = [NSString stringWithFormat:@"%d", i*step];
        CGRect recte = CGRectMake(rect.size.width/2 + 8, rect.size.height-verticalSize - bottomIndent -6 , 50, 20);
        [text drawInRect:recte withAttributes:@{}];
    }
}

-(int)setPart:(int)step{
    int max = [self maxCount];
    int part = max / step + 1;
    if (max%step != 0) {
        part++;
    }
    return part;
}

-(int)setStep{
    int max = [self maxCount];
    int step;
    if (max <= 30){
        step = max/10+1;
    }else if (max <= 50){
        step = 5;
    }else if (max <= 100){
        step = 10;
    }else if(max <= 250){
        step = 25;
    }else{
        step = 50;
    }
    return step;
}

-(void) drawInscriptions:(CGRect)rect context:(CGContextRef) context{
    double nintyPersent = 0.9;
    int horizontalStep = rect.size.width / _values.count;
    int verticalSize;
    int bottomIndent = 32;
    int lateralIndent = 10;
    long textValue = 100/[_values count] - 100;
    for (int i = 0; i < _values.count; i++) {
        verticalSize = ([_values[i] intValue]*(rect.size.height-bottomIndent)/([self maxCount]))*nintyPersent;
        
        if (verticalSize != 0){
            
            CGContextSetRGBFillColor(context, 255, 0, 0, 1);
            CGContextFillRect(context, CGRectMake(i*horizontalStep+horizontalStep/lateralIndent, rect.size.height-verticalSize - bottomIndent, rect.size.width / _values.count - horizontalStep/(lateralIndent/2), verticalSize));
            
            
        }
        CGContextSetRGBFillColor(context, 0, 255, 0, 0.5);
        CGContextFillRect(context, CGRectMake(i*horizontalStep+horizontalStep/lateralIndent + (rect.size.width / _values.count - horizontalStep/(lateralIndent/2))/2, rect.size.height-bottomIndent , 2, 8));
        
    }
    for (int i = 0; i < [_values count]/2; i++) {
        NSString *text = [NSString stringWithFormat:@"%ld", textValue];
        CGRect recte = CGRectMake(i*horizontalStep+horizontalStep/lateralIndent - 7 + (rect.size.width / _values.count - horizontalStep/(lateralIndent/2))/2, rect.size.height-bottomIndent+8, 50, 20);
        
        [text drawInRect:recte withAttributes:@{}];
        
        text = [NSString stringWithFormat:@"%ld", textValue*(-1)];
        recte = CGRectMake(rect.size.width - (i*horizontalStep+horizontalStep/10 + 5 + (rect.size.width / _values.count - horizontalStep/5)/2), rect.size.height-bottomIndent+8, 50, 20);
        [text drawInRect:recte withAttributes:@{}];
        
        double tmp = 200/[_values count];
        textValue += (int)tmp;
    }
    CGContextSetRGBFillColor(context, 0, 255, 0, 0.5);
}


-(int) maxCount{
    int res = - 100;
    for (int i = 0;i < _values.count; i++) {
        if (res<[_values[i] intValue]) {
            res = [_values[i] intValue];
        }
    }
    return res;
}

@end
