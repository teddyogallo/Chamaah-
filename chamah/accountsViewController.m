//
//  accountsViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 13/01/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "accountsViewController.h"

@interface accountsViewController ()

@end

@implementation accountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backbutton:(id)sender {
    
      [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)prepaid_card_button:(id)sender {
}

- (IBAction)withdraw_balance_button:(id)sender {
}

- (IBAction)withdraw_savings_button:(id)sender {
}

@end
