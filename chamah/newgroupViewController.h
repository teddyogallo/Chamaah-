//
//  newgroupViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 09/12/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newgroupViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

{
    
    
    
    
    UIToolbar *pickerToolbar;
    IBOutlet UIPickerView *accountnoView;
    //UIPickerView *cardPickerView;
    NSArray *accountnoViewArray;
    
    UIToolbar *pickerToolbar2;
    IBOutlet UIPickerView *rotationView;
    //UIPickerView *cardPickerView;
    NSArray *rotationViewArray;
    
    
    
}
//new inserted right now
@property (nonatomic, retain) NSArray *accountnoViewArray;

@property (nonatomic, retain) NSArray *rotationViewArray;

- (IBAction)profile_details:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *group_name;
@property (weak, nonatomic) IBOutlet UILabel *member_name;
@property (weak, nonatomic) IBOutlet UILabel *balance_label;
@property (weak, nonatomic) IBOutlet UITextField *group_name_textfield;
@property (weak, nonatomic) IBOutlet UITextView *description_edit;
- (IBAction)groupname_info:(id)sender;
- (IBAction)description_info:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *target_currency_label;
@property (weak, nonatomic) IBOutlet UITextField *target_textfield;
- (IBAction)loan_rotation_info:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *loan_rotation_time;
- (IBAction)rotation_time_info:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *settlement_account_textfield;
- (IBAction)settlement_account_info:(id)sender;
- (IBAction)schedule_button:(id)sender;
- (IBAction)add_contacts:(id)sender;
- (IBAction)view_members:(id)sender;
- (IBAction)add_facebook:(id)sender;
- (IBAction)add_pictures:(id)sender;
- (IBAction)view_media:(id)sender;
- (IBAction)save_button:(id)sender;
- (IBAction)backbutton:(id)sender;
- (IBAction)form_group_background:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *stealth_button;



@property (strong, nonatomic) NSString *cardtype1;
@property (strong, nonatomic) NSString *cardid1;
@property (strong, nonatomic) NSString *cardnumber1;

@property (strong, nonatomic) NSString *cardtype2;
@property (strong, nonatomic) NSString *cardid2;
@property (strong, nonatomic) NSString *cardnumber2;

@property (strong, nonatomic) NSString *cardtype3;
@property (strong, nonatomic) NSString *cardid3;
@property (strong, nonatomic) NSString *cardnumber3;

@property (strong, nonatomic) NSString *cardtype4;
@property (strong, nonatomic) NSString *cardid4;
@property (strong, nonatomic) NSString *cardnumber4;

@property (strong, nonatomic) NSString *cardtype5;
@property (strong, nonatomic) NSString *cardid5;
@property (strong, nonatomic) NSString *cardnumber5;

@property (strong, nonatomic) NSString *cardtype6;
@property (strong, nonatomic) NSString *cardid6;
@property (strong, nonatomic) NSString *cardnumber6;

@property (strong, nonatomic) NSString *cardtype7;
@property (strong, nonatomic) NSString *cardid7;
@property (strong, nonatomic) NSString *cardnumber7;

@property (strong, nonatomic) NSString *cardtype8;
@property (strong, nonatomic) NSString *cardid8;
@property (strong, nonatomic) NSString *cardnumber8;

@property (strong, nonatomic) NSString *cardtype9;
@property (strong, nonatomic) NSString *cardid9;
@property (strong, nonatomic) NSString *cardnumber9;

@property (strong, nonatomic) NSString *cardtype10;
@property (strong, nonatomic) NSString *cardid10;
@property (strong, nonatomic) NSString *cardnumber10;

@property (strong, nonatomic) NSString *cardtype11;
@property (strong, nonatomic) NSString *cardid11;
@property (strong, nonatomic) NSString *cardnumber11;

@property (strong, nonatomic) NSString *cardtype12;
@property (strong, nonatomic) NSString *cardid12;
@property (strong, nonatomic) NSString *cardnumber12;

@property (strong, nonatomic) NSString *cardtype13;
@property (strong, nonatomic) NSString *cardid13;
@property (strong, nonatomic) NSString *cardnumber13;

@property (strong, nonatomic) NSString *cardtype14;
@property (strong, nonatomic) NSString *cardid14;
@property (strong, nonatomic) NSString *cardnumber14;

@property (strong, nonatomic) NSString *cardtype15;
@property (strong, nonatomic) NSString *cardid15;
@property (strong, nonatomic) NSString *cardnumber15;

@property (strong, nonatomic) NSString *cardtype16;
@property (strong, nonatomic) NSString *cardid16;
@property (strong, nonatomic) NSString *cardnumber16;

@property (strong, nonatomic) NSString *cardtype17;
@property (strong, nonatomic) NSString *cardid17;
@property (strong, nonatomic) NSString *cardnumber17;

@property (strong, nonatomic) NSString *cardtype18;
@property (strong, nonatomic) NSString *cardid18;
@property (strong, nonatomic) NSString *cardnumber18;

@property (strong, nonatomic) NSString *cardtype19;
@property (strong, nonatomic) NSString *cardid19;
@property (strong, nonatomic) NSString *cardnumber19;

@property (strong, nonatomic) NSString *cardtype20;
@property (strong, nonatomic) NSString *cardid20;
@property (strong, nonatomic) NSString *cardnumber20;

//declare for card numbering



@property (strong, nonatomic) NSString *cardidmain;

@property (strong, nonatomic) NSString *cardwithdrawmain;
@property (weak, nonatomic) IBOutlet UISwitch *limit_switch;
@property (weak, nonatomic) IBOutlet UISwitch *memberloan_switch;
@property (weak, nonatomic) IBOutlet UISwitch *rotational_switch;

@property (strong, nonatomic) NSString *limit_switch_value;
@property (strong, nonatomic) NSString *memberloan_switch_value;
@property (strong, nonatomic) NSString *stealth_switch_value;
@property (strong, nonatomic) NSString *rotationalswitch_value;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
