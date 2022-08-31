//
//  sendimagecellViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 12/03/2018.
//  Copyright © 2018 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sendimagecellViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *time_image_sent;
@property (strong, nonatomic) IBOutlet UILabel *sender_title_label;
@property (strong, nonatomic) IBOutlet UIImageView *delivery_status_image;
@property (strong, nonatomic) IBOutlet UIImageView *sent_image_view;
@property (strong, nonatomic) IBOutlet UIView *image_content_view;

@end
