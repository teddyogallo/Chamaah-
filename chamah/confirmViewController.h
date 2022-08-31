//
//  confirmViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 09/05/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface confirmViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *phonenumber_label;
@property (weak, nonatomic) IBOutlet UITextField *code_textfield;
@property (weak, nonatomic) IBOutlet UIButton *confirm_button;
@property (weak, nonatomic) IBOutlet UIButton *resend_code;
- (IBAction)confirmcode_background:(id)sender;
- (IBAction)resend_code_action:(id)sender;
- (IBAction)confrim_button_action:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
