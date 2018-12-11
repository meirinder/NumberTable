//
//  NTArchiverAndUnarchiver.h
//  NumberTable
//
//  Created by Savely on 11.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTNumber.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTArchiverAndUnarchiver : NSObject

-(void)archiveData:(NSMutableArray<NTNumber*>*)numberList forKey:(NSString*) key;
-(NSMutableArray<NTNumber*>*)unarchiveData:(NSString*) key;


@end

NS_ASSUME_NONNULL_END
