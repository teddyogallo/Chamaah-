//
//  mainmenuViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 29/11/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import "mainmenuViewController.h"
#import "groupsViewController.h"
#import "accountsViewController.h"
#import "attachedaccountsViewController.h"
#import "SBJson.h"
#import "chamaahdata.h"
#import "mainCell.h"

@interface mainmenuViewController ()

@end

@implementation mainmenuViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    chamaahdata *obj3=[chamaahdata getInstance];
    
    NSString *useridthis=obj3.useridGlob;
    
    chamaahdata *obj4=[chamaahdata getInstance];
    
    NSString *tokenthis=obj4.tokenString;
    
    
    chamaahdata *obj5=[chamaahdata getInstance];
    
    NSMutableArray *group_notification_this=obj5.group_notifications;
    
    // The Array
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    
    NSMutableArray *group_titles_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *group_status_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *request_type_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *time_sent_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *group_id_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *userid_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *usersocialname_overall=[[NSMutableArray alloc] init];
    NSMutableArray *phonesource_overall=[[NSMutableArray alloc] init];
    NSMutableArray *groupchats_overall=[[NSMutableArray alloc] init];
    
     NSMutableArray *group_conversationid_overall=[[NSMutableArray alloc] init];

    
    NSMutableArray *notification_media_overall=[[NSMutableArray alloc] init];
    NSMutableArray *notification_mediathumbnail_overall=[[NSMutableArray alloc] init];
    NSMutableArray *contact_media_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *contact_mediathumbnail_overall=[[NSMutableArray alloc] init];
    /*
     
     
     NSMutableArray *notification_mediaArray;
     
     NSMutableArray *notification_mediathumbnailArray;
     
     NSMutableArray *contact_mediaArray;
     
     NSMutableArray *contact_mediathumbnailArray;
     
     
     */
    
    
    // Determine Path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"notificationsarchive.dat"];
    
   
    NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"groupchatsoverall.dat"];
    
      NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"grouptitlesoverall.dat"];
    
      NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timetotal.dat"];
    
      NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"statustotal.dat"];
    
    NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"groupidsoverall.dat"];
    
    NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"useridoverall.dat"];
    
    NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"usersocialnameoverall.dat"];
    
    NSString *path9 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"phonesourceoverall.dat"];
    
     NSString *path11 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"grouptypeoverall.dat"];
 
         NSString *path12 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"groupconversationid.dat"];
    
    
 
     
     NSString *path13 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"notification_mediaoverall.dat"];
     
     NSString *path14 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"notification_mediathumbnailoverall.dat"];
     
     NSString *path15 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"contact_mediaoverall.dat"];
     
     NSString *path16 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"contact_mediathumbnailoverall.dat"];
     
     
     
 
    
    // Unarchive Array
    NSMutableArray *theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    
    groupchats_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
    
    
     group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
    
     time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
    
     group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
    
    group_id_overall=[NSKeyedUnarchiver unarchiveObjectWithFile:path6];
    
    userid_overall=[NSKeyedUnarchiver unarchiveObjectWithFile:path7];
    
    usersocialname_overall=[NSKeyedUnarchiver unarchiveObjectWithFile:path8];
    phonesource_overall=[NSKeyedUnarchiver unarchiveObjectWithFile:path9];
     request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path11];
    
     group_conversationid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path12];
    
    
    /*
     
     usersocialname_overall=[NSKeyedUnarchiver unarchiveObjectWithFile:path8];
     phonesource_overall=[NSKeyedUnarchiver unarchiveObjectWithFile:path9];
     request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path11];
     
     group_conversationid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path12];
     
     
     */
    
    
    
    NSLog(@"Group  saved notification array: %@", theArray);
    
    NSLog(@"Group  titles saved notification array: %@", group_titles_overall);
    
    NSLog(@"Group  time saved notification array: %@", time_sent_overall);
    
     NSLog(@"Group  chats saved notification array: %@", groupchats_overall);
    
    
    
    
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
   // tableArray= [NSMutableArray arrayWithObjects:@"Welcome Teddy",nil];
    
    if (!theArray || !theArray.count){
        
         tableArray=[[NSMutableArray alloc] init];
        
        
        titleArray=[[NSMutableArray alloc] init];
        
        typeArray=[[NSMutableArray alloc] init];
        
        statusArray=[[NSMutableArray alloc] init];
        
        timestampArray=[[NSMutableArray alloc] init];
        
        groupidArray=[[NSMutableArray alloc] init];
        
        useridArray=[[NSMutableArray alloc] init];
        
        usersocialnameArray=[[NSMutableArray alloc] init];
        
        phonesourceArray=[[NSMutableArray alloc] init];
        
         groupchatArray=[[NSMutableArray alloc] init];
        
         groupconversationidArray=[[NSMutableArray alloc] init];
        
      
        
        
    }else{
    
        
        tableArray=[[NSMutableArray alloc] init];
        
        
        titleArray=[[NSMutableArray alloc] init];
        
        typeArray=[[NSMutableArray alloc] init];
        
        statusArray=[[NSMutableArray alloc] init];
        
        timestampArray=[[NSMutableArray alloc] init];
        
        groupidArray=[[NSMutableArray alloc] init];
        
        useridArray=[[NSMutableArray alloc] init];
        
        usersocialnameArray=[[NSMutableArray alloc] init];
        
        phonesourceArray=[[NSMutableArray alloc] init];
        groupchatArray=[[NSMutableArray alloc] init];
         groupconversationidArray=[[NSMutableArray alloc] init];
        
   
        [tableArray addObjectsFromArray:theArray];
        
         [titleArray addObjectsFromArray:group_titles_overall];
        
        
         [typeArray addObjectsFromArray:request_type_overall];
        
         [statusArray addObjectsFromArray:group_status_overall];
        
         [timestampArray addObjectsFromArray:time_sent_overall];
        
        [groupidArray addObjectsFromArray:group_id_overall];
        
        
        [useridArray addObjectsFromArray:userid_overall];
        
        [usersocialnameArray addObjectsFromArray:usersocialname_overall];
        
        [phonesourceArray addObjectsFromArray:phonesource_overall];
        
         [groupchatArray addObjectsFromArray:groupchats_overall];
        // groupconversationidArray=[[NSMutableArray alloc] init];
         [groupconversationidArray addObjectsFromArray:group_conversationid_overall];
        
        
        
    
    }
    
    //implement send money
    
    [self.view setUserInteractionEnabled:NO];
    [self.activityIndicatorView startAnimating];
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(
                                                       DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        
        
        @try {
            
            {
                
                NSString *deviceid= [[[UIDevice currentDevice] identifierForVendor] UUIDString];
                
                //cardid
                
                NSString *post =[[NSString alloc] initWithFormat:@"userid=%@&logintoken=%@",useridthis,tokenthis];
                
                
                NSLog(@"PostData: %@",post);
                
                NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/chamah_front/chama_group_details.php"];
                
                NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                
                NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
                
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                [request setURL:url];
                [request setHTTPMethod:@"POST"];
                [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                [request setHTTPBody:postData];
                
                //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
                
                NSError *error = [[NSError alloc] init];
                NSHTTPURLResponse *response = nil;
                NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
                
                NSLog(@"Response code: %d", [response statusCode]);
                if ([response statusCode] >=200 && [response statusCode] <300)
                {
                    NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                    NSLog(@"Response ==> %@", responseData);
                    
                    SBJsonParser *jsonParser = [SBJsonParser new];
                    NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
                    NSLog(@"%@",jsonData);
                    //create array
                    // main array
                    NSArray *success_array = [jsonData valueForKeyPath:@"success"];
                    
                     NSArray *group_details_array = [jsonData valueForKeyPath:@"all_groups"];
                    
                  ;
                    
                    NSString *user_id = [success_array valueForKeyPath:@"user_id"];
                    NSString *user_name = [success_array valueForKeyPath:@"user_name"];
                    NSString *user_balance_this = [success_array valueForKeyPath:@"user_balance"];
                    NSString *user_unpayed_loans_this = [success_array valueForKeyPath:@"user_unpayed_loans"];
                    NSString *loan_limit_this = [success_array valueForKeyPath:@"loan_limit"];
                    NSString *currency_this = [success_array valueForKeyPath:@"currency"];
                    NSString *number_of_groups = [success_array valueForKeyPath:@"number_of_groups"];
                    
                    NSString *number_of_contacts = [success_array valueForKeyPath:@"number_of_contacts"];
                    
                    
                    NSArray *notifications_array = [success_array valueForKeyPath:@"notifications"];
                    
                    //assign_parmanent_values
                    
                    chamaahdata *obj=[chamaahdata getInstance];
                    obj.user_name= user_name;
                    
                    chamaahdata *obj9=[chamaahdata getInstance];
                    obj9.useridGlob= user_id;
                    
                    chamaahdata *obj8=[chamaahdata getInstance];
                    obj8.username_id= user_name;
                    
                    chamaahdata *obj2=[chamaahdata getInstance];
                    obj2.user_balance= user_balance_this;
                    
                    chamaahdata *obj3=[chamaahdata getInstance];
                    obj3.loan_balance= user_unpayed_loans_this;
                    
                    chamaahdata *obj4=[chamaahdata getInstance];
                    obj4.loan_limit= loan_limit_this;
                    
                    chamaahdata *obj5=[chamaahdata getInstance];
                    obj5.group_number= number_of_groups;
                    
                    chamaahdata *obj6=[chamaahdata getInstance];
                    obj6.contacts_number= number_of_contacts ;
                    
                    chamaahdata *obj7=[chamaahdata getInstance];
                    obj7.user_currency= currency_this ;
                    
              //declare arrayss to hold all values here
                    NSMutableArray *groupname_array = [[NSMutableArray alloc] init];
                    
                    NSMutableArray *groupid_array = [[NSMutableArray alloc] init];
                    
                    
                    NSMutableArray *groupbalance_array = [[NSMutableArray alloc] init];
                    
                    
                    NSMutableArray *groupconversationid_array = [[NSMutableArray alloc] init];
                    
                    NSMutableArray *groupsourceid_array = [[NSMutableArray alloc] init];
                    
                    
                    NSMutableArray *groupsourcephone_array = [[NSMutableArray alloc] init];
                    
                    NSMutableArray *groupsocialid_array = [[NSMutableArray alloc] init];
                    
                    
                    NSMutableArray *groupdescription_array = [[NSMutableArray alloc] init];
                    
                    NSMutableArray *grouptime_array = [[NSMutableArray alloc] init];
                    
                    NSMutableArray *groupstatus_array = [[NSMutableArray alloc] init];
                    
                    NSMutableArray *grouptype_array = [[NSMutableArray alloc] init];

//PARSE ALL VALUES FOR GROUPS
                    //count number of groups here
                     NSUInteger myCount_this =[group_details_array count];
                    
                    
                     int Groupstartvalue;
                    
                    NSString * total_notifications_count;
                    
                   
                    
                     NSLog(@"Group Details Number  ==> %lu",myCount_this);
                    
                    
                    
                    for (Groupstartvalue=1;Groupstartvalue<=myCount_this;Groupstartvalue++) {
                    NSString *groupvalue=[NSString stringWithFormat:@"group%d",Groupstartvalue];
                     
                        NSMutableArray *grouparray_values = [[NSMutableArray alloc] init];
                        
                        grouparray_values = [group_details_array valueForKeyPath:groupvalue];
                        
                         NSLog(@"Parent For start  ==> %@", grouparray_values);
                        
                        //parse individual values here
                        
                        NSString *groupname = [grouparray_values valueForKeyPath:@"group_name"];
                        
                        NSString *groupid = [grouparray_values valueForKeyPath:@"group_id"];
                        
                        NSString *groupbalance = [grouparray_values valueForKeyPath:@"group_balance"];
                        
                        /*
                         _groupid1=groupid;
                         _groupname1=groupname;
                         _groupbalance1=groupbalance;
                         
                         */
                        
                        NSMutableArray *groupnotifications1 = [[NSMutableArray alloc] init];
                        groupnotifications1 = [grouparray_values valueForKeyPath:@"notifications"];
                        
                        
                        
                        NSUInteger myCount =[groupnotifications1 count];
                        
                        
                        NSLog(@"Integer count For Parent: %lu", myCount);
                        
                        
                        int startvalue;
                        
                        
                        
                       
                        
                        for (startvalue=1;startvalue<myCount;startvalue++) {
                            
                           
                            
                            
                            NSString *keyvalue=[NSString stringWithFormat:@"notification%d",startvalue];
                            
                            
                            
                            NSLog(@"KeyValue for child : %@", keyvalue);
                            
                            NSMutableArray *notification_array_this = [[NSMutableArray alloc] init];
                            //extract value of current notification
                            notification_array_this = [groupnotifications1 valueForKeyPath:keyvalue];
                            //end of extract value and start of extract individual values
                            NSLog(@"Single Notification Array for parent: %@", notification_array_this);
                            
                            
                            
                            NSString * notification_conversation_id =[notification_array_this valueForKeyPath:@"conversation_id"];
                            
                            NSString * notification_source_id =[notification_array_this valueForKeyPath:@"source_id"];
                            
                            NSString * notification_source_phone =[notification_array_this valueForKeyPath:@"source_phone"];
                            
                            
                            NSString * notification_social_id =[notification_array_this valueForKeyPath:@"source_social_id"];
                            
                            
                            NSString * notification_description =[notification_array_this valueForKeyPath:@"description"];
                            
                            
                            NSString * notification_time =[notification_array_this valueForKeyPath:@"notification_time"];
                            
                            NSString * notification_type =[notification_array_this valueForKeyPath:@"notification_type"];
                            
                            NSString * notification_status =[notification_array_this valueForKeyPath:@"notification_status"];
                            
                            [groupname_array addObject:groupname];
                            
                            //groupid
                            
                            [groupid_array addObject:groupid];
                            
                            
                            [groupbalance_array addObject:groupbalance];
                            
                            
                            
                            [groupconversationid_array addObject:notification_conversation_id];
                            //
                            
                            [groupsourceid_array addObject:notification_source_id];
                            
                            
                            [groupsourcephone_array addObject:notification_source_phone];
                            
                            [groupsocialid_array addObject:notification_social_id];
                            
                            
                            [groupdescription_array addObject:notification_description];
                            
                            [grouptime_array addObject:notification_time];
                            
                            
                            [groupstatus_array addObject:notification_status];
                            
                            [grouptype_array addObject:notification_type];
                            
                            
                            
                            
                         //end of For Child statement
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
                        
                        
                       
                        
                        NSString *newString = [NSString stringWithFormat:@"%lu", (unsigned long)groupdescription_array.count];
                        
                   total_notifications_count =[NSString stringWithFormat:@"%@",newString];
                    
                        
                        
                        [groupname_array addObject:groupname];
                        
                        //groupid
                        
                        [groupid_array addObject:groupid];
                        
                        
                        [groupbalance_array addObject:groupbalance];
                        
                        [groupconversationid_array addObject:notification_conversation_id];
                        //
                        
                        [groupsourceid_array addObject:notification_source_id];
                        
                        
                        [groupsourcephone_array addObject:notification_source_phone];
                        
                        [groupsocialid_array addObject:notification_social_id];
                        
                        
                        [groupdescription_array addObject:notification_description];
                        
                        [grouptime_array addObject:notification_time];
                        
                        
                        [groupstatus_array addObject:notification_status];
                        
                        [grouptype_array addObject:notification_type];
                        
                        /*
                         NSMutableArray *groupidArray;
                         
                         NSMutableArray *useridArray;
                         
                         NSMutableArray *usersocialnameArray;
                         
                         NSMutableArray *phonesourceArray;
                         
                         */
                        
                        
                        
                        
                        
                        //end of parse array values to overall arrays

                        
                    //end of For parent statement
                    }
                    
                    //assign parsed values into individual arrays here
                    
                    [tableArray addObjectsFromArray:groupdescription_array];
                    
                    [titleArray addObjectsFromArray:groupname_array];
                    
                    
                    [typeArray addObjectsFromArray:grouptype_array];
                    
                    [statusArray addObjectsFromArray:groupstatus_array];
                    
                    [timestampArray addObjectsFromArray:grouptime_array];
                    
                    [groupidArray addObjectsFromArray:groupid_array];
                    
                    
                    [useridArray addObjectsFromArray:groupsourceid_array];
                    
                    [usersocialnameArray addObjectsFromArray:groupsocialid_array];
                    
                    [phonesourceArray addObjectsFromArray:groupsourcephone_array];
                    
                    [groupchatArray addObjectsFromArray:groupdescription_array];
                    
                   
                    [groupconversationidArray addObjectsFromArray:groupconversationid_array];
                    
                    
                    NSLog(@"Titles array saved  ==> %@", titleArray);
                    
                    NSLog(@"Chats array saved  ==> %@", groupchatArray);
                    
                    NSLog(@"times array saved  ==> %@", timestampArray);
                    
                    NSLog(@"types array saved  ==> %@", typeArray);




                    //end of assign parsed values into individual arrays here
                    
                    
                   //END OF PARSE VALUES FOR ALL GROUPS
                    
                    
                    //end_assignpermanet_values
                    
                  
                 NSArray *allKeys    = [jsonData allKeys];
                    
                     NSLog(@"All Keys  ==> %@", allKeys);
                    
                    NSLog(@"Group Details All  ==> %@", group_details_array);
                    
                    
                    
                    
                    NSMutableArray *TempArray = [[NSMutableArray alloc] init];
                    
                    for (NSString *tempObject in notifications_array) {
                        
                        NSLog(@"Single element: %@", tempObject);
                        
                        NSString *valueforKey=[NSString stringWithFormat:@"%@",[notifications_array valueForKey:tempObject]];
                        
                        NSLog(@"Value for Key: %@", valueforKey);
                        
                        [TempArray addObject:valueforKey];
                        
                        [group_notification_this addObject:valueforKey];
                        
                    }
                    
                    
                   

                /*
                    for(int i = 0; i < [notifications_array count]; i++) {
                        
                        NSString * myArrayElement = [notifications_array objectAtIndex:i];
                       
                        [TempArray addObject:myArrayElement];
                        
                    }
                   
                  */
                     [tableArray addObjectsFromArray:TempArray];
                    
                    
                    chamaahdata *obj10=[chamaahdata getInstance];
                    obj10.group_notifications= group_notification_this;
                    
                    
                    //RELOAD DATA IN TABLE VIEW
                    
                   
                    
                    
                    //END OF RELOAD DATA IN TABLE VIEW
                    
                    
                    
                    
/*
                    for (NSString *tempObject in notifications_array) {
                        
                        NSLog(@"Single element: %@", tempObject);
                        
                        [tableArray addObject:tempObject];
                        
                    }
                    */
                    
                     NSLog(@"New Table array ==> %@", tableArray);
                    
                   // [array_this addObject:tableArray];
                    
                    
                    /* NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                     */
                    
                    NSLog(@"success array ==> %@", success_array);
                    
                    NSLog(@"notifications array ==> %@", notifications_array);
                    
                    NSLog(@"User ID ==> %@", user_id);
                                       NSLog(@"User Name ==> %@", user_name);
                    
                    
                 [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                    
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // UI code here
                        
                        [self.view setUserInteractionEnabled:YES];
                        
                        _groups_notifications.text=[NSString stringWithFormat:@"%@%@",number_of_groups,@" Groups"];
                        
                        _groups_notification_label.text=[NSString stringWithFormat:@"%@",total_notifications_count];
                        
                        _events_notifications.text=[NSString stringWithFormat:@"%@%@",number_of_contacts,@" Friends"];
                        
                        _name_label.text=[NSString stringWithFormat:@"%@",user_name];
                        
                        //RELOAD DATA IN TABLE VIEW
                        
                        [tableView reloadData];
                        
                        
                        //END OF RELOAD DATA IN TABLE VIEW
  
                        
                        
                        
                        
                        //save array
                        
                    
                        
                        // Determine Path
                        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"notificationsarchive.dat"];
                        
                        // Archive Array
                        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
                        [data writeToFile:path options:NSDataWritingAtomic error:nil];
                      
                    
                        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"wwgroupsarchive.dat"];
                        
                        // Archive Array
                        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:group_details_array];
                        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
                        
                        
                        
                        NSString *path10 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"groupchatsoverall.dat"];
                        
                        NSData *data10 = [NSKeyedArchiver archivedDataWithRootObject:groupchatArray];
                        [data10 writeToFile:path10 options:NSDataWritingAtomic error:nil];

                        
                        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"grouptitlesoverall.dat"];
                        
                        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
                        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];

                        
                        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timetotal.dat"];
                        
                        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
                        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];

                        
                        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"statustotal.dat"];
                        
                        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
                        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];

                        
                        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"groupidsoverall.dat"];
                        
                        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:groupidArray];
                        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];

                        
                        NSString *path7 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"useridoverall.dat"];
                        
                        NSData *data7 = [NSKeyedArchiver archivedDataWithRootObject:useridArray];
                        [data7 writeToFile:path7 options:NSDataWritingAtomic error:nil];

                        
                        NSString *path8 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"usersocialnameoverall.dat"];
                        
                        NSData *data8 = [NSKeyedArchiver archivedDataWithRootObject:usersocialnameArray];
                        [data8 writeToFile:path8 options:NSDataWritingAtomic error:nil];

                        
                        NSString *path9 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"phonesourceoverall.dat"];
                        
                        NSData *data9 = [NSKeyedArchiver archivedDataWithRootObject:phonesourceArray];
                        [data9 writeToFile:path9 options:NSDataWritingAtomic error:nil];
                        
                        NSString *path11 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"grouptypeoverall.dat"];
                        
                        NSData *data11 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
                        [data10 writeToFile:path10 options:NSDataWritingAtomic error:nil];
                        
                        NSString *path12 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"groupconversationid.dat"];
                        
                        NSData *data12 = [NSKeyedArchiver archivedDataWithRootObject:groupconversationidArray];
                        [data10 writeToFile:path10 options:NSDataWritingAtomic error:nil];


                        
                        
                        //end of saved group arrays
                        
                        
                    });
                    
                    
                    
                } else {
                    
                    [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                    
                    
                    
                    if (error) NSLog(@"Error: %@", error);
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // UI code here
                        
                        [self.view setUserInteractionEnabled:YES];
                        
                        [self alertStatus:@"Connection Failed" :@"Request Failed!"];
                        
                        
                    });
                    
                    
                    
                }
            }
        }
        @catch (NSException * e) {
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            
            NSLog(@"Exception: %@", e);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // UI code here
                
                [self.view setUserInteractionEnabled:YES];
                
                
                [self alertStatus:@"Request not completed." :@"Send Money failed!"];
            });
            
            
        }
        
        
        
    });
    
    
    
    
    
    
    //end of send request to server
    
   
    
    
}
    
    - (void) alertStatus:(NSString *)msg :(NSString *)title
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:msg
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil, nil];
        
        [alertView show];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[tableArray objectAtIndex:indexPath.row] capitalizedString];
    
    UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 9.0 ];
    cell.textLabel.font  = myFont;
    
    return cell;
     */
    
    
    mainCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"mainCell" bundle:nil]forCellReuseIdentifier:@"mainCell"];
        
        
        cell=[tableView dequeueReusableCellWithIdentifier:@"mainCell"];
        
        
    }
    
    
    
    
    
    return cell;
    
    
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(mainCell*)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if([titleArray count] > 0 && [titleArray count] > indexPath.row){
        
         cell.cellTitle.text = [titleArray objectAtIndex:indexPath.row];
        
    }
    else{
        
        //Array is empty,handle as you needed
        
          cell.cellTitle.text = @"User";
        
    }
    
    
    if([tableArray count] > 0 && [tableArray count] > indexPath.row){
        
        cell.cellDetailsLabel.text = [tableArray objectAtIndex:indexPath.row];
        
    }
    else{
        
        //Array is empty,handle as you needed
        
        cell.cellDetailsLabel.text = @"N/A";
        
    }
    

    if([timestampArray count] > 0 && [timestampArray count] > indexPath.row){
        
        cell.cellTime.text = [timestampArray objectAtIndex:indexPath.row];

        
    }
    else{
        
        //Array is empty,handle as you needed
        
        cell.cellTime.text = @"N/A";
        
    }
    
    
    if([typeArray count] > 0 && [typeArray count] > indexPath.row){
        
      
        
        NSString *type_This = [typeArray objectAtIndex:indexPath.row];
        
        if([type_This isEqualToString:@"sendmoney"]){
            //status is equal to delivered
            
            UIImage *img =[UIImage imageNamed: @"money_in_back_thumbnail.png"];
            [cell.cellImage setImage:img];
            
            
            
            
        }else if([type_This isEqualToString:@"receivemoney"]){
            //status is not equal to delivered
            
            UIImage *img =[UIImage imageNamed: @"money_out_back_thumbnail.png"];
            [cell.cellImage setImage:img];
            
            
            
            
        }else{
            //status is equal to sent
            
            UIImage *img =[UIImage imageNamed: @"user_placeholder.png"];
            [cell.cellImage setImage:img];
            
            
            
        }
        

        
        
    }
    else{
        
        //Array is empty,handle as you needed
        
        UIImage *img =[UIImage imageNamed: @"user_placeholder.png"];
        [cell.cellImage setImage:img];

        
    }
    
    
    
    
    
    
    
    
    
    //end of change image type
    
    
}




- (IBAction)backbutton:(id)sender {
    
     [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)profile_button:(id)sender {
}
- (IBAction)groups_button:(id)sender {
    
    
    groupsViewController * mimifirsterror =[[groupsViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
    
    
}

- (IBAction)savings_button:(id)sender {
    
    
    accountsViewController * mimifirsterror =[[accountsViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];

    
}



- (IBAction)accounts_button:(id)sender {
    
    
    attachedaccountsViewController * mimifirsterror =[[attachedaccountsViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
    

    
    
}

@end
