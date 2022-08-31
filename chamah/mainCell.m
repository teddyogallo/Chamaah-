//
//  mainCell.m
//  chamah
//
//  Created by Teddy Ogallo on 08/04/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "mainCell.h"

@implementation mainCell

+ (NSString *)reuseIdentifier {
    return @"mainCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
