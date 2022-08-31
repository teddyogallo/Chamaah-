//
//  gorupinViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 29/11/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import "gorupinViewController.h"
#import "contributeViewController.h"
#import "groupinfoViewController.h"
#import "chamaahdata.h"
#import "SBJson.h"
#import "menuViewController.h"
#import "MyCustomCell.h"
#import "sendimagecellViewController.h"
#import "selectimageViewController.h"

#include <CommonCrypto/CommonDigest.h>

#import <LocalAuthentication/LocalAuthentication.h>








#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <net/if.h>
#include <netdb.h>

@interface gorupinViewController ()



@end

@implementation gorupinViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   //clear the image preview view off image data and buttons
    _ThumbNailImageView.image = nil;
    
    [_send_image_button_desc setHidden: TRUE];
    
    [_close_image_button_desc setHidden: TRUE];
    
    
    //end of clear image preview
    
    chamaahdata *obj1=[chamaahdata getInstance];
    
    NSString *useridthis=obj1.useridGlob;
    
    chamaahdata *obj2=[chamaahdata getInstance];
    
    NSString *tokenthis=obj2.tokenString;
    
    chamaahdata *obj3=[chamaahdata getInstance];
    
    NSString *active_group_this=obj3.active_group;
    
   
    
    
    chamaahdata *obj4=[chamaahdata getInstance];
    
    NSString *groupname_this=obj4.groupname_main;

    
    
    chamaahdata *obj5=[chamaahdata getInstance];
    
    NSString *groupid_this=obj5.groupid_main;

   
    
    chamaahdata *obj6=[chamaahdata getInstance];
    
    NSString *groupbalance_this=obj6.groupbalance_main;

    _group_name.text=[NSString stringWithFormat:@"%@", groupname_this];
    _balance_label.text= [NSString stringWithFormat:@"%@", groupbalance_this];
    
  
    
    
 NSMutableArray *theArray=[[NSMutableArray alloc] init];
    
    NSMutableArray *group_titles_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *group_status_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *request_type_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *time_sent_overall=[[NSMutableArray alloc] init];
    
    NSMutableArray *uniqueid_overall=[[NSMutableArray alloc] init];
    

    
    // Determine Path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    if([active_group_this isEqualToString:@"1"] ){
        //get array for group 1
        
        /*
        file names where group details are store in app memmory 
         
         @"conversationid9.dat"@"sourceid9.dat"
         @"sourcephone9.dat"
         
         @"accountid9.dat"
         @"messagedescription9.dat"
         @"timesent9.dat"
         @"deliverystatus9.dat"
         @"type9.dat"
         
         */
        
         NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription1.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid1.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];

        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus1.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
       
        
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverytype1.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];

        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent1.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid1.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];

        //count number of group status objects here
        
       
        
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
         NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
    /*
      
        if(indexStatus>indexID){
        
        while(indexStatus>indexID){
        //add empty object to array
            NSString *empty=@"delivered";
            
           [uniqueid_overall insertObject:empty atIndex:indexID];
            
            indexID=indexID+1;
        }

        }
        else if(indexStatus<indexID){
            
             while(indexStatus<indexID){
                 
                 
            
         
            [uniqueid_overall removeObjectAtIndex:indexStatus];
                 
             indexStatus=indexStatus+1;
                 
            
             }
            
        }

     
     */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
        
        
        //run function to update new messages from group members remotely
        
        
        
        
        //end of run function to update messges from group members remotely

        
    }else if([active_group_this isEqualToString:@"2"] ){
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagemessagedescription2.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        
        
        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid2.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus2.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type2.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent2.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid2.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);

    
        
    }else if([active_group_this isEqualToString:@"3"] ){
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription3.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid3.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus3.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type3.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent3.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid3.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
        
        
        
    }else if ([active_group_this isEqualToString:@"4"] ){
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription4.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid4.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus4.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type4.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent4.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid4.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
        
    }else if([active_group_this isEqualToString:@"5"] ){
        
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription5.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

        
        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid5.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus5.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type5.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent5.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid5.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
        
        
    }else if([active_group_this isEqualToString:@"6"] ){
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription6.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid6.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus6.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type6.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent6.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid6.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
        
        
    }else if([active_group_this isEqualToString:@"7"] ){
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription7.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid7.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus7.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type7.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent7.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid7.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
        
        
    }else if([active_group_this isEqualToString:@"8"] ){
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription8.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid8.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus8.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type8.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent8.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid8.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
        
        
    }else if([active_group_this isEqualToString:@"9"] ){
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription9.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

        
        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid9.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus9.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type9.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent9.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid9.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
  
        
    }else if([active_group_this isEqualToString:@"10"] ){
        
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription10.dat"];
        
        // Unarchive Array
        theArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        
        //for the chat titles
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid10.dat"];
        
        // Unarchive Array
        group_titles_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path2];
        
        //for the status
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus10.dat"];
        
        // Unarchive Array
        group_status_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path3];
        
        //for the request type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type10.dat"];
        
        // Unarchive Array
        request_type_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path4];
        
        //for the time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent10.dat"];
        
        // Unarchive Array
        time_sent_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path5];
        
        //for the unique id
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid10.dat"];
        
        // Unarchive Array
        uniqueid_overall = [NSKeyedUnarchiver unarchiveObjectWithFile:path6];
        
        //count number of group status objects here
        
        //count number of group status objects here
        
        
        NSUInteger indexStatus=[group_status_overall indexOfObject:[group_status_overall lastObject]];
        
        NSUInteger indexID=[uniqueid_overall indexOfObject:[uniqueid_overall lastObject]];
        
        
        
        /*
         
         if(indexStatus>indexID){
         
         while(indexStatus>indexID){
         //add empty object to array
         NSString *empty=@"delivered";
         
         [uniqueid_overall insertObject:empty atIndex:indexID];
         
         indexID=indexID+1;
         }
         
         }
         else if(indexStatus<indexID){
         
         while(indexStatus<indexID){
         
         
         
         
         [uniqueid_overall removeObjectAtIndex:indexStatus];
         
         indexStatus=indexStatus+1;
         
         
         }
         
         }
         
         
         */
        
        NSUInteger myCount =[uniqueid_overall count];
        
        
        NSLog(@"Unique count: %lu", myCount);
        
        NSUInteger myCount2 =[group_status_overall count];
        
        
        NSLog(@"Status count: %lu", myCount2);
        
        
        
    }

    
  
    
    
    NSLog(@"Group  saved notification array: %@", theArray);
    
    
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    if (!theArray || !theArray.count){
        
        tableArray=[[NSMutableArray alloc] init];
        
        tableArray=[[NSMutableArray alloc] init];
        
        titleArray=[[NSMutableArray alloc] init];
        
        typeArray=[[NSMutableArray alloc] init];
        
        statusArray=[[NSMutableArray alloc] init];
        
        uniqueidArray=[[NSMutableArray alloc] init];
        
        timestampArray=[[NSMutableArray alloc] init];
        //show notifications that group doesnt have any new notifications
       
         [self alertStatus:@"Group does not have any recent activity." :@"Alert!"];
        
        
    }else{
        
        tableArray=[[NSMutableArray alloc] init];
        
        titleArray=[[NSMutableArray alloc] init];
        
        typeArray=[[NSMutableArray alloc] init];
        
        statusArray=[[NSMutableArray alloc] init];
        
        timestampArray=[[NSMutableArray alloc] init];
        
        uniqueidArray=[[NSMutableArray alloc] init];
        
        
         NSUInteger myCount =[uniqueid_overall count];
        
        NSUInteger myCount2 =[group_status_overall count];
        
        if(myCount<myCount2){
            
            while(myCount<myCount2){
           //add objects
                
                NSString *empty=@"delivered";
                
                [uniqueid_overall insertObject:empty atIndex:myCount];
                
                
                myCount=myCount+1;
            }
            
           NSLog(@"Final count: %lu", myCount);
        }
        
        
        [tableArray addObjectsFromArray:theArray];
        
        
        [titleArray addObjectsFromArray:group_titles_overall];
        
        [typeArray addObjectsFromArray:request_type_overall];
        
        [statusArray addObjectsFromArray:group_status_overall];
        
        [timestampArray addObjectsFromArray:time_sent_overall];
        
        [uniqueidArray addObjectsFromArray:uniqueid_overall];
        
     
        
    }


    

    
    
    
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

-(void)showAlertWithTextField{
    UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Enter Amount to Send" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Send", nil];
    [dialog setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    // Change keyboard type
    [[dialog textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [dialog show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   
    
  
    if (buttonIndex == 1){
        NSLog(@"%@",[[alertView textFieldAtIndex:0]text]);
        
        //action when value is entered
        
        NSString *message_this=[[alertView textFieldAtIndex:0]text];
        
        NSString *request_type_this=[NSString stringWithFormat:@"%@",@"send_money"];
        
        NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
        NSMutableString *s = [NSMutableString stringWithCapacity:20];
        for (NSUInteger i = 0U; i < 20; i++) {
            u_int32_t r = arc4random() % [alphabet length];
            unichar c = [alphabet characterAtIndex:r];
            [s appendFormat:@"%C", c];
        }
        
        NSString *uniqueId = [NSString stringWithString:s];
        
        
        [self sendRequest:request_type_this :message_this:uniqueId];
        
        //reload table and refresh status
        NSString *endmessage=[NSString stringWithFormat:@"%@%@",@"Sent :",message_this];
        
        
        NSString *status_this=@"sent";
        
        chamaahdata *obj1=[chamaahdata getInstance];
        
        NSString *usernmthis=obj1.username_id;
        
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        NSString *formattedDateString = [dateFormatter stringFromDate:date];
        
        // NSString *timeNow=[NSDateFormatter setDateFormat:@"hh:mm a"];
        
     
        
        NSUInteger numObjectsStatus = [statusArray count];
        
        NSUInteger numObjectsuniqueid = [uniqueidArray count];
        
         //NSUInteger index_difference =numObjectsStatus+1;
        
        
        
        [titleArray addObject:usernmthis];
        
        [typeArray addObject:request_type_this];
        
        [statusArray addObject:status_this];
        
        [uniqueidArray addObject:uniqueId];
        
        
        NSLog(@"array edited '%@'",uniqueidArray);
        
        //[uniqueidArray insertObject:uniqueId atIndex:numObjectsStatus];
        
        [timestampArray addObject:formattedDateString];

        
        [tableArray addObject:endmessage];
        
        [tableView setContentOffset:CGPointMake(0, CGFLOAT_MAX)];
        
        
        [tableView reloadData];
        
        //check active group here
        chamaahdata *obj3=[chamaahdata getInstance];
        
        NSString *active_group_this=obj3.active_group;
        
        if([active_group_this isEqualToString:@"1"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription1.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
           
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid1.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus1.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverytype1.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent1.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
             NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid1.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
          
            
        }else if([active_group_this isEqualToString:@"2"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription2.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid2.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus2.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type2.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent2.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid2.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
            
            
        }else if([active_group_this isEqualToString:@"3"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription3.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid3.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus3.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type3.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent3.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
           
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid3.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
        }else if([active_group_this isEqualToString:@"4"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription4.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid4.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus4.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type4.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent4.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid4.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
            
            
        }else if([active_group_this isEqualToString:@"5"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription5.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid5.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus5.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type5.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent5.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid5.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
            
        }else if([active_group_this isEqualToString:@"6"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription6.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid6.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus6.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type6.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent6.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid6.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
        }else if([active_group_this isEqualToString:@"7"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription7.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid7.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus7.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type7.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent7.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid7.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
        }else if([active_group_this isEqualToString:@"8"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription8.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid8.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus8.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type8.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent8.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid8.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
            
            
        }else if([active_group_this isEqualToString:@"9"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription9.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid9.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus9.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type9.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent9.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid9.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
            
            
        }else if([active_group_this isEqualToString:@"10"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription10.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid10.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus10.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type10.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent10.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid10.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            
            
        }
        
        
        //end of saved tables here
        
    }


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



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellheight = 70; //assuming that your TextView's origin.y is 30 and TextView is the last UI element in your cell
    
    
    
    NSString *text = (NSString *)[tableArray objectAtIndex:indexPath.row];
    UIFont *font = [UIFont systemFontOfSize:10];// The font should be the same as that of your textView
    
    CGSize constraintSize = CGSizeMake(395.0f, MAXFLOAT);
    
    //CGSize constraintSize = CGSizeMake(maxWidth, CGFLOAT_MAX);// maxWidth = max width for the textView
    
    CGSize size = [text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    cellheight += size.height; //you can also add a cell padding if you want some space below textView
    
    
    
    NSLog(@"Cell height%f",cellheight);
    return cellheight;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   

    
    
    MyCustomCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"MyCustomCell" bundle:nil]forCellReuseIdentifier:@"myCell"];
        
        
        cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
        
      
    }
    
  
  [cell.textLabel sizeToFit];
   // cell.textLabel.attributedText = [tableArray objectAtIndex:indexPath.row]; // dont calculate height hear it will be called after "heightForRowAtIndexPath" method
   // cell.textLabel.numberOfLines = 8;
    
    
   
                           
                           return cell;
    
   
    
}

//additional method to show cell with the right content regardless of the position 

-(void)tableView:(UITableView *)tableView willDisplayCell:(MyCustomCell*)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([titleArray count] > 0 && [titleArray count] > indexPath.row){
        
        cell.topLabel.text = [titleArray objectAtIndex:indexPath.row];
    }
    else{
        
        //Array is empty,handle as you needed
        
        cell.topLabel.text = @"User";
        
    }
    
   
    if([tableArray count] > 0 && [tableArray count] > indexPath.row){
        
        if([typeArray count] > 0 && [typeArray count] > indexPath.row){
            
            NSString *type_This=[typeArray objectAtIndex:indexPath.row];
            
            if([type_This isEqualToString:@"send_message"]){
            
                
                cell.detailLabel.text = [tableArray objectAtIndex:indexPath.row];
                
                UIImage *img =[UIImage imageNamed: @"blank_image.png"];
                
                [cell.cell_image_view setImage:img];
                

            
            }else
            if([type_This isEqualToString:@"send_image"]){
                //start message type is sentimage
            //change image view here
                
                NSString *filePath=[tableArray objectAtIndex:indexPath.row];
                
                
                NSData *pngData = [NSData dataWithContentsOfFile:filePath];
                UIImage *image = [UIImage imageWithData:pngData];
                
                //check if the image view is empty and put an image inside
                if( image ){
                    // do something if IMAGE ISNT NIL
                    
                   
                    [cell.cell_image_view setImage:image];
                    
                     cell.cell_image_view.image=image;
                    
                } else {
                    // DO SOMETHING IF IMAGE IS NIL
                    
                     UIImage *img =[UIImage imageNamed: @"no_image_available.png"];
                  
                     [cell.cell_image_view setImage:img];
                }
                
               
                
                
                
            //end of message type is sent image
            }else if([type_This isEqualToString:@"receive_image"]){
                //start message type is received image
                
                
                
            //end of message type is received image
            }else{
        
        cell.detailLabel.text = [tableArray objectAtIndex:indexPath.row];
        
                UIImage *img =[UIImage imageNamed: @"blank_image.png"];
                
                [cell.cell_image_view setImage:img];
     
                //end of message type is not image
            }
            
            //end of check if type array is image type
        }
        
        
    }
    else{
        
        //Array is empty,handle as you needed
        
        cell.detailLabel.text = @"N/A";
        
    }
    
    
    
    if([timestampArray count] > 0 && [timestampArray count] > indexPath.row){
        
        cell.timeLabel.text = [timestampArray objectAtIndex:indexPath.row];
        
        
    }
    else{
        
        //Array is empty,handle as you needed
        
        cell.timeLabel.text = @"N/A";
        
    }
    
    
    
    if([statusArray count] > 0 && [statusArray count] > indexPath.row){
        
         NSString *status_This=[statusArray objectAtIndex:indexPath.row];
        
        //change images in the file
        if([status_This isEqualToString:@"read"]){
            //status is equal to delivered
            
            UIImage *img =[UIImage imageNamed: @"yes_image.png"];
            [cell.statusImage setImage:img];
            
            
        }else if([status_This isEqualToString:@"notdelivered"]){
            //status is not equal to delivered
            
            UIImage *img =[UIImage imageNamed: @"no_image.png"];
            [cell.statusImage setImage:img];
            
            
        }else{
            //status is equal to sent
            
            UIImage *img =[UIImage imageNamed: @"accountverified.png"];
            [cell.statusImage setImage:img];
            
        }
        
        //change image type

        
        
    }
    else{
        
        //Array is empty,handle as you needed
        
        UIImage *img =[UIImage imageNamed: @"accountverified.png"];
        [cell.statusImage setImage:img];
        
    }
    

    
    
    if([typeArray count] > 0 && [typeArray count] > indexPath.row){
        
        NSString *type_This=[typeArray objectAtIndex:indexPath.row];
        
        
        if([type_This isEqualToString:@"send_money"]){
            //status is equal to delivered
            
            UIImage *img =[UIImage imageNamed: @"money_in_back_thumbnail.png"];
            [cell.notificationtype setImage:img];
            
            UIImage *img2 =[UIImage imageNamed: @"money_background_hollow.png"];
            [cell.background_image setImage:img2];
            
            
        }else if([type_This isEqualToString:@"receive_money"]){
            //status is not equal to delivered
            
            UIImage *img =[UIImage imageNamed: @"money_out_back_thumbnail.png"];
            [cell.notificationtype setImage:img];
            
            UIImage *img2 =[UIImage imageNamed: @"money_in_background_hollow.png"];
            [cell.background_image setImage:img2];
            
            
        }else if([type_This isEqualToString:@"send_image"]){
            //status is equal to delivered
            
            UIImage *img =[UIImage imageNamed: @"blank_image.png"];
            [cell.notificationtype setImage:img];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_image.png"];
            [cell.background_image setImage:img2];
            
            
            
            
        }else if([type_This isEqualToString:@"receive_image"]){
            //status is equal to delivered
            
            UIImage *img =[UIImage imageNamed: @"blank_image.png"];
            [cell.notificationtype setImage:img];
            
            UIImage *img2 =[UIImage imageNamed: @"blank_image.png"];
            [cell.background_image setImage:img2];
            
            
            
            
        }else if([type_This isEqualToString:@"self"]){
            //status is equal to sent
            
            UIImage *img =[UIImage imageNamed: @"user_placeholder.png"];
            [cell.notificationtype setImage:img];
            
            UIImage *img2 =[UIImage imageNamed: @"send_message_hollow.png"];
            [cell.background_image setImage:img2];
            
        }else {
            //status is equal to sent
            
            UIImage *img =[UIImage imageNamed: @"user_placeholder.png"];
            [cell.notificationtype setImage:img];
            
            UIImage *img2 =[UIImage imageNamed: @"send_message_hollow.png"];
            [cell.background_image setImage:img2];
            
        }
        
        
        
        
        //end of change image type

        
        
        
    }
    else{
        
        //Array is empty,handle as you needed
        
        UIImage *img =[UIImage imageNamed: @"user_placeholder.png"];
        [cell.notificationtype setImage:img];
        
        UIImage *img2 =[UIImage imageNamed: @"send_message_in.png"];
        [cell.background_image setImage:img2];

        
    }
   
   
   
    
    
    
    
    
    
}


/*
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}
 
 */

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"mySectionName", @"mySectionName");
            break;
        case 1:
            sectionName = NSLocalizedString(@"myOtherSectionName", @"myOtherSectionName");
            break;
            // ...
        default:
            sectionName = @"Default this";
            break;
    }
    return sectionName;
}
 */

- (IBAction)goback:(id)sender {
    
      [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)add_member:(id)sender {
    
    contributeViewController * mimifirsterror =[[contributeViewController  alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];
    

}
- (IBAction)group_info:(id)sender {
    
    
    groupinfoViewController * mimifirsterror =[[groupinfoViewController  alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];

    
    
    
}
- (IBAction)group_details_background:(id)sender {
    
    [_bar_textfield resignFirstResponder];
    
}

- (IBAction)BarTextEditStarted:(id)sender {
}

- (IBAction)Add_Action_Bar:(id)sender {
    
  //create alert menu for Bar Item
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Send to Group"
                                                                   message:@"Select an Item type to Send:"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *paymentAction = [UIAlertAction actionWithTitle:@"Send Money/Payment" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // this block runs when the driving option is selected
        
        [self showAlertWithTextField];
        
        
    }];
    UIAlertAction *imageAction = [UIAlertAction actionWithTitle:@"Send Image/Video" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // this block runs when the walking option is selected
        
        
        
     
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
            //end of if user has slected send image
    
        
        
    }];
  
    
  
    
    UIAlertAction *loanrequestAction = [UIAlertAction actionWithTitle:@"Loan Request" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // this block runs when the walking option is selected
    }];

    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:paymentAction];
    [alert addAction:imageAction];
    
    \
    [alert addAction:loanrequestAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    //end of create alert item for bar button
    
}

- (IBAction)camera_button_action:(id)sender {
    
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
        // [self dismissViewControllerAnimated:YES completion:NULL];
        
        
    }
    else{
        //device has Camera take picture
        
        [_send_image_button_desc setHidden: FALSE];
        
        [_close_image_button_desc setHidden: FALSE];
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
 
        
        
        
      //end of device doesnt have camera dont take picture
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
   
    
    [_send_image_button_desc setHidden: FALSE];
    
    [_close_image_button_desc setHidden: FALSE];
    
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.ThumbNailImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)options_button_action:(id)sender {
   
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Call Group"
                                                                   message:@"Create a Call or Conference Call by calling with options below:"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *videocallAction = [UIAlertAction actionWithTitle:@"Video Call" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // this block runs when the driving option is selected
    }];
    UIAlertAction *voicecallAction = [UIAlertAction actionWithTitle:@"Voice Call" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // this block runs when the walking option is selected
    }];
  
    
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:videocallAction];
    [alert addAction:voicecallAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)barTextEditEnded:(id)sender {
    
    
    if([[_bar_textfield text]isEqualToString:@""]){
    //do nothing textfield is empty
        
        
        
    }else{
        
      
        
        
        
        NSString *message_this=[_bar_textfield text];
        
        NSString *request_type_this=[NSString stringWithFormat:@"%@",@"send_message"];
        
        NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
        NSMutableString *s = [NSMutableString stringWithCapacity:20];
        for (NSUInteger i = 0U; i < 20; i++) {
            u_int32_t r = arc4random() % [alphabet length];
            unichar c = [alphabet characterAtIndex:r];
            [s appendFormat:@"%C", c];
        }
        
        NSString *uniqueId = [NSString stringWithString:s];
        
        
        
        [self sendRequest:request_type_this :message_this: uniqueId];
        
        //reload table and refresh status
        
        //save values in storage
        
        NSString *status_this=@"sent";
        
        chamaahdata *obj1=[chamaahdata getInstance];
        
        NSString *usernmthis=obj1.username_id;
        
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        NSString *formattedDateString = [dateFormatter stringFromDate:date];
        
       // NSString *timeNow=[NSDateFormatter setDateFormat:@"hh:mm a"];
        
        [titleArray addObject:usernmthis];
        
        [typeArray addObject:request_type_this];
        
        [statusArray addObject:status_this];
        
        [uniqueidArray addObject:uniqueId];
        
NSLog(@"array edited second '%@'",uniqueidArray);
        
        [timestampArray addObject:formattedDateString];
        
        [tableArray addObject:message_this];
        
         [tableView setContentOffset:CGPointMake(0, CGFLOAT_MAX)];
        
        [tableView reloadData];
        
        
        _bar_textfield.text= @"";
        
        //end of reload table and refresh status
        
        //check active group here
        chamaahdata *obj3=[chamaahdata getInstance];
        
        NSString *active_group_this=obj3.active_group;
        
        if([active_group_this isEqualToString:@"1"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
        
          
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription1.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid1.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus1.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverytype1.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent1.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid1.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
            
        }else if([active_group_this isEqualToString:@"2"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription2.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid2.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus2.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type2.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent2.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid2.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
        }else if([active_group_this isEqualToString:@"3"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription3.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid3.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus3.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type3.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent3.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid3.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
        }else if([active_group_this isEqualToString:@"4"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription4.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid4.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus4.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type4.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent4.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid4.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
        }else if([active_group_this isEqualToString:@"5"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription5.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid5.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus5.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type5.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent5.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid5.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
        }else if([active_group_this isEqualToString:@"6"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription6.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid6.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus6.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type6.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent6.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid6.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
        }else if([active_group_this isEqualToString:@"7"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription7.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid7.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus7.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type7.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent7.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid7.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
        }else if([active_group_this isEqualToString:@"8"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription8.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid8.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus8.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type8.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent8.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid8.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
        }else if([active_group_this isEqualToString:@"9"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription9.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid9.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus9.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type9.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent9.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid9.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
        }else if([active_group_this isEqualToString:@"10"] ){
            //save array for group 1
            //save tables here
            //for the chat description
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription10.dat"];
            
            // Archive Array
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
            [data writeToFile:path options:NSDataWritingAtomic error:nil];
            //for the username id description
            
            
            
            NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid10.dat"];
            
            // Archive Array
            NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
            [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
            //forst message status
            
            
            NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus10.dat"];
            
            // Archive Array
            NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
            [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
            //for message type
            
            NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type10.dat"];
            
            // Archive Array
            NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
            [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
            //for message time
            
            NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent10.dat"];
            
            // Archive Array
            NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
            [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
            
            
            
            
            NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid10.dat"];
            
            // Archive Array
            NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
            [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
            //for unique id
            

            
            
            
            
        }
        
        
        //end of saved tables here
        
        
        
        //end of save values to storage
  
    }
}

- (IBAction)send_image:(id)sender {
    
    //GRAB IMAGE FROM VIEW
    
    //create random file name here
    NSString *prefixString = @"chmww";
    
    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString] ;
    NSString *uniqueFileName = [NSString stringWithFormat:@"%@_%@%@", prefixString, guid,@".png"];
    
    NSLog(@"saved_image_file_name: '%@'", uniqueFileName);
    
    //end of create random file name here
    
    NSData *pngData = UIImagePNGRepresentation(_ThumbNailImageView.image);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *filePath = [documentsPath stringByAppendingPathComponent:uniqueFileName]; //Add the file name
    [pngData writeToFile:filePath atomically:YES]; //Write the file
    
    
    

    //END OF GRAB IMAGE FROM VIEW
    
    //save image data to table here
    
    
    
    NSString *message_this=filePath;
    
    NSString *request_type_this=[NSString stringWithFormat:@"%@",@"send_image"];
    
    NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
    NSMutableString *s = [NSMutableString stringWithCapacity:20];
    for (NSUInteger i = 0U; i < 20; i++) {
        u_int32_t r = arc4random() % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    
    NSString *uniqueId = [NSString stringWithString:s];
    
    NSString *file_type=@"image";
    
    
    
    [self sendFile:request_type_this :message_this: uniqueId:file_type:uniqueFileName];
    
    //reload table and refresh status
    
    //save values in storage
    
    NSString *status_this=@"sent";
    
    chamaahdata *obj1=[chamaahdata getInstance];
    
    NSString *usernmthis=obj1.username_id;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    
    // NSString *timeNow=[NSDateFormatter setDateFormat:@"hh:mm a"];
    
    [titleArray addObject:usernmthis];
    
    [typeArray addObject:request_type_this];
    
    [statusArray addObject:status_this];
    
    [uniqueidArray addObject:uniqueId];
    
    NSLog(@"array edited second '%@'",uniqueidArray);
    
    [timestampArray addObject:formattedDateString];
    
    [tableArray addObject:message_this];
    
    [tableView setContentOffset:CGPointMake(0, CGFLOAT_MAX)];
    
    [tableView reloadData];
    
   
    
    //end of reload table and refresh status
    
    //check active group here
    chamaahdata *obj3=[chamaahdata getInstance];
    
    NSString *active_group_this=obj3.active_group;
    
    
  
    
    
    NSUInteger numObjectsStatus = [statusArray count];
    
    NSUInteger numObjectsuniqueid = [uniqueidArray count];
    
    //NSUInteger index_difference =numObjectsStatus+1;
    



    
    if([active_group_this isEqualToString:@"1"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription1.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid1.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus1.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverytype1.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent1.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid1.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
        
        
    }else if([active_group_this isEqualToString:@"2"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription2.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid2.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus2.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type2.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent2.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid2.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
        
        
    }else if([active_group_this isEqualToString:@"3"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription3.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid3.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus3.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type3.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent3.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid3.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
    }else if([active_group_this isEqualToString:@"4"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription4.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid4.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus4.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type4.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent4.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid4.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
        
        
    }else if([active_group_this isEqualToString:@"5"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription5.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid5.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus5.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type5.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent5.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid5.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
        
    }else if([active_group_this isEqualToString:@"6"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription6.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid6.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus6.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type6.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent6.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid6.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
    }else if([active_group_this isEqualToString:@"7"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription7.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid7.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus7.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type7.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent7.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid7.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
    }else if([active_group_this isEqualToString:@"8"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription8.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid8.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus8.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type8.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent8.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid8.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
        
        
    }else if([active_group_this isEqualToString:@"9"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription9.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"accountid9.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus9.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type9.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent9.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid9.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
        
        
    }else if([active_group_this isEqualToString:@"10"] ){
        //save array for group 1
        //save tables here
        //for the chat description
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"messagedescription10.dat"];
        
        // Archive Array
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tableArray];
        [data writeToFile:path options:NSDataWritingAtomic error:nil];
        //for the username id description
        
        
        
        NSString *path2 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"socialid10.dat"];
        
        // Archive Array
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:titleArray];
        [data2 writeToFile:path2 options:NSDataWritingAtomic error:nil];
        //forst message status
        
        
        NSString *path3 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"deliverystatus10.dat"];
        
        // Archive Array
        NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:statusArray];
        [data3 writeToFile:path3 options:NSDataWritingAtomic error:nil];
        //for message type
        
        NSString *path4 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"type10.dat"];
        
        // Archive Array
        NSData *data4 = [NSKeyedArchiver archivedDataWithRootObject:typeArray];
        [data4 writeToFile:path4 options:NSDataWritingAtomic error:nil];
        //for message time
        
        NSString *path5 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"timesent10.dat"];
        
        // Archive Array
        NSData *data5 = [NSKeyedArchiver archivedDataWithRootObject:timestampArray];
        [data5 writeToFile:path5 options:NSDataWritingAtomic error:nil];
        
        
        
        NSString *path6 = [ [paths objectAtIndex:0] stringByAppendingPathComponent:@"uniqueid10.dat"];
        
        // Archive Array
        NSData *data6 = [NSKeyedArchiver archivedDataWithRootObject:uniqueidArray];
        [data6 writeToFile:path6 options:NSDataWritingAtomic error:nil];
        //for unique id
        
        
    }
    
    
    //end of saved tables here

    
    
    
    
   //action after sending the image
    
    _ThumbNailImageView.image = nil;
    
    [_send_image_button_desc setHidden: TRUE];
    
    [_close_image_button_desc setHidden: TRUE];
    
    //end of actions after sending the image
}

- (IBAction)exit_button:(id)sender {
    
    
    
    _ThumbNailImageView.image = nil;
    
    [_send_image_button_desc setHidden: TRUE];
    
     [_close_image_button_desc setHidden: TRUE];
}



- (void) sendRequest:(NSString *)requestType :(NSString *)value :(NSString *)uniqid
{
    
    //Send request to the Server
    
    chamaahdata *obj1=[chamaahdata getInstance];
    
    NSString *useridthis=obj1.useridGlob;
    
    chamaahdata *obj2=[chamaahdata getInstance];
    
    NSString *tokenthis=obj2.tokenString;
    
    chamaahdata *obj3=[chamaahdata getInstance];
    
    
    

    
    
    //[self.activityIndicatorView startAnimating];
    
  
    
    dispatch_queue_t queue = dispatch_get_global_queue(
                                                       DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        
        
        @try {
            
            {
                
                NSString *deviceid= [[[UIDevice currentDevice] identifierForVendor] UUIDString];
                
                //cardid
                
                NSArray *allIParray=self.localIPAddresses;
                
                
                NSString * overall_allIPS = [[allIParray valueForKey:@"description"] componentsJoinedByString:@","];
                
                
                NSArray *subStrings = [overall_allIPS componentsSeparatedByString:@","]; //or rather @" - "
                NSString *allIPS = [subStrings objectAtIndex:0];
                

                
                NSString *post =[[NSString alloc] initWithFormat:@"userid=%@&logintoken=%@&message=%@&uniqueid=%@&request_type=%@&deviceid=%@&ipaddress%@",useridthis,tokenthis,value,uniqid,requestType,deviceid,allIPS];
                
                
                NSLog(@"PostData: %@",post);
                
                NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/chamah_front/chama_message_request_json.php"];
                
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
                    NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                    NSLog(@"%d",success);
                    if(success == 1)
                    {
                        //When json is loaded stop the indicator
                        
                        //get data values
                        
                  
                        
                        
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // UI code here
                        
                        
                        NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                        
                        
                        
                        NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                        
                        
                        
                        NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                        
                        NSLog(@"Index of unique: %lu", indexOfTheObject);
                        
                        // NSUInteger indexOfTheObject=[group_status_overall indexOfObject:[group_status_overall lastObject]];
                        
                        
                        [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                        
                     
                        
                        [tableView reloadData];
                        
                       // [self.view setUserInteractionEnabled:YES];
                        
                        
                        //RELOAD DATA IN TABLE VIEW
                        
                        //get the Unique ID and status
                        
                
                        
                        
                    });
                    
                    }
                    else if(success == 2)
                    {
                        //When json is loaded stop the indicator
                        
                        //get data values
                        
                        NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                        
                        
                        
                        NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                        

                        
                        NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                        
                        
                        [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                        
                    
                        
                        //reload tableview here
                        [tableView reloadData];
                        
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                      
                            
                            NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                            
                            
                            
                            NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                            
                            
                            
                            NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                            
                            
                            [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                            
                           
                            
                            //reload tableview here
                            [tableView reloadData];
                            
                            
                            
                            
                            
                            
                        });
                        
                    }
                    

                    
                    else {
                        
                        //When json is loaded stop the indicator
                        
                                             [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                            
                            NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                            
                            
                            
                            NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                            
                            
                            
                            NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                            
                            
                            [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                            
                          
                            
                            
                            [tableView reloadData];
                            

                            
                            [self.view setUserInteractionEnabled:YES];
                            
                            
                            NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                            [self alertStatus:error_msg :@"Request Failed!"];
                        });
                        
                        
                    }
                    
  
                    
                } else {
                    
                    //[self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                    
                    
                    
                    if (error) NSLog(@"Error: %@", error);
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // UI code here
                        
                        //[self.view setUserInteractionEnabled:YES];
                        
                        [self alertStatus:@"Connection Failed" :@"Request Failed!"];
                        
                        
                    });
                    
                    
                    
                }
            }
        }
        @catch (NSException * e) {
            
            //[self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            
            NSLog(@"Exception: %@", e);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // UI code here
                
               // [self.view setUserInteractionEnabled:YES];
                
                
                [self alertStatus:@"Request not completed." :@"Send Money failed!"];
            });
            
            
        }
        
        
        
    });
    
    
    
    
    
    
    
    //end of send request to the server
 
}

///send file to the server


/**
-(void)saveImageToServer :(NSString *)requestType :(NSString *)value :(NSString *)uniqid  :(NSString *)file_type_this :(NSString *)file_name
{
    // COnvert Image to NSData
 
 //get the image
 NSData *pngData = [NSData dataWithContentsOfFile:value];
 UIImage *image = [UIImage imageWithData:pngData];

 
    NSData *dataImage =  [NSData dataWithContentsOfFile:value];
    
    // set your URL Where to Upload Image
    NSString *urlString = @"https://www.wayawaya.com/chamah_front/chama_file_request.php";
    
    // set your Image Name
    NSString *filename = file_name;
    
    chamaahdata *obj1=[chamaahdata getInstance];
    
    NSString *useridthis=obj1.useridGlob;
    
    chamaahdata *obj2=[chamaahdata getInstance];
    
    NSString *tokenthis=obj2.tokenString;
    
    chamaahdata *obj3=[chamaahdata getInstance];
    
    
    
    
    
    
    //[self.activityIndicatorView startAnimating];
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(
                                                       DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        
        
        @try {
            

    
    // Create 'POST' MutableRequest with Data and Other Image Attachment.
    NSMutableURLRequest* request= [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    NSMutableData *postbody = [NSMutableData data];
    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@.png\"\r\n", filename] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[NSData dataWithData:dataImage]];
    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:postbody];
    
    // Get Response of Your Request
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *responseString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"Response  %@",responseString);
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // UI code here
                
                //[self.view setUserInteractionEnabled:YES];
                
                [self alertStatus:@"Connection Failed" :@"Request Failed!"];
                
                
            });
      //END OF TRY
        }
        @catch (NSException * e) {
            
            //[self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            
            NSLog(@"Exception: %@", e);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // UI code here
                
                // [self.view setUserInteractionEnabled:YES];
                
                
                [self alertStatus:@"Request not completed." :@"Send Money failed!"];
            });
            
       //END OF TRY EXCEPTION
        }
        
  
        
     //dispatch_async
    });
    
    

}

*/

- (void) sendFile:(NSString *)requestType :(NSString *)value :(NSString *)uniqid  :(NSString *)file_type_this :(NSString *)file_name

{
    
    //Send request to the Server
    
    chamaahdata *obj1=[chamaahdata getInstance];
    
    NSString *useridthis=obj1.useridGlob;
    
    chamaahdata *obj2=[chamaahdata getInstance];
    
    NSString *tokenthis=obj2.tokenString;
    
    chamaahdata *obj3=[chamaahdata getInstance];
    
    
    
    //get the image
    NSData *pngData = [NSData dataWithContentsOfFile:value];
    UIImage *image = [UIImage imageWithData:pngData];

    
    //end of get the image
    
    
    //[self.activityIndicatorView startAnimating];
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(
                                                       DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        
        
        @try {
            
            {
                
                NSString *deviceid= [[[UIDevice currentDevice] identifierForVendor] UUIDString];
                
                //cardid
                
                NSArray *allIParray=self.localIPAddresses;
                
                
                NSString * overall_allIPS = [[allIParray valueForKey:@"description"] componentsJoinedByString:@","];
                
                
                NSArray *subStrings = [overall_allIPS componentsSeparatedByString:@","]; //or rather @" - "
                NSString *allIPS = [subStrings objectAtIndex:0];
                
                
                
                NSString *post =[[NSString alloc] initWithFormat:@"userid=%@&logintoken=%@&file_data=%@&file_name=%@&file_type=%@&uniqueid=%@&request_type=%@&deviceid=%@&ipaddress%@",useridthis,tokenthis,image,file_name,file_type_this,uniqid,requestType,deviceid,allIPS];
                
                
                NSLog(@"PostData: %@",post);
                
                NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/chamah_front/chama_file_request.php"];
                
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
                    NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                    NSLog(@"%d",success);
                    if(success == 1)
                    {
                        //When json is loaded stop the indicator
                        
                        //get data values
                        
                        
                        
                        
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                            
                            
                            NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                            
                            
                            
                            NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                            
                            
                            
                            NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                            
                            NSLog(@"Index of unique: %lu", indexOfTheObject);
                            
                            // NSUInteger indexOfTheObject=[group_status_overall indexOfObject:[group_status_overall lastObject]];
                            
                            
                            [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                            
                            
                            
                            [tableView reloadData];
                            
                            // [self.view setUserInteractionEnabled:YES];
                            
                            
                            //RELOAD DATA IN TABLE VIEW
                            
                            //get the Unique ID and status
                            
                            
                            
                            
                        });
                        
                    }
                    else if(success == 2)
                    {
                        //When json is loaded stop the indicator
                        
                        //get data values
                        
                        NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                        
                        
                        
                        NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                        
                        
                        
                        NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                        
                        
                        [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                        
                        
                        
                        //reload tableview here
                        [tableView reloadData];
                        
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                            
                            
                            NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                            
                            
                            
                            NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                            
                            
                            
                            NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                            
                            
                            [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                            
                            
                            
                            //reload tableview here
                            [tableView reloadData];
                            
                            
                            
                            
                            
                            
                        });
                        
                    }else if(success == 3)
                    {
                        //When json is loaded stop the indicator
                        
                        //get data values
                        
                        
                        
                        
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                            
                            
                            NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                            
                            
                            
                            NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                            
                            
                            
                            NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                            
                            NSLog(@"Index of unique: %lu", indexOfTheObject);
                            
                            // NSUInteger indexOfTheObject=[group_status_overall indexOfObject:[group_status_overall lastObject]];
                            
                            
                            [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                            
                            
                            
                            [tableView reloadData];
                            
                            // [self.view setUserInteractionEnabled:YES];
                            
                            
                            //RELOAD DATA IN TABLE VIEW
                            
                            //get the Unique ID and status
                            
                            
                            
                            
                        });
                        
                    }

                    
                    
                    
                    else {
                        
                        //When json is loaded stop the indicator
                        
                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                            
                            NSString *uniqueidR = (NSString *) [jsonData objectForKey:@"uniqueid"];
                            
                            
                            
                            NSString *statusR = (NSString *) [jsonData objectForKey:@"status"];
                            
                            
                            
                            NSUInteger indexOfTheObject = [uniqueidArray indexOfObject: uniqueidR];
                            
                            
                            [statusArray replaceObjectAtIndex:indexOfTheObject withObject:statusR];
                            
                            
                            
                            
                            [tableView reloadData];
                            
                            
                            
                            [self.view setUserInteractionEnabled:YES];
                            
                            
                            NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                            [self alertStatus:error_msg :@"Request Failed!"];
                        });
                        
                        
                    }
                    
                    
                    
                } else {
                    
                    //[self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                    
                    
                    
                    if (error) NSLog(@"Error: %@", error);
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // UI code here
                        
                        //[self.view setUserInteractionEnabled:YES];
                        
                        [self alertStatus:@"Connection Failed" :@"Request Failed!"];
                        
                        
                    });
                    
                    
                    
                }
            }
        }
        @catch (NSException * e) {
            
            //[self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            
            NSLog(@"Exception: %@", e);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // UI code here
                
                // [self.view setUserInteractionEnabled:YES];
                
                
                [self alertStatus:@"Request not completed." :@"Send Money failed!"];
            });
            
            
        }
        
        
        
    });
    
    
    
    
    
    
    
    //end of send request to the server
    
}




//end of send file to the server

//function to create sha512 token
+(NSString *)createSHA512:(NSString *)string
{
    const char *cstr = [string cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:string.length];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(data.bytes, data.length, digest);
    NSMutableString* output = [NSMutableString  stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}



- (NSString *)getIPAddress {
    
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
                
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
}



- (NSArray *)localIPAddresses
{
    NSMutableArray *ipAddresses = [NSMutableArray array] ;
    
    struct ifaddrs *allInterfaces;
    
    // Get list of all interfaces on the local machine:
    if (getifaddrs(&allInterfaces) == 0) {
        struct ifaddrs *interface;
        
        // For each interface ...
        for (interface = allInterfaces; interface != NULL; interface = interface->ifa_next) {
            unsigned int flags = interface->ifa_flags;
            struct sockaddr *addr = interface->ifa_addr;
            
            // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
            if ((flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING)) {
                if (addr->sa_family == AF_INET || addr->sa_family == AF_INET6) {
                    
                    // Convert interface address to a human readable string:
                    char host[NI_MAXHOST];
                    getnameinfo(addr, addr->sa_len, host, sizeof(host), NULL, 0, NI_NUMERICHOST);
                    
                    [ipAddresses addObject:[[NSString alloc] initWithUTF8String:host]];
                }
            }
        }
        
        freeifaddrs(allInterfaces);
    }
    return ipAddresses;
}


@end
