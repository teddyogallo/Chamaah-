//
//  groupTableViewCell.m
//  chamah
//
//  Created by Teddy Ogallo on 02/04/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "groupTableViewCell.h"

@implementation groupTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)reuseIdentifier {
    return @"CustomCellIdentifier";
}

@end
