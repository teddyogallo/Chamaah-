//
//  confirmViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 09/05/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "confirmViewController.h"
#import "SBJson.h"
#import "chamaahdata.h"
#import "menuViewController.h"
#include <CommonCrypto/CommonDigest.h>
#import "mainmenuViewController.h"
#import "signupfullViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>






#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <net/if.h>
#include <netdb.h>




@interface confirmViewController ()

@end

@implementation confirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    chamaahdata *obj1=[chamaahdata getInstance];
    
    NSString *useridthis=obj1.useridGlob;
    
    _phonenumber_label.text=useridthis;
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



- (IBAction)exit_page:(id)sender {
    
    
    menuViewController * dashboard =[[menuViewController alloc]initWithNibName:nil bundle:nil];
    [self presentViewController:dashboard animated:YES completion:NULL];
}


- (IBAction)confirmcode_background:(id)sender {
    
    [_code_textfield resignFirstResponder];
    
}

- (IBAction)resend_code_action:(id)sender {
    
    
    
  
    
{
        
        chamaahdata *obj1=[chamaahdata getInstance];
        
        NSString *useridthis=obj1.useridGlob;
        
        chamaahdata *obj2=[chamaahdata getInstance];
        
        NSString *tokenthis=obj2.tokenString;
        
    
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //start of success async task
            
            [self.view setUserInteractionEnabled:NO];
            [self.activityIndicatorView startAnimating];
            
            
            
            
            dispatch_queue_t queue = dispatch_get_global_queue(
                                                               DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{
                //Load the json on another thread
                @try {
                    
                    {
                        
                        
                        //show request sending
                        
                        //end of show request sending
                        
                        //get unique device identifier
                        
                        // NSString *deviceip=self.getIPAddress;
                        NSArray *allIParray=self.localIPAddresses;
                        
                        
                        NSString * overall_allIPS = [[allIParray valueForKey:@"description"] componentsJoinedByString:@","];
                        
                        
                        NSArray *subStrings = [overall_allIPS componentsSeparatedByString:@","]; //or rather @" - "
                        NSString *allIPS = [subStrings objectAtIndex:0];
                        
                        
                        NSString *platform=@"ios";
                        
                        NSString *version=@"1.0";
                        
                        //NSString *deviceip=[[NSHost currentHost] address];
                        
                        //NSLog(@"0.All IPS: %@",allIPS);
                        
                        //NSLog(@"1. Overall All IPS: %@",overall_allIPS);
                        
                        // NSLog(@"1.Device Ip is this: %@",deviceip);
                        
                        
                        NSString *deviceid= [[[UIDevice currentDevice] identifierForVendor] UUIDString];
                        //NSString *combinedStr =[_password text];
                        //combinedStr=[combinedStr stringByAppendingString:deviceid];
                        
                        //createtoken value
                        // NSString *shaadstring =[signupfullViewController createSHA512:combinedStr];
                        
                        
                        //end of createloginstring
                        
                        
                        NSString *post =[[NSString alloc] initWithFormat:@"userid=%@&verifytype=%@&token=%@&deviceid=%@&ip=%@&platform=%@&version=%@",useridthis,[_code_textfield text],tokenthis,deviceid,allIPS,platform,version];
                        NSLog(@"PostData: %@",post);
                        
                        NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/chamah_front/phoneemailverifyjsonjson.php"];
                        
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
                        
                        //NSError *error = [[NSError alloc] init];
                        NSError *error = nil;
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
                            NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                            NSLog(@"%d",success);
                            if(success == 1)
                            {
                                //When json is loaded stop the indicator
                                
                                //get data values
                                
                                
                                
                                
                                
                                [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                
                                //add
                                
                                
                                
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    // UI code here
                                    
                                    
                                    
                                    
                                    [self.view setUserInteractionEnabled:YES];
                                    
                                    [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwUsername"];
                                    [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwPassword"];
                                    [[NSUserDefaults standardUserDefaults] synchronize];
                                    
                                    
                                    NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                                    [self alertStatus:error_msg :@"request sent!"];

                                    
                                    
                                });
                                
                                
                                
                                //end of switch to dashboard after succesfull login
                                
                                
                            }
                            else {
                                
                                //When json is loaded stop the indicator
                                
                                
                                [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    // UI code here
                                    [self.view setUserInteractionEnabled:YES];
                                    
                                    [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwUsername"];
                                    [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwPassword"];
                                    [[NSUserDefaults standardUserDefaults] synchronize];
                                    
                                    
                                    NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                                    [self alertStatus:error_msg :@"request Failed!"];
                                });
                                
                                
                            }
                            
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
                        
                        
                        
                        [self alertStatus:@"The request could not be processed on time." :@"Request Failed!"];
                        
                        
                        
                    });
                }
                
                
            });
            
            
            
            //end of process login above
            
            //end of success async task
        });
        
        //end of validate user input fields
        
    }
    

}

- (IBAction)confrim_button_action:(id)sender {
    
     if([ [_code_textfield text]  isEqualToString:@""] ){
            // PHONENUMBER FIELD IS EMPTY
         
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
         
         
            [self alertStatus:@"Please Enter the confirmation code to proceed" :@"Request not processed!"];
         
         
         
        }
    
      else {
          
          chamaahdata *obj1=[chamaahdata getInstance];
          
          NSString *useridthis=obj1.useridGlob;
          
          chamaahdata *obj2=[chamaahdata getInstance];
          
          NSString *tokenthis=obj2.tokenString;
          
                   
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //start of success async task
                
                [self.view setUserInteractionEnabled:NO];
                [self.activityIndicatorView startAnimating];
                
                
                
                
                dispatch_queue_t queue = dispatch_get_global_queue(
                                                                   DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_async(queue, ^{
                    //Load the json on another thread
                    @try {
                        
                        {
                            
                            
                            //show request sending
                            
                            //end of show request sending
                            
                            //get unique device identifier
                            
                            // NSString *deviceip=self.getIPAddress;
                            NSArray *allIParray=self.localIPAddresses;
                            
                            
                            NSString * overall_allIPS = [[allIParray valueForKey:@"description"] componentsJoinedByString:@","];
                            
                            
                            NSArray *subStrings = [overall_allIPS componentsSeparatedByString:@","]; //or rather @" - "
                            NSString *allIPS = [subStrings objectAtIndex:0];
                            
                            
                            NSString *platform=@"ios";
                            
                            NSString *version=@"1.0";
                            
                            //NSString *deviceip=[[NSHost currentHost] address];
                            
                            //NSLog(@"0.All IPS: %@",allIPS);
                            
                            //NSLog(@"1. Overall All IPS: %@",overall_allIPS);
                            
                            // NSLog(@"1.Device Ip is this: %@",deviceip);
                            
                            
                            NSString *deviceid= [[[UIDevice currentDevice] identifierForVendor] UUIDString];
                            //NSString *combinedStr =[_password text];
                            //combinedStr=[combinedStr stringByAppendingString:deviceid];
                            
                            //createtoken value
                            // NSString *shaadstring =[signupfullViewController createSHA512:combinedStr];
                            
                            
                            //end of createloginstring
                            
                            
                            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&smscode=%@&loginstring=%@&deviceid=%@&ipaddress=%@&platform=%@&version=%@",useridthis,[_code_textfield text],tokenthis,deviceid,allIPS,platform,version];
                            NSLog(@"PostData: %@",post);
                            
                            NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/chamah_front/smsverifyjson.php"];
                            
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
                            
                            //NSError *error = [[NSError alloc] init];
                            NSError *error = nil;
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
                                NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                                NSLog(@"%d",success);
                                if(success == 1)
                                {
                                    //When json is loaded stop the indicator
                                    
                                    //get data values
                                    
                                    
                                    
                                    
                                    
                                    [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                    
                                    //add
                                    
                                    
                                    
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        // UI code here
                                        
                                                                               
                                        
                                        
                                        [self.view setUserInteractionEnabled:YES];
                                        
                                        menuViewController * dashboard =[[menuViewController alloc]initWithNibName:nil bundle:nil];
                                        [self presentViewController:dashboard animated:YES completion:NULL];
                                        
                                        
                                    });
                                    
                                    
                                    
                                    //end of switch to dashboard after succesfull login
                                    
                                    
                                }
                                else {
                                    
                                    //When json is loaded stop the indicator
                                    
                                    
                                    [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        // UI code here
                                        [self.view setUserInteractionEnabled:YES];
                                        
                                        [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwUsername"];
                                        [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwPassword"];
                                        [[NSUserDefaults standardUserDefaults] synchronize];
                                        
                                        
                                        NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                                        [self alertStatus:error_msg :@"request Failed!"];
                                    });
                                    
                                    
                                }
                                
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
                            
                            
                            
                            [self alertStatus:@"The request could not be processed on time." :@"Request Failed!"];
                            
                            
                            
                        });
                    }
                    
                    
                });
                
                
                
                //end of process login above
                
                //end of success async task
            });
            
            //end of validate user input fields
            
        }
   
    
}


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
