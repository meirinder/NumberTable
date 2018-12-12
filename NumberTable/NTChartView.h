//
//  ChartUIView.h
//  NumberTable
//
//  Created by Savely on 06.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTChartView : UIView

@property (nonatomic,retain) NSMutableArray *values;
@property (nonatomic,retain) IBInspectable UIColor *colorOfInscription;
@property (nonatomic,retain) IBInspectable UIColor *colorOfCoordinateGrid;
@property (nonatomic,retain) IBInspectable UIColor *backGroundColor;


@end

NS_ASSUME_NONNULL_END
