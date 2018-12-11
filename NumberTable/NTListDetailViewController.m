//
//  ListDetailViewController.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListDetailViewController.h"

@interface NTListDetailViewController ()
@property (nonatomic,retain) UIImage *favouriteImage;
@property (nonatomic,retain) UIImage *unFavouriteImage;

@property (retain, nonatomic) IBOutlet UITextField *changeTextField;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *favouritesBarButtonItem;


- (IBAction)saveAction:(UIButton *)sender;
- (IBAction)onClickFavouritesBarButtonItem:(UIBarButtonItem *)sender;

@end

@implementation NTListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.favouriteImage = [UIImage imageNamed:@"favourite.png"];
    self.unFavouriteImage = [UIImage imageNamed:@"unfavourite.png"];
    self.changeTextField.text = [NSString stringWithFormat:@"%f", self.listDetailViewModel.number];
    if (self.listDetailViewModel.isFavourite){
        [self.favouritesBarButtonItem setImage: self.favouriteImage];
    }else{
        [self.favouritesBarButtonItem setImage: self.unFavouriteImage];
    }
}



- (void)dealloc {
    [_changeTextField release];
    [_favouritesBarButtonItem release];
    [super dealloc];
}

- (IBAction)saveAction:(UIButton *)sender {
    [self.delegate save: [self.changeTextField.text floatValue] userInfo: [[NSString stringWithFormat:@"%@",self.listDetailViewModel.userInfo]integerValue]];
}

- (IBAction)onClickFavouritesBarButtonItem:(UIBarButtonItem *)sender {

    [self.delegate onClicBarButton: self.listDetailViewModel.isFavourite userInfo: [[NSString stringWithFormat:@"%@",self.listDetailViewModel.userInfo]integerValue]];
    self.listDetailViewModel.isFavourite = !self.listDetailViewModel.isFavourite;
    if (self.listDetailViewModel.isFavourite){
        [self.favouritesBarButtonItem setImage: self.favouriteImage];
    }else{
        [self.favouritesBarButtonItem setImage: self.unFavouriteImage];
    }
}
@end
