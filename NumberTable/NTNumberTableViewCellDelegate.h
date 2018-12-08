//
//  NTNumberTableViewCellProtocol.h
//  NumberTable
//
//  Created by Savely on 03.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NTNumberTableViewCellDelegate <NSObject>


-(void)onClick: (UIButton*) button;

@end

NS_ASSUME_NONNULL_END
