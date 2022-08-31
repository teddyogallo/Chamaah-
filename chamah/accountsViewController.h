//
//  accountsViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 13/01/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface accountsViewController : UIViewController
- (IBAction)backbutton:(id)sender;
- (IBAction)prepaid_card_button:(id)sender;
- (IBAction)withdraw_balance_button:(id)sender;
- (IBAction)withdraw_savings_button:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *loan_limit_label;
@property (weak, nonatomic) IBOutlet UILabel *savings_label;
@property (weak, nonatomic) IBOutlet UILabel *balance_label;
@property (weak, nonatomic) IBOutlet UIButton *prepaid_card;
- (IBAction)add_account:(id)sender;

@end
