//
//  contributeViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 12/01/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "contributeViewController.h"
#import "groupinfoViewController.h"

@interface contributeViewController ()

@end

@implementation contributeViewController

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

- (IBAction)group_profile:(id)sender {
    
    groupinfoViewController * mimifirsterror =[[groupinfoViewController  alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];

    
    
}
@end
