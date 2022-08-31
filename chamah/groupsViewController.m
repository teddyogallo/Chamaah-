//
//  groupsViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 29/11/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import "groupsViewController.h"

#import "gorupinViewController.h"
#import "newgroupViewController.h"
#import "chamaahdata.h"


@interface groupsViewController ()

@end

@implementation groupsViewController

@synthesize active_group=_active_group;

@synthesize groupstatus1=_groupstatus1;

@synthesize groupstatus2=_groupstatus2;

@synthesize groupstatus3=_groupstatus3;

@synthesize groupstatus4=_groupstatus4;

@synthesize groupstatus5=_groupstatus5;

@synthesize groupstatus6=_groupstatus6;

@synthesize groupstatus7=_groupstatus7;

@synthesize groupstatus8=_groupstatus8;

@synthesize groupstatus9=_groupstatus9;


//synthesize group names
@synthesize groupname1=_groupname1;

@synthesize groupname2=_groupname2;

@synthesize groupname3=_groupname3;

@synthesize groupname4=_groupname4;

@synthesize groupname5=_groupname5;

@synthesize groupname6=_groupname6;

@synthesize groupname7=_groupname7;

@synthesize groupname8=_groupname8;

@synthesize groupname9=_groupname9;

@synthesize groupname10=_groupname10;

//synthesize group id

@synthesize groupid1=_groupid1;

@synthesize groupid2=_groupid2;

@synthesize groupid3=_groupid3;

@synthesize groupid4=_groupid4;

@synthesize groupid5=_groupid5;

@synthesize groupid6=_groupid6;

@synthesize groupid7=_groupid7;

@synthesize groupid8=_groupid8;

@synthesize groupid9=_groupid9;

@synthesize groupid10=_groupid10;

//synthesize group balance

@synthesize groupbalance1=_groupbalance1;

@synthesize groupbalance2=_groupbalance2;


@synthesize groupbalance3=_groupbalance3;

@synthesize groupbalance4=_groupbalance4;


@synthesize groupbalance5=_groupbalance5;

@synthesize groupbalance6=_groupbalance6;

@synthesize groupbalance7=_groupbalance7;

@synthesize groupbalance8=_groupbalance8;

@synthesize groupbalance9=_groupbalance9;

@synthesize groupbalance10=_groupbalance10;

//main values

@synthesize groupbalance_main=_groupbalance_main;
@synthesize groupid_main=_groupid_main;
@synthesize groupname_main=_groupname_main;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // The Array
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    // Determine Path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"wwgroupsarchive.dat"];
    
    
    // Unarchive Array
    NSMutableArray *theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    
    NSLog(@"Group  saved  array: %@", theArray);
    
    
       // tableArray= [NSMutableArray arrayWithObjects:@"Welcome Teddy",nil];
    
    if (!theArray || !theArray.count){
    //array is empty
        
     //show notification asking User to Add a Group
        
        
        
        
    }else{
        
        //array is not empty
  
      
 
        
        //parse values for group array
        NSMutableArray *grouparray1 = [[NSMutableArray alloc] init];
        
         grouparray1 = [theArray valueForKeyPath:@"group1"];
        
       
         NSMutableArray *grouparray2 = [[NSMutableArray alloc] init];
        grouparray2 = [theArray valueForKeyPath:@"group2"];
        
         NSMutableArray *grouparray3 = [[NSMutableArray alloc] init];
        
        grouparray3 = [theArray valueForKeyPath:@"group3"];
        
         NSMutableArray *grouparray4 = [[NSMutableArray alloc] init];
        
        grouparray4 = [theArray valueForKeyPath:@"group4"];
        
        
         NSMutableArray *grouparray5 = [[NSMutableArray alloc] init];
        
      grouparray5 = [theArray valueForKeyPath:@"group5"];
        
         NSMutableArray *grouparray6 = [[NSMutableArray alloc] init];
        
        grouparray6 = [theArray valueForKeyPath:@"group6"];
        
        
         NSMutableArray *grouparray7 = [[NSMutableArray alloc] init];
        
        grouparray7 = [theArray valueForKeyPath:@"group7"];
        
        
         NSMutableArray *grouparray8 = [[NSMutableArray alloc] init];
        
        grouparray8 = [theArray valueForKeyPath:@"group8"];
        
         NSMutableArray *grouparray9 = [[NSMutableArray alloc] init];
        
        grouparray9 = [theArray valueForKeyPath:@"group9"];
        
         NSMutableArray *grouparray10 = [[NSMutableArray alloc] init];
        
        grouparray10 = [theArray valueForKeyPath:@"group10"];
     
        
        //start for group 1 array
        if (!grouparray1 || !grouparray1.count){
            
            //set empty values
            
            _notification_label1.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label1.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup1 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image1 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image1 setImage:img3];

            
           
            
            
            
          //group array is empty do nothing
        }else{
//group array is not empty parse values
            
            
            _groupstatus1=@"FULL";
        
         NSString *groupname = [grouparray1 valueForKeyPath:@"group_name"];
            
             NSString *groupid = [grouparray1 valueForKeyPath:@"group_id"];
            
             NSString *groupbalance = [grouparray1 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
       NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
        groupnotifications1 = [grouparray1 valueForKeyPath:@"notifications"];
            
             NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
          
        NSLog(@"Integer count: %lu", myCount);
            
            
            int startvalue;
            
           
            
              NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
              NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
              NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
              NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
              NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
              NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
              NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
              NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
      
                
       NSLog(@"KeyValue: %@", keyvalue);
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
     NSLog(@"Single Notification Array: %@", notification_array_this);
                
                
                
           NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
        NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
        NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
        NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];

                 NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                 NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                 [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                 [time_array addObject:notification_time];
                
                  [status_array addObject:notification_status];
                
                
                   [type_array addObject:notification_type];
                
                
                
            }
            
             NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
           
        
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
           //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid1.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
           //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid1.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone1.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid1.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description1.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time1.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status1.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type1.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array

            
            
            //end of store values in phone memory


           NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
           
                
           //change notification for the last value in the textbox
            
            _notification_label1.text=[NSString stringWithFormat:@"%lu",myCount];
  
            _group_notification_label1.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup1 setTitle:groupname forState:UIControlStateNormal];
            
            
            
      //END OF GROUP 1 array
        }
        
        
        //start parsing values fro group 2 array
        
        if (!grouparray2 || !grouparray2.count){
            _notification_label2.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label2.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup2 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image2 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image2 setImage:img3];
            
            
            
            
            
            //group array is empty do nothing
        }else{
            //group array is not empty parse values
            
            
            _groupstatus2=@"FULL";
            
            NSString *groupname = [grouparray2 valueForKeyPath:@"group_name"];
            
            NSString *groupid = [grouparray2 valueForKeyPath:@"group_id"];
            
            NSString *groupbalance = [grouparray2 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
            NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
            groupnotifications1 = [grouparray2 valueForKeyPath:@"notifications"];
            
            NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
            
            NSLog(@"Integer count: %lu", myCount);
            
           
            
           
            
            
            
            int startvalue;
            
            NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
                
                
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
                
                NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
                NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
                NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
                NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                
                NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                [time_array addObject:notification_time];
                
                [status_array addObject:notification_status];
                
                
                [type_array addObject:notification_type];
                
                
                
            }
            
            NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
            
            
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid2.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid2.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone2.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid2.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description2.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time2.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status2.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type2.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array
            
            
            
            //end of store values in phone memory
            
            
            NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
            
            
            //change notification for the last value in the textbox
            
            _notification_label2.text=[NSString stringWithFormat:@"%lu",myCount];
            
            _group_notification_label2.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup2 setTitle:groupname forState:UIControlStateNormal];
            
            
            
            //END OF GROUP 1 array
        }
        
        
        //end of parse values for group 2 array
        
        
        //start parse values for group 3
        
        if (!grouparray3 || !grouparray3.count){
            
            _notification_label3.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label3.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup3 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image3 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image3 setImage:img3];
            
            
            
            
            
            //group array is empty do nothing
        }else{
            //group array is not empty parse values
            
            
            _groupstatus3=@"FULL";
            
            
            
            NSString *groupname = [grouparray3 valueForKeyPath:@"group_name"];
            
            NSString *groupid = [grouparray3 valueForKeyPath:@"group_id"];
            
            NSString *groupbalance = [grouparray3 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
            NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
            groupnotifications1 = [grouparray3 valueForKeyPath:@"notifications"];
            
            NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
            
            NSLog(@"Integer count: %lu", myCount);
            
            int startvalue;
            
            NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
                
                
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
                
                NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
                NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
                NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
                NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                
                NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                [time_array addObject:notification_time];
                
                [status_array addObject:notification_status];
                
                
                [type_array addObject:notification_type];
                
                
                
            }
            
            NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
            
            
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid3.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid3.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone3.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid3.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description3.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time3.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status3.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type3.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array
            
            
            
            //end of store values in phone memory

            
            
            NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
            
            
            //change notification for the last value in the textbox
            
            _notification_label3.text=[NSString stringWithFormat:@"%lu",myCount];
            
            _group_notification_label3.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup3 setTitle:groupname forState:UIControlStateNormal];
            
            
            
            //END OF GROUP 1 array
        }
        
        //end of parse values for group 3
        
        //start of parse for group 4
        
        if (!grouparray4 || !grouparray4.count){
            
            _notification_label4.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label4.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup4 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image4 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image4 setImage:img3];
            
            
            
            
            
            //group array is empty do nothing
        }else{
            //group array is not empty parse values
            
            _groupstatus4=@"FULL";
            
            NSString *groupname = [grouparray4 valueForKeyPath:@"group_name"];
            
            NSString *groupid = [grouparray4 valueForKeyPath:@"group_id"];
            
            NSString *groupbalance = [grouparray4 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
            NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
            groupnotifications1 = [grouparray4 valueForKeyPath:@"notifications"];
            
            NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
            
            NSLog(@"Integer count: %lu", myCount);
            
            
            int startvalue;
            
            NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
                
                
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
                
                NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
                NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
                NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
                NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                
                NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                [time_array addObject:notification_time];
                
                [status_array addObject:notification_status];
                
                
                [type_array addObject:notification_type];
                
                
                
            }
            
            NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
            
            
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid4.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid4.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone4.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid4.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description4.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time4.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status4.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type4.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array
            
            
            
            //end of store values in phone memory
            
            
            NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
            
            
            //change notification for the last value in the textbox
            
            _notification_label4.text=[NSString stringWithFormat:@"%lu",myCount];
            
            _group_notification_label4.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup4 setTitle:groupname forState:UIControlStateNormal];
            
            
            
            //END OF GROUP 1 array
        }
        
        
        //end of parse for group 4
        
        //start of parse for group 5
        
        if (!grouparray5 || !grouparray5.count){
            
            _notification_label5.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label5.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup5 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image5 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image5 setImage:img3];
            
            
            
            
            
            //group array is empty do nothing
        }else{
            //group array is not empty parse values
            
            _groupstatus5=@"FULL";
            
            
            
            NSString *groupname = [grouparray5 valueForKeyPath:@"group_name"];
            
            NSString *groupid = [grouparray5 valueForKeyPath:@"group_id"];
            
            NSString *groupbalance = [grouparray5 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
            
            
            NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
            groupnotifications1 = [grouparray5 valueForKeyPath:@"notifications"];
            
            NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
            
            NSLog(@"Integer count: %lu", myCount);
            
            
            int startvalue;
            
            NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
                
                
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
                
                NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
                NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
                NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
                NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                
                NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                [time_array addObject:notification_time];
                
                [status_array addObject:notification_status];
                
                
                [type_array addObject:notification_type];
                
                
                
            }
            
            NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
            
            
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid5.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid5.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone5.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid5.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description5.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time5.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status5.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type5.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array
            
            
            
            //end of store values in phone memory

            
            
            NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
            
            
            //change notification for the last value in the textbox
            
            _notification_label5.text=[NSString stringWithFormat:@"%lu",myCount];
            
            _group_notification_label5.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup5 setTitle:groupname forState:UIControlStateNormal];
            
            
            
            //END OF GROUP 1 array
        }
        
        
        //end of parse for group 5
        
        //start of parsing group 6
        
        if (!grouparray6 || !grouparray6.count){
            
            _notification_label6.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label6.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup6 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image6 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image6 setImage:img3];
            
            
            
            
            
            //group array is empty do nothing
        }else{
            //group array is not empty parse values
            
            _groupstatus6=@"FULL";
            
            NSString *groupname = [grouparray6 valueForKeyPath:@"group_name"];
            
            NSString *groupid = [grouparray6 valueForKeyPath:@"group_id"];
            
            NSString *groupbalance = [grouparray6 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
            
            
            
            NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
            groupnotifications1 = [grouparray6 valueForKeyPath:@"notifications"];
            
            NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
            
            int startvalue;
            
            NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
                
                
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
                
                NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
                NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
                NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
                NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                
                NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                [time_array addObject:notification_time];
                
                [status_array addObject:notification_status];
                
                
                [type_array addObject:notification_type];
                
                
                
            }
            
            NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
            
            
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid6.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid6.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone6.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid6.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description6.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time6.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status6.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type6.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array
            
            
            
            //end of store values in phone memory
            
            
            NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
            
            
            //change notification for the last value in the textbox
            
            _notification_label6.text=[NSString stringWithFormat:@"%lu",myCount];
            
            _group_notification_label6.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup6 setTitle:groupname forState:UIControlStateNormal];
            
            
            
            //END OF GROUP 1 array
        }
        //end of parsing for group 6
        
        //start of parsing for group 7
        
        
        if (!grouparray7 || !grouparray7.count){
            
            _notification_label7.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label7.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup7 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image7 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image7 setImage:img3];
            
            
            
            
            
            //group array is empty do nothing
        }else{
            //group array is not empty parse values
            
            _groupstatus7=@"FULL";
            
            
            
            NSString *groupname = [grouparray7 valueForKeyPath:@"group_name"];
            NSString *groupid = [grouparray7 valueForKeyPath:@"group_id"];
            
            NSString *groupbalance = [grouparray7 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
            
            
            NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
            groupnotifications1 = [grouparray7 valueForKeyPath:@"notifications"];
            
            NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
            
            
            int startvalue;
            
            NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
                
                
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
                
                NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
                NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
                NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
                NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                
                NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                [time_array addObject:notification_time];
                
                [status_array addObject:notification_status];
                
                
                [type_array addObject:notification_type];
                
                
                
            }
            
            NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
            
            
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid7.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid7.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone7.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid7.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description7.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time7.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status7.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type7.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array
            
            
            
            //end of store values in phone memory
            
            
            NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
            
            
            //change notification for the last value in the textbox
            
            _notification_label7.text=[NSString stringWithFormat:@"%lu",myCount];
            
            _group_notification_label7.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup7 setTitle:groupname forState:UIControlStateNormal];
            
            
            
            //END OF GROUP 1 array
        }
        
 
        
        
        //end of parsing for group 7
        
        //start of parsing for group 8
        
        
        if (!grouparray8 || !grouparray8.count){
            
            _notification_label8.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label8.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup8 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image8 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image8 setImage:img3];
            
            
            
            
            
            //group array is empty do nothing
        }else{
            //group array is not empty parse values
            
            _groupstatus8=@"FULL";
            
            
            
            NSString *groupname = [grouparray8 valueForKeyPath:@"group_name"];
            
            NSString *groupid = [grouparray8 valueForKeyPath:@"group_id"];
            
            NSString *groupbalance = [grouparray8 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
            
            
            NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
            groupnotifications1 = [grouparray8 valueForKeyPath:@"notifications"];
            
            NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
            
            
            int startvalue;
            
            NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
                
                
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
                
                NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
                NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
                NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
                NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                
                NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                [time_array addObject:notification_time];
                
                [status_array addObject:notification_status];
                
                
                [type_array addObject:notification_type];
                
                
                
            }
            
            NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
            
            
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid8.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid8.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone8.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid8.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description8.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time8.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status8.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type8.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array
            
            
            
            //end of store values in phone memory
            
            
            NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
            
            
            //change notification for the last value in the textbox
            
            _notification_label8.text=[NSString stringWithFormat:@"%lu",myCount];
            
            _group_notification_label8.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup8 setTitle:groupname forState:UIControlStateNormal];
            
            
            
            //END OF GROUP 1 array
        }
        

        //end of parsing for group 8
        
        
        //start of parsing for group 9
        
        
        
        if (!grouparray9 || !grouparray9.count){
            
            _notification_label9.text=[NSString stringWithFormat:@"%@",@""];
            
            _group_notification_label9.text=[NSString stringWithFormat:@"%@",@""];
            
            [_buttongroup9 setTitle:@"" forState:UIControlStateNormal];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_notifications_image9 setImage:img2];
            
            UIImage *img3 =[UIImage imageNamed: @"blank_strip.png"];
            [_group_profile_image9 setImage:img3];
            
            
            
            
            
            //group array is empty do nothing
        }else{
            //group array is not empty parse values
            
            _groupstatus9=@"FULL";
            
            NSString *groupname = [grouparray9 valueForKeyPath:@"group_name"];
            
            NSString *groupid = [grouparray9 valueForKeyPath:@"group_id"];
            
            NSString *groupbalance = [grouparray9 valueForKeyPath:@"group_balance"];
            
            _groupid1=groupid;
            _groupname1=groupname;
            _groupbalance1=groupbalance;
            
            
            
            
            NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
            groupnotifications1 = [grouparray9 valueForKeyPath:@"notifications"];
            
            NSLog(@"group notifications: %@", groupnotifications1);
            
            NSUInteger myCount =[groupnotifications1 count];
            
            
            int startvalue;
            
            NSMutableArray *ConversationId_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *SourcePhone_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *SourceSocialId_array = [[NSMutableArray alloc] init];
            
            
            NSMutableArray *Description_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *time_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *status_array = [[NSMutableArray alloc] init];
            
            NSMutableArray *type_array = [[NSMutableArray alloc] init];
            
            for (startvalue=1;startvalue<myCount;startvalue++) {
                
                NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                
                
                
                
                NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                //extract value of current notification
                notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                //end of extract value and start of extract individual values
                
                NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                
                NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                
                NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                
                
                NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                
                
                NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                
                
                NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                
                NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                
                NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                
                
                [ConversationId_array addObject:notification_conversation_id];
                
                [SourceId_array addObject:notification_source_id];
                
                
                [SourcePhone_array addObject:notification_source_phone];
                
                [SourceSocialId_array addObject:notification_social_id];
                
                
                [Description_array addObject:notification_description];
                
                
                [time_array addObject:notification_time];
                
                [status_array addObject:notification_status];
                
                
                [type_array addObject:notification_type];
                
                
                
            }
            
            NSMutableArray *lastarray1 = [[NSMutableArray alloc] init];
            
            
            
            lastarray1 =[groupnotifications1 valueForKeyPath:@"notificationlast"];
            
            //[lastarray1 addObject:[groupnotifications1 lastObject]];
            
            NSLog(@"Last Array: %@", lastarray1);
            
            //extract values for last array
            
            
            NSString * notification_conversation_id =[lastarray1 valueForKeyPath:@"conversation_id"];
            
            NSString * notification_source_id =[lastarray1 valueForKeyPath:@"source_id"];
            
            NSString * notification_source_phone =[lastarray1 valueForKeyPath:@"source_phone"];
            
            
            NSString * notification_social_id =[lastarray1 valueForKeyPath:@"source_social_id"];
            
            
            NSString * notification_description =[lastarray1 valueForKeyPath:@"description"];
            
            
            NSString * notification_time =[lastarray1 valueForKeyPath:@"notification_time"];
            
            NSString * notification_type =[lastarray1 valueForKeyPath:@"notification_type"];
            
            NSString * notification_status =[lastarray1 valueForKeyPath:@"notification_status"];
            
            
            [ConversationId_array addObject:notification_conversation_id];
            
            [SourceId_array addObject:notification_source_id];
            
            
            [SourcePhone_array addObject:notification_source_phone];
            
            [SourceSocialId_array addObject:notification_social_id];
            
            
            [Description_array addObject:notification_description];
            
            
            [time_array addObject:notification_time];
            
            [status_array addObject:notification_status];
            
            
            [type_array addObject:notification_type];
            
            //end extract value for last array
            //store values in phone memmory
            
            
            // Determine Path
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            //path to specific save file
            //save one component
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"conversationid9.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:ConversationId_array];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //end of save one component
            //save one component
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourceid9.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:SourceId_array];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"sourcephone9.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:SourcePhone_array];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid9.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:SourceSocialId_array];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"description9.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:Description_array];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"time9.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:time_array];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"status9.dat"];
            
            // Archive Array
            NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:status_array];
            [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //save one component
            NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type9.dat"];
            
            // Archive Array
            NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:type_array];
            [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];
            //end of save one component
            
            //end of save array
            
            
            
            
 
            
            
            //end of store values in phone memory
            
            
            NSString *lastnotification = [lastarray1 valueForKeyPath:@"description"];
            
            
            //change notification for the last value in the textbox
            
            _notification_label9.text=[NSString stringWithFormat:@"%lu",myCount];
            
            _group_notification_label9.text=[NSString stringWithFormat:@"%@",lastnotification];
            
            [_buttongroup9 setTitle:groupname forState:UIControlStateNormal];
            
            
            
            //END OF GROUP 1 array
        }
        
   
       
        
        
    }
    
    //implement send money

    
    
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

- (IBAction)back_button:(id)sender {
    
   
    
       [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)add_button:(id)sender {
    
    
    newgroupViewController * mimifirsterror =[[newgroupViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
  
    
}

- (IBAction)profile_button:(id)sender {
}
- (IBAction)group_button1:(id)sender {
    
    if([_groupstatus1 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"1";
        
        
    
    _active_group=@"1";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname1;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid1;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance1;
        
     
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];

        
    }else{
        
        
        
    }
    
}

- (IBAction)group_button2:(id)sender {
    
    if([_groupstatus2 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"2";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname2;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid2;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance2;
        
        
    
    _active_group=@"2";
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
        
    }else{
        
        
    }
    

}

- (IBAction)group_button3:(id)sender {
    
    if([_groupstatus3 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"3";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname3;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid3;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance3;
        
        
    
    _active_group=@"3";
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
    
    }else{
        
        
        
        
    }
    
    
}

- (IBAction)group_button4:(id)sender {
    
    if([_groupstatus4 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"4";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname4;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid4;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance4;
        
        
    
    _active_group=@"4";
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
        
    }else{
        
        
        
        
    }
    

}

- (IBAction)group_button5:(id)sender {
    
    if([_groupstatus5 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"5";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname5;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid5;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance5;
        
        
    
    _active_group=@"5";
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
        
    }else{
        
        
        
    }
    

}

- (IBAction)group_button6:(id)sender {
    
    if([_groupstatus6 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"6";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname6;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid6;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance6;
    
    _active_group=@"6";
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
        
    }else{
        
        
        
    }
    

}

- (IBAction)group_button7:(id)sender {
    
    if([_groupstatus7 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"7";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname7;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid7;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance7;
    
    _active_group=@"7";
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
        
    }else{
        
        
        
        
    }
    

}

- (IBAction)group_button8:(id)sender {
    
    if([_groupstatus8 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"8";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname8;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid8;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance8;
        
        
    
    _active_group=@"8";
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
        
    }else{
        
        
    }
    

}

- (IBAction)group_button9:(id)sender {
    
    if([_groupstatus9 isEqualToString:@"FULL"] ){
        
        chamaahdata *obj=[chamaahdata getInstance];
        obj.active_group= @"9";
        
        chamaahdata *obj2=[chamaahdata getInstance];
        obj2.groupname_main=_groupname9;
        
        chamaahdata *obj3=[chamaahdata getInstance];
        obj3.groupid_main=_groupid9;
        
        chamaahdata *obj4=[chamaahdata getInstance];
        obj4.groupbalance_main=_groupbalance9;
        
        
    _active_group=@"9";
    
    gorupinViewController * mimifirsterror =[[gorupinViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
        
    }else{
        
        
        
    }
    

    
    
}
@end
