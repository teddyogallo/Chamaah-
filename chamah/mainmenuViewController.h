//
//  mainmenuViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 29/11/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainmenuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView *tableView;
    
    NSMutableArray *tableArray;
    
   
    
    NSMutableArray *titleArray;
    
    NSMutableArray *typeArray;
    
    NSMutableArray *statusArray;
    
    NSMutableArray *timestampArray;
    
    
    NSMutableArray *groupidArray;
    
    NSMutableArray *useridArray;
    
    NSMutableArray *usersocialnameArray;
    
    NSMutableArray *phonesourceArray;
    
    NSMutableArray *groupchatArray;
    
    NSMutableArray *groupconversationidArray;
    
    NSMutableArray *notification_mediaArray;
    
    NSMutableArray *notification_mediathumbnailArray;
   
    NSMutableArray *contact_mediaArray;
    
     NSMutableArray *contact_mediathumbnailArray;
    

    
}
- (IBAction)backbutton:(id)sender;
- (IBAction)profile_button:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *name_label;
@property (weak, nonatomic) IBOutlet UILabel *groups_notifications;
@property (weak, nonatomic) IBOutlet UILabel *events_notifications;
- (IBAction)groups_button:(id)sender;
- (IBAction)savings_button:(id)sender;

- (IBAction)accounts_button:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *group_notification_image;
@property (weak, nonatomic) IBOutlet UIImageView *savings_loans_notification_image;

@property (weak, nonatomic) IBOutlet UILabel *groups_notification_label;
@property (weak, nonatomic) IBOutlet UILabel *savings_notification_label;

@property (weak, nonatomic) IBOutlet UITableView *data_table;

    @property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
