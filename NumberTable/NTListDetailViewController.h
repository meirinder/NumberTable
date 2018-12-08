//
//  ListDetailViewController.h
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTListDetailViewModel.h"
#import "NTListDetailViewControllerDelegate.h"


NS_ASSUME_NONNULL_BEGIN

@interface NTListDetailViewController : UIViewController

@property (nonatomic, retain) NTListDetailViewModel* listDetailViewModel;

@property (nonatomic,assign)id <NTListDetailViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
