//
//  groupcreated2ViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 16/03/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "groupcreated2ViewController.h"
#import "mainmenuViewController.h"
#import "SBJson.h"
#import "chamaahdata.h"
#import "menuViewController.h"

@interface groupcreated2ViewController ()

@end

@implementation groupcreated2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
 
    
    chamaahdata *obj3=[chamaahdata getInstance];
    
    NSString *useridthis=obj3.useridGlob;
    
    chamaahdata *obj4=[chamaahdata getInstance];
    
    NSString *tokenthis=obj4.tokenString;
    
    
    //send request to server
    
    
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
                
                NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.co.ke/chama_registergroupjson.php"];
                
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
                    
                    NSString *group_id = [success_array valueForKeyPath:@"group_id"];
                    NSString *group_name = [success_array valueForKeyPath:@"group_name"];
                    NSArray *notifications_array = [success_array valueForKeyPath:@"notifications"];
                    
                    
                    
                   /* NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                    */
                    
                     NSLog(@"success array ==> %@", success_array);
                    
                     NSLog(@"notifications array ==> %@", notifications_array);
                    
                    NSLog(@"Group ID ==> %@", group_id);
                    NSLog(@"Group Name ==> %@", group_name);
                    
                    
                    
                    
                    
                   
                    
                 
                    
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

- (IBAction)go_back:(id)sender {
    
    mainmenuViewController * mimifirsterror =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:mimifirsterror animated:YES completion:NULL];

    
    
    
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

    
- (IBAction)add_contacts:(id)sender {
}
    
- (IBAction)add_facebook:(id)sender {
}
    
- (IBAction)add_pictures:(id)sender {
}
    
- (IBAction)view_members:(id)sender {
}
    
- (IBAction)view_media:(id)sender {
}
@end
