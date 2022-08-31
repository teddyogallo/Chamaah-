//
//  signupfullViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 09/03/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "signupfullViewController.h"
#import "mainmenuViewController.h"
#import "confirmViewController.h"
#import "SBJson.h"
#import "chamaahdata.h"
#include <CommonCrypto/CommonDigest.h>

#import <LocalAuthentication/LocalAuthentication.h>

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>






#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <net/if.h>
#include <netdb.h>




@interface signupfullViewController ()

@end

@implementation signupfullViewController

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

- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}

- (IBAction)confirm_button:(id)sender {
    
    
    if([ [_firstname text] isEqualToString:@"" ]){
        // PHONENUMBER FIELD IS EMPTY
        
        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        
        
        [self alertStatus:@"First Name field cannot be empty":@"Request not processed!"];
        
        
        
        
    }else
        if([ [_lastname text] isEqualToString:@"" ]){
            // PHONENUMBER FIELD IS EMPTY
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            [self alertStatus:@"Last name field cannot be empty " :@"Request not processed!"];
            
            
            
        }else   if([ [_country text]  isEqualToString:@""] ){
            // PHONENUMBER FIELD IS EMPTY
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            [self alertStatus:@"Please Select nationality which must match with your Identification details " :@"Request not processed!"];
            
            
            
        }
    
        else if([[_address text] isEqualToString:@""] ) {
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            [self alertStatus:@"Please enter address" :@"Request not processed!"];
            
            
        } else if([[_city text] isEqualToString:@""] ) {
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            [self alertStatus:@"Please enter City address " :@"Request not processed!"];
            
            
        } else if([[_state text] isEqualToString:@""] ) {
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            [self alertStatus:@"Please enter State or Province" :@"Request not processed!"];
            
            
        } else if([[_zipcode text] isEqualToString:@""] ) {
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            [self alertStatus:@"Please enter a ZipCode or Postal code for your address" :@"Request not processed!"];
            
            
        } else if([[_gkid text] isEqualToString:@""] ) {
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            [self alertStatus:@"Please enter your government issued ID number" :@"Request not processed!"];
            
            
        } else if([[_taxid text] isEqualToString:@""] ) {
            
            [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
            
            
            
            [self alertStatus:@"Please enter your government issued Tax Identification Number" :@"Request not processed!"];
            
            
        }else {
            
            
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
                            
                            
                            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&country=%@&loginstring=%@&deviceid=%@&ipaddress=%@&platform=%@&version=%@&firstname=%@&lastname=%@&address=%@&city=%@&state=%@&zipcode=%@&govtid=%@&taxid=%@",useridthis,[_country text],tokenthis,deviceid,allIPS,platform,version,[_firstname text],[_lastname text],[_address text],[_city text],[_state text],[_zipcode text],[_gkid text],[_taxid text]];
                            NSLog(@"PostData: %@",post);
                            
                            NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/chamaahsignuprequestmainjson.php"];
                            
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
                                        
                                        
                                        mainmenuViewController * dashboard =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
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
                                        
                                       
                                        
                                        
                                        NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                                        [self alertStatus:error_msg :@"Request Failed!"];
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
                            
                            
                            
                            [self alertStatus:@"Login Failed." :@"Request Failed!"];
                            
                            
                            
                        });
                    }
                    
                    
                });
                
                
                
                //end of process login above
                
                //end of success async task
            });
            
            //end of validate user input fields
            
        }
    

}

- (IBAction)signupbackground:(id)sender {
    
    
    [_firstname resignFirstResponder];
    [_lastname resignFirstResponder];
 
    [_address resignFirstResponder];
    [_city resignFirstResponder];
    [_state resignFirstResponder];
    [_zipcode resignFirstResponder];
    [_country resignFirstResponder];
    [_gkid resignFirstResponder];
    [_taxid resignFirstResponder];
    
    
        
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

- (IBAction)backbutton:(id)sender {
    
    
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
