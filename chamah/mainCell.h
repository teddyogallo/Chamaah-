//
//  mainCell.h
//  chamah
//
//  Created by Teddy Ogallo on 08/04/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellDetailsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *cellTime;

@end
