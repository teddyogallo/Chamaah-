//
//  menuViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 29/11/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface menuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userid_this;
@property (weak, nonatomic) IBOutlet UITextField *password_this;
- (IBAction)continue_button:(id)sender;
- (IBAction)login_background:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
- (IBAction)facebook_login:(id)sender;
- (IBAction)signup_normal:(id)sender;

@end
