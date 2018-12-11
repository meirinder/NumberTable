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
    self.changeTextField.text = [NSString stringWithFormat:@"%f", _listDetailViewModel.number];
    if (_listDetailViewModel.isFavourite){
        [_favouritesBarButtonItem setImage: _favouriteImage];
    }else{
        [_favouritesBarButtonItem setImage: _unFavouriteImage];
    }
}



- (void)dealloc {
    [_changeTextField release];
    [_favouritesBarButtonItem release];
    [super dealloc];
}
- (IBAction)saveAction:(UIButton *)sender {
    [_delegate save: [_changeTextField.text floatValue] userInfo: [[NSString stringWithFormat:@"%@",_listDetailViewModel.userInfo]integerValue]];
}

- (IBAction)onClickFavouritesBarButtonItem:(UIBarButtonItem *)sender {

    [_delegate onClicBarButton: _listDetailViewModel.isFavourite userInfo: [[NSString stringWithFormat:@"%@",_listDetailViewModel.userInfo]integerValue]];
    self.listDetailViewModel.isFavourite = !_listDetailViewModel.isFavourite;
    if (_listDetailViewModel.isFavourite){
        [_favouritesBarButtonItem setImage: _favouriteImage];
    }else{
        [_favouritesBarButtonItem setImage: _unFavouriteImage];
    }
}
@end
