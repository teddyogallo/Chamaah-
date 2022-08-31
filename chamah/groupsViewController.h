//
//  groupsViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 29/11/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface groupsViewController : UIViewController
- (IBAction)back_button:(id)sender;
- (IBAction)add_button:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image1;
@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image2;
@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image3;
@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image4;

@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image5;
@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image6;
@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image7;
@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image8;
@property (weak, nonatomic) IBOutlet UIImageView *group_profile_image9;
- (IBAction)group_button1:(id)sender;
- (IBAction)group_button2:(id)sender;
- (IBAction)group_button3:(id)sender;
- (IBAction)group_button4:(id)sender;
- (IBAction)group_button5:(id)sender;
- (IBAction)group_button6:(id)sender;
- (IBAction)group_button7:(id)sender;
- (IBAction)group_button8:(id)sender;
- (IBAction)group_button9:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label1;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label2;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label3;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label4;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label5;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label6;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label7;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label8;
@property (weak, nonatomic) IBOutlet UILabel *group_notification_label9;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image1;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image4;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image2;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image3;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image7;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image5;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image6;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image8;
@property (weak, nonatomic) IBOutlet UIImageView *group_notifications_image9;
@property (weak, nonatomic) IBOutlet UILabel *notification_label1;
@property (weak, nonatomic) IBOutlet UILabel *notification_label2;
@property (weak, nonatomic) IBOutlet UILabel *notification_label3;
@property (weak, nonatomic) IBOutlet UILabel *notification_label4;
@property (weak, nonatomic) IBOutlet UILabel *notification_label5;
@property (weak, nonatomic) IBOutlet UILabel *notification_label6;
@property (weak, nonatomic) IBOutlet UILabel *notification_label7;
@property (weak, nonatomic) IBOutlet UILabel *notification_label8;
@property (weak, nonatomic) IBOutlet UILabel *notification_label9;


@property (weak, nonatomic) IBOutlet UIButton *buttongroup1;
@property (weak, nonatomic) IBOutlet UIButton *buttongroup2;

@property (weak, nonatomic) IBOutlet UIButton *buttongroup3;

@property (weak, nonatomic) IBOutlet UIButton *buttongroup4;
@property (weak, nonatomic) IBOutlet UIButton *buttongroup5;
@property (weak, nonatomic) IBOutlet UIButton *buttongroup6;
@property (weak, nonatomic) IBOutlet UIButton *buttongroup7;

@property (weak, nonatomic) IBOutlet UIButton *buttongroup8;
@property (weak, nonatomic) IBOutlet UIButton *buttongroup9;

@property (strong, nonatomic) NSString *active_group;

@property (strong, nonatomic) NSString *groupstatus1;

@property (strong, nonatomic) NSString *groupstatus2;

@property (strong, nonatomic) NSString *groupstatus3;


@property (strong, nonatomic) NSString *groupstatus4;


@property (strong, nonatomic) NSString *groupstatus5;


@property (strong, nonatomic) NSString *groupstatus6;


@property (strong, nonatomic) NSString *groupstatus7;

@property (strong, nonatomic) NSString *groupstatus8;


@property (strong, nonatomic) NSString *groupstatus9;



///values for group names


@property (strong, nonatomic) NSString *groupname1;

@property (strong, nonatomic) NSString *groupname2;

@property (strong, nonatomic) NSString *groupname3;

@property (strong, nonatomic) NSString *groupname4;

@property (strong, nonatomic) NSString *groupname5;

@property (strong, nonatomic) NSString *groupname6;

@property (strong, nonatomic) NSString *groupname7;

@property (strong, nonatomic) NSString *groupname8;

@property (strong, nonatomic) NSString *groupname9;

@property (strong, nonatomic) NSString *groupname10;

//end of values for group names

//values for Group ID

@property (strong, nonatomic) NSString *groupid1;


@property (strong, nonatomic) NSString *groupid2;


@property (strong, nonatomic) NSString *groupid3;


@property (strong, nonatomic) NSString *groupid4;


@property (strong, nonatomic) NSString *groupid5;


@property (strong, nonatomic) NSString *groupid6;


@property (strong, nonatomic) NSString *groupid7;


@property (strong, nonatomic) NSString *groupid8;


@property (strong, nonatomic) NSString *groupid9;


@property (strong, nonatomic) NSString *groupid10;

//group balance


@property (strong, nonatomic) NSString *groupbalance1;


@property (strong, nonatomic) NSString *groupbalance2;


@property (strong, nonatomic) NSString *groupbalance3;


@property (strong, nonatomic) NSString *groupbalance4;


@property (strong, nonatomic) NSString *groupbalance5;


@property (strong, nonatomic) NSString *groupbalance6;


@property (strong, nonatomic) NSString *groupbalance7;


@property (strong, nonatomic) NSString *groupbalance8;


@property (strong, nonatomic) NSString *groupbalance9;


@property (strong, nonatomic) NSString *groupbalance10;


//main strings

@property (strong, nonatomic) NSString *groupbalance_main;


@property (strong, nonatomic) NSString *groupid_main;


@property (strong, nonatomic) NSString *groupname_main;



//end of main strings






@end
