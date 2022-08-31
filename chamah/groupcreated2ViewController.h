//
//  groupcreated2ViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 16/03/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface groupcreated2ViewController : UIViewController
- (IBAction)go_back:(id)sender;
- (IBAction)add_contacts:(id)sender;
- (IBAction)add_facebook:(id)sender;
- (IBAction)add_pictures:(id)sender;
- (IBAction)view_members:(id)sender;
- (IBAction)view_media:(id)sender;
    @property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
