//
//  attachedaccountsViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 13/01/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "attachedaccountsViewController.h"
#import  "accountinsiderViewController.h"

@interface attachedaccountsViewController ()

@end

@implementation attachedaccountsViewController

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

- (IBAction)card1:(id)sender {
    
    accountinsiderViewController * mimifirsterror =[[accountinsiderViewController  alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
    
    
    
}

- (IBAction)card2:(id)sender {
}

- (IBAction)card3:(id)sender {
}

- (IBAction)card4:(id)sender {
}

- (IBAction)card5:(id)sender {
}

- (IBAction)card6:(id)sender {
}

- (IBAction)card7:(id)sender {
}

- (IBAction)card8:(id)sender {
}

- (IBAction)card9:(id)sender {
}

- (IBAction)card10:(id)sender {
}
@end
