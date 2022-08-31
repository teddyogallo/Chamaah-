//
//  gorupinViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 29/11/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gorupinViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate>  {
    IBOutlet UITableView *tableView;
    
    NSMutableArray *tableArray;
    
     NSMutableArray *titleArray;
    
     NSMutableArray *typeArray;
    
     NSMutableArray *statusArray;
    
    NSMutableArray *uniqueidArray;
    
     NSMutableArray *timestampArray;
    
}


- (IBAction)goback:(id)sender;
- (IBAction)add_member:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *balance_label;
@property (weak, nonatomic) IBOutlet UILabel *group_name;
- (IBAction)group_info:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UITextField *bar_textfield;
- (IBAction)group_details_background:(id)sender;
- (IBAction)BarTextEditStarted:(id)sender;
- (IBAction)Add_Action_Bar:(id)sender;
- (IBAction)camera_button_action:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *add_action_button_outlet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *camera_button_outlet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *options_button_outlet;

- (IBAction)options_button_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *ThumbNailImageView;

- (IBAction)barTextEditEnded:(id)sender;

- (IBAction)send_image:(id)sender;
- (IBAction)exit_button:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *close_image_button_desc;
@property (strong, nonatomic) IBOutlet UIButton *send_image_button_desc;

@end
