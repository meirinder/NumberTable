//
//  ListTableViewCell.h
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTNumberTableViewCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTListTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *numberLabel;
@property (retain, nonatomic) IBOutlet UILabel *stringNumberLabel;
@property (retain, nonatomic) IBOutlet UIButton *favouriteButton;

@property (nonatomic,assign)id <NTNumberTableViewCellDelegate> delegate;

- (IBAction)onClickFavouriteButton:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
