//
//  StatsViewController.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTStatsViewController.h"

@interface NTStatsViewController ()

@property (retain, nonatomic) IBOutlet UILabel *minimumLabel;
@property (retain, nonatomic) IBOutlet UILabel *maximumLabel;
@property (retain, nonatomic) IBOutlet UILabel *averageLabel;
@property (retain, nonatomic) IBOutlet UISlider *chartOptionsSlider;
@property (retain, nonatomic) IBOutlet NTChartView *chartView;
@property (retain, nonatomic) IBOutlet UILabel *sliderValueLabel;
- (IBAction)changeSliderValue:(UISlider *)sender;
@end

@implementation NTStatsViewController



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.statsViewModel analyze];
    self.minimumLabel.text = self.statsViewModel.minimum;
    self.maximumLabel.text = self.statsViewModel.maximum;
    self.averageLabel.text = self.statsViewModel.average;
    self.chartView.values = [self.statsViewModel prepareChartInformation: (int)self.chartOptionsSlider.value];
    [self.chartView setNeedsDisplay];
    self.sliderValueLabel.text = [NSString stringWithFormat:@"%d",(int)self.chartOptionsSlider.value];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (IBAction)changeSliderValue:(UISlider *)sender{
    self.sliderValueLabel.text = [NSString stringWithFormat:@"%d",(int)self.chartOptionsSlider.value];
    self.chartView.values = [self.statsViewModel prepareChartInformation: (int)self.chartOptionsSlider.value];
    [self.chartView setNeedsDisplay];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_minimumLabel release];
    [_maximumLabel release];
    [_averageLabel release];
    [_chartOptionsSlider release];
    [_chartView release];
    [_sliderValueLabel release];
    [super dealloc];
}

@end
