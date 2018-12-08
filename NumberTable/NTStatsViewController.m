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
    
    [_statsViewModel analyze];
    self.minimumLabel.text = _statsViewModel.minimum;
    self.maximumLabel.text = _statsViewModel.maximum;
    self.averageLabel.text = _statsViewModel.average;
    _chartView.values = [_statsViewModel prepareChartInformation: (int)_chartOptionsSlider.value];
    [_chartView setNeedsDisplay];
    _sliderValueLabel.text = [NSString stringWithFormat:@"%d",(int)_chartOptionsSlider.value];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (IBAction)changeSliderValue:(UISlider *)sender{
    _sliderValueLabel.text = [NSString stringWithFormat:@"%d",(int)_chartOptionsSlider.value];
    _chartView.values = [_statsViewModel prepareChartInformation: (int)_chartOptionsSlider.value];
    [_chartView setNeedsDisplay];
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
