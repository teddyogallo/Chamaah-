//
//  contributeViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 12/01/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contributeViewController : UIViewController
- (IBAction)backbutton:(id)sender;
- (IBAction)group_profile:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *group_picture_button;
@property (weak, nonatomic) IBOutlet UILabel *group_name_label;
@property (weak, nonatomic) IBOutlet UILabel *group_balance;
@property (weak, nonatomic) IBOutlet UILabel *currency_label;

@end
