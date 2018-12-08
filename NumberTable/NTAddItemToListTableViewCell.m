//
//  AddItemToListTableViewCell.m
//  NumberTable
//
//  Created by Savely on 06.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTAddItemToListTableViewCell.h"

@implementation NTAddItemToListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_addLabel release];
    [super dealloc];
}
@end
