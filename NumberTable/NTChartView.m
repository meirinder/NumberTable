//
//  ChartUIView.m
//  NumberTable
//
//  Created by Savely on 06.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTChartView.h"


@implementation NTChartView

int widthOfLAbel = 24;
int heightOfLabel = 21;

// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    CGRect drawRect = CGRectMake(rect.origin.x, rect.origin.y,rect.size.width, rect.size.height);
    CGContextSetRGBFillColor(context, 130.0f/255.0f, 60.0f/255.0f, 180.0f/255.0f, 1.0f);
    CGContextFillRect(context, drawRect);
    
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    int horizontalStep = rect.size.width / _values.count;
    int verticalSize;
    for (int i = 0; i < _values.count; i++) {
        verticalSize = ([_values[i] intValue]*rect.size.height/([self maxCount]))*9/10;
        
        CGContextSetRGBFillColor(context, 255, 0, 0, 1);
        CGContextFillRect(context, CGRectMake(i*horizontalStep+horizontalStep/10, rect.size.height-verticalSize , rect.size.width / _values.count - horizontalStep/5, verticalSize));
       
        CGContextSetRGBFillColor(context, 0, 255, 0, 0.5);
        CGContextFillRect(context, CGRectMake(rect.size.width/2-5, rect.size.height-verticalSize, 10, 2));

        
        [self addSubview:[self makeLabel:[NSString stringWithFormat:@"%d",[_values[i] intValue]] x:rect.size.width/2-5 y:rect.size.height-verticalSize-heightOfLabel/2]];
        
    }
    CGContextSetRGBFillColor(context, 0, 255, 0, 0.5);
    CGContextFillRect(context, CGRectMake(rect.size.width/2-1, 0, 2, rect.size.height));
    
    for (int i = 0 ; i<10; i++) {
        //CGContextFillRect(context, CGRectMake(rect.size.width/2-5, rect.size.height*i/10*11/10-1, 10, 2));
        //[self addSubview:[self makeLabel:@"-100" x:rect.size.width/2-5 y:rect.size.height*i/10*11/10-1-heightOfLabel]];
    }



    
    
    
    [self addSubview:[self makeLabel:@"-100" x:0 y:rect.size.height-heightOfLabel]];
    [self addSubview:[self makeLabel:@"100" x:rect.size.width - widthOfLAbel y:rect.size.height-heightOfLabel]];
    [self addSubview:[self makeLabel:@"0" x:(rect.size.width - widthOfLAbel)/2 y:rect.size.height-heightOfLabel]];
    [self addSubview:[self makeLabel:@"-50" x:(rect.size.width - widthOfLAbel)/4 y:rect.size.height-heightOfLabel]];
    [self addSubview:[self makeLabel:@"50" x:(rect.size.width - widthOfLAbel)/4*3 y:rect.size.height-heightOfLabel]];


    
}

-(UILabel*)makeLabel:(NSString*)text x: (int) x y:(int) y {
    UILabel *scaleNumber = [[UILabel alloc] initWithFrame:CGRectMake(x, y, widthOfLAbel, heightOfLabel)];
    scaleNumber.textColor = [UIColor yellowColor];
    scaleNumber.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    scaleNumber.text = text;
    scaleNumber.textAlignment = NSTextAlignmentCenter;
   // scaleNumber.adjustsFontSizeToFitWidth = YES;
    [scaleNumber setFont:[UIFont fontWithName:@"Helvetica" size:10.0]];
    [scaleNumber autorelease];
    return scaleNumber;
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
