//
//  AppDelegate.h
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "NTListViewController.h"
#import "NTListViewModel.h"
#import "NTStatsViewController.h"
#import "NTStatsViewModel.h"
#import "NTFavouritesViewModel.h"
#import "NTUserDafaultsWorker.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

