//
//  MyCustomCell.h
//  chamah
//
//  Created by Teddy Ogallo on 03/04/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *notificationtype;
@property (weak, nonatomic) IBOutlet UIImageView *background_image;
@property (strong, nonatomic) IBOutlet UIView *cell_content_view;
@property (strong, nonatomic) IBOutlet UIImageView *cell_image_view;

@end
