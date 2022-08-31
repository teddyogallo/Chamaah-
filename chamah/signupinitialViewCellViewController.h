//
//  signupinitialViewCellViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 09/05/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signupinitialViewCellViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    
    UIToolbar *pickerToolbar;
    
    
    
    
    
    IBOutlet UIPickerView *countryView;
    
    NSArray *countryViewArray;
    
    
    
    
    
    
}


@property (nonatomic, retain) NSArray *countryViewArray;

@property(nonatomic,retain)NSString *countrycodeM;
@property (weak, nonatomic) IBOutlet UILabel *phone_country_code;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UITextField *phone_number;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *repeatpassword;
@property (weak, nonatomic) IBOutlet UITextField *promo_code;
- (IBAction)continue_button:(id)sender;
- (IBAction)signup_background:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progress_indicator;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
- (IBAction)signup_initial:(id)sender;

@end
