//
//  ListTableViewCell.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListTableViewCell.h"

@implementation NTListTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_numberLabel release];
    [_stringNumberLabel release];
    [_favouriteButton release];
    [super dealloc];
}
- (IBAction)onClickFavouriteButton:(UIButton *)sender {
    [self.delegate onClick:sender];
}
@end
