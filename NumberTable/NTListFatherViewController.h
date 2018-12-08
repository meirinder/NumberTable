//
//  ListFatherViewController.h
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTListTableViewCell.h"
#import "NTListViewModel.h"
#import "NTFavouritesViewModel.h"
#import "NTItem.h"
#import "NTNumberTableViewCellDelegate.h"




NS_ASSUME_NONNULL_BEGIN

@interface NTListFatherViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,NTNumberTableViewCellDelegate>



@property (retain, nonatomic) IBOutlet UITableView *listTableView;


@property (nonatomic,retain) UIImage *favouriteImage;
@property (nonatomic,retain) UIImage *unFavouriteImage;

@end

NS_ASSUME_NONNULL_END
