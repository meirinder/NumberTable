//
//  NTNumberStore.h
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTNumber.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTNumberStore : NSObject 

@property (nonatomic,retain) NSMutableArray<NTNumber*>* numberList;
-(void)fillNumberStore;

@end

NS_ASSUME_NONNULL_END
