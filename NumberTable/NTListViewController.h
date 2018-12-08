//
//  ListViewController.h
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListFatherViewController.h"
#import "NTListDetailViewModel.h"
#import "NTListDetailViewController.h"
#import "NTListDetailViewControllerDelegate.h"
#import "NTAddItemToListTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface NTListViewController : NTListFatherViewController <NTListDetailViewControllerDelegate>

@property (nonatomic,retain) NTListViewModel* listViewModel;

@end

NS_ASSUME_NONNULL_END
