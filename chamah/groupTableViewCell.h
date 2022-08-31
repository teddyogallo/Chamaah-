//
//  groupTableViewCell.h
//  chamah
//
//  Created by Teddy Ogallo on 02/04/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface groupTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *main_title;
@property (weak, nonatomic) IBOutlet UILabel *details_label;
@property (weak, nonatomic) IBOutlet UILabel *time_started;
@property (weak, nonatomic) IBOutlet UIImageView *image_status;

@end
