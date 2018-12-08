//
//  NTListDetailViewControllerProtocol.h
//  NumberTable
//
//  Created by Savely on 06.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NTListDetailViewControllerDelegate <NSObject>

-(void)onClicBarButton: (BOOL) isFavourite userInfo: (NSInteger) index;
-(void)save:(float) number userInfo: (NSInteger) index;

@end

NS_ASSUME_NONNULL_END
