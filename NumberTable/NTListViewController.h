//
//  ListViewController.h
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListFatherViewModel.h"
#import "NTListDetailViewModel.h"
#import "NTListDetailViewController.h"
#import "NTListDetailViewControllerDelegate.h"
#import "NTAddItemToListTableViewCell.h"
#import "NTNumberTableViewCellDelegate.h"
#import "NTListTableViewCell.h"
#import "NTAddItemToListTableViewCell.h"



NS_ASSUME_NONNULL_BEGIN

@interface NTListViewController :UIViewController <UITableViewDelegate, UITableViewDataSource,NTNumberTableViewCellDelegate,NTListDetailViewControllerDelegate>

@property (nonatomic,retain) NTListFatherViewModel* listViewModel;

@end

NS_ASSUME_NONNULL_END
