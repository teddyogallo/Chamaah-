//
//  signupfullViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 09/03/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signupfullViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstname;
@property (weak, nonatomic) IBOutlet UITextField *lastname;

@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UITextField *gkid;
@property (weak, nonatomic) IBOutlet UITextField *taxid;

- (IBAction)confirm_button:(id)sender;
- (IBAction)signupbackground:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
- (IBAction)backbutton:(id)sender;

@end
