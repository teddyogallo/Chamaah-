//
//  menuViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 29/11/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import "menuViewController.h"

#import "chamaahdata.h"
#import "signupinitialViewCellViewController.h"
#import "mainmenuViewController.h"
#import "SBJson.h"
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



@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end


@interface menuViewController ()

@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AppRun"];
    
 
    
    
    
    
    
    
  
    


    
    

        
        //check if password is more than 6 characters long
        
    
            
            
    
                
                
                LAContext *myContext = [[LAContext alloc] init];
                NSError *authError = nil;
                NSString *myLocalizedReasonString = @"Login to Chamaah with Touch ID";
                
                if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
                    [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                              localizedReason:myLocalizedReasonString
                                        reply:^(BOOL success, NSError *error) {
                                            if (success) {
                                                
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
                                                                NSString *combinedStr =[_password_this text];
                                                                combinedStr=[combinedStr stringByAppendingString:deviceid];
                                                                
                                                                //createtoken value
                                                                NSString *shaadstring =[menuViewController createSHA512:combinedStr];
                                                                
                                                                
                                                                //end of createloginstring
                                                                
                                                                
                                                                NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@&loginstring=%@&deviceid=%@&ipaddress=%@&platform=%@&version=%@",[_userid_this text],[_password_this text],shaadstring,deviceid,allIPS,platform,version];
                                                                NSLog(@"PostData: %@",post);
                                                                
                                                                NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/loginrequestjson.php"];
                                                                
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
                                                                            
                                                                            
                                                                            chamaahdata *obj=[chamaahdata getInstance];
                                                                            obj.useridGlob= _userid_this.text;
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            chamaahdata *obj2=[chamaahdata getInstance];
                                                                            obj2.tokenString= shaadstring;
                                                                            
                                                                            
                                                                            
                                                                            [self.view setUserInteractionEnabled:YES];
                                                                            
                                                                            mainmenuViewController * dashboard =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
                                                                            [self presentViewController:dashboard animated:YES completion:NULL];
                                                                            
                                                                            
                                                                        });
                                                                        
                                                                        
                                                                        
                                                                        //end of switch to dashboard after succesfull login
                                                                        
                                                                        
                                                                    }else if(success == 2){
                                                                        //verify account
                                                                        
                                                                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                                                        
                                                                      
                                                                        
                                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                                            // UI code here
                                                                            [self.view setUserInteractionEnabled:YES];
                                                                            
                                                                            [self alertStatus:@"Please Verify account" :@"Account not Verified!"];
                                                                            
                                                                            [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwUsername"];
                                                                            [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwPassword"];
                                                                            [[NSUserDefaults standardUserDefaults] synchronize];
                                                                            
                                                                            mainmenuViewController * verify =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
                                                                            [self presentViewController:verify animated:YES completion:NULL];
                                                                            
                                                                            
                                                                        });
                                                                        
                                                                        
                                                                        
                                                                    }
                                                                    else if(success==3){
                                                                        //activate locked account
                                                                        
                                                                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                                                        
                                                                      
                                                                        
                                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                                            // UI code here
                                                                            [self.view setUserInteractionEnabled:YES];
                                                                            
                                                                            [self alertStatus:@"Please Unlock account to login" :@"Account Locked!"];
                                                                            
                                                                            [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwUsername"];
                                                                            [[NSUserDefaults standardUserDefaults] setValue:NULL forKey:@"wwPassword"];
                                                                            [[NSUserDefaults standardUserDefaults] synchronize];
                                                                            
                                                                            
                                                                            
                                                                            mainmenuViewController * unlock =[[mainmenuViewController  alloc]initWithNibName:nil bundle:nil];
                                                                            [self presentViewController:unlock animated:YES completion:NULL];
                                                                            
                                                                            
                                                                            
                                                                        });
                                                                        
                                                                        
                                                                        
                                                                    }
                                                                    else if(success==4){
                                                                        //activate locked account
                                                                        
                                                                        
                                                                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                                                        
                                                                        
                                                                        //asign user id from usernametextfield
                                                                        
                                                                        
                                                                        [[NSUserDefaults standardUserDefaults] setValue:_userid_this.text forKey:@"wwUsername"];
                                                                        [[NSUserDefaults standardUserDefaults] setValue:_password_this.text forKey:@"wwPassword"];
                                                                        [[NSUserDefaults standardUserDefaults] synchronize];
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                                            // UI code here
                                                                            [self.view setUserInteractionEnabled:YES];
                                                                            
                                                                            mainmenuViewController * merchantdashboard =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
                                                                            [self presentViewController:merchantdashboard animated:YES completion:NULL];
                                                                            
                                                                            
                                                                        });
                                                                        
                                                                        
                                                                        
                                                                        //end of switch to dashboard after succesfull login
                                                                        
                                                                    }else if(success==5){
                                                                        //activate locked account
                                                                        
                                                                        
                                                                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                                                        
                                                                        
                                                                        //asign user id from usernametextfield
                                                                        
                                                                        
                                                                        [[NSUserDefaults standardUserDefaults] setValue:_userid_this.text forKey:@"wwUsername"];
                                                                        [[NSUserDefaults standardUserDefaults] setValue:_password_this.text forKey:@"wwPassword"];
                                                                        [[NSUserDefaults standardUserDefaults] synchronize];
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        NSString *currency = (NSString *) [jsonData objectForKey:@"currency"];
                                                                        
                                                                        
                                                                        
                                                                        NSString *dollarrate = (NSString *) [jsonData objectForKey:@"dollarrate"];
                                                                        
                                                                        
                                                                        NSString *firstnameglob = (NSString *) [jsonData objectForKey:@"firstname"];
                                                                        
                                                                        NSString *lastnameglob = (NSString *) [jsonData objectForKey:@"lastname"];
                                                                        
                                                                        NSString *countryglob = (NSString *) [jsonData objectForKey:@"country"];
                                                                        
                                                                        NSString *emailglob = (NSString *) [jsonData objectForKey:@"email"];
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        //end for partial signup
                                                                        
                                                                        
                                                                        
                                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                                            // UI code here
                                                                            [self.view setUserInteractionEnabled:YES];
                                                                            
                                                                            mainmenuViewController * merchantdashboard =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
                                                                            [self presentViewController:merchantdashboard animated:YES completion:NULL];
                                                                            
                                                                            
                                                                        });
                                                                        
                                                                        
                                                                        
                                                                        //end of switch to dashboard after succesfull login
                                                                        
                                                                    }else if(success==6){
                                                                        //activate locked account
                                                                        
                                                                        
                                                                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                                                        
                                                                        
                                                                        //asign user id from usernametextfield
                                                                        
                                                                        
                                                                        [[NSUserDefaults standardUserDefaults] setValue:_userid_this.text forKey:@"wwUsername"];
                                                                        [[NSUserDefaults standardUserDefaults] setValue:_password_this.text forKey:@"wwPassword"];
                                                                        [[NSUserDefaults standardUserDefaults] synchronize];
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        NSString *currency = (NSString *) [jsonData objectForKey:@"currency"];
                                                                        
                                                                        
                                                                        
                                                                        NSString *dollarrate = (NSString *) [jsonData objectForKey:@"dollarrate"];
                                                                        
                                                                        
                                                                        NSString *firstnameglob = (NSString *) [jsonData objectForKey:@"firstname"];
                                                                        
                                                                        NSString *lastnameglob = (NSString *) [jsonData objectForKey:@"lastname"];
                                                                        
                                                                        NSString *countryglob = (NSString *) [jsonData objectForKey:@"country"];
                                                                        
                                                                        NSString *emailglob = (NSString *) [jsonData objectForKey:@"email"];
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        //end for partial signup
                                                                        
                                                                        
                                                                        
                                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                                            // UI code here
                                                                            [self.view setUserInteractionEnabled:YES];
                                                                            
                                                                            mainmenuViewController * merchantdashboard =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
                                                                            [self presentViewController:merchantdashboard animated:YES completion:NULL];
                                                                            
                                                                            
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
                                                                            [self alertStatus:error_msg :@"Login Failed!"];
                                                                        });
                                                                        
                                                                        
                                                                    }
                                                                    
                                                                } else {
                                                                    
                                                                    [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                                                    
                                                                    
                                                                    if (error) NSLog(@"Error: %@", error);
                                                                    
                                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                                        // UI code here
                                                                        
                                                                        [self.view setUserInteractionEnabled:YES];
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        [self alertStatus:@"Connection Failed" :@"Login Failed!"];
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
                                                                
                                                                
                                                                
                                                                [self alertStatus:@"Login Failed." :@"Login Failed!"];
                                                                
                                                                
                                                                
                                                            });
                                                        }
                                                        
                                                        
                                                    });
                                                    
                                                    
                                                    
                                                    //end of process login above
                                                    
                                                    
                                                    
                                                    //end of touch ID Authentification success
                                                    
                                                    
                                                    //end of success async task
                                                });
                                                
                                            } else {
                                                
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    
                                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                                        message:error.description
                                                                                                       delegate:self
                                                                                              cancelButtonTitle:@"OK"
                                                                                              otherButtonTitles:nil, nil];
                                                    [alertView show];
                                                    // Rather than show a UIAlert here, use the error to determine if you should push to a keypad for PIN entry.
                                                    
                                                    //end of async task
                                                });
                                                
                                            }
                                        }];
                } else {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                            message:authError.description
                                                                           delegate:self
                                                                  cancelButtonTitle:@"OK"
                                                                  otherButtonTitles:nil, nil];
                        [alertView show];
                        // Rather than show a UIAlert here, use the error to determine if you should push to a keypad for PIN entry.
                        
                        //end of async task
                    });
                    
                    
                }
                
         

    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)continue_button:(id)sender {
    

    
    if([ [_password_this text] length] <10 || [ [_password_this text] length] >13){
        // PHONENUMBER FIELD IS EMPTY
        
        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        
        
        [self alertStatus:@"Please enter corrent value in the password field " :@"Request not processed!"];
        
        
        
    }
    else if([[_userid_this text] isEqualToString:@""] ) {
        
        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        
        
        
        [self alertStatus:@"Userid field cannot be empty please re-enter" :@"Request not processed!"];
        
        
    }else {
        
     //execute tasks
        
        chamaahdata *obj6=[chamaahdata getInstance];
        obj6.useridGlob= [_userid_this text];
        
        chamaahdata *obj8=[chamaahdata getInstance];
        obj8.username_id= [_userid_this text];
        
        chamaahdata *obj10=[chamaahdata getInstance];
        obj10.user_name= [_userid_this text];
        
        chamaahdata *obj7=[chamaahdata getInstance];
        obj7.tokenString= @"iayuiyr892y8uewriurewywer8ywe7ewrty7we8yrywe6twe78ew67235435489329832672354326735267238t67we6qwt673647829786re5653r462877h7ugy6gdabweg7rgwjknasdlcnhgvet4";
        
        
        
        mainmenuViewController * mimifirsterror =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
        
        [self presentViewController:mimifirsterror animated:YES completion:NULL];
        
        
        
        
        
    //end of execute tasks
    }
    
}

- (IBAction)login_background:(id)sender {
    
    
    [_userid_this resignFirstResponder];
    [_password_this resignFirstResponder];
    
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
- (IBAction)facebook_login:(id)sender {
    
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
     
     //add the following permissions : ,@"user_birthday",@"user_location"
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
             
             [self alertStatus:@"There was an error completing Login with Facebook " :@"Facebook Login Failed!"];
             
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
             
             [self alertStatus:@"Facebook login was cancelled " :@"Facebook Login Failed!"];
             
             
             
         } else {
             NSLog(@"Logged in");
             
             NSLog(@"Result %@",result);
             
             
             //GET FACEBOOK ACCESS TOKEN
             
             if ([FBSDKAccessToken currentAccessToken])
             {
                 NSLog(@"Token is available : %@",[[FBSDKAccessToken currentAccessToken]tokenString]);
                 
                 
                 NSString *accesstoken=[[FBSDKAccessToken currentAccessToken]tokenString];
                 
                 
                 [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
                  
                  /*  [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, link, first_name, last_name, picture.type(large), email, birthday, bio ,location ,friends ,hometown , friendlists"}]     */
                  startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                      
                      if (!error) {
                          NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
                          NSLog(@"user id %@",result[@"id"]);
                          NSLog(@"User Name %@",result[@"name"]);
                          
                          NSLog(@"User Email %@",result[@"email"]);
                          
                          
                          //create a sync task
                          //start async task login here
                          ///
                          ///
                          ////
                          
                          NSString *social_id=result[@"id"];
                          
                          NSString *social_username=result[@"name"];
                          
                          
                          NSString *social_email=result[@"email"];
                          
                          NSString *logintype=@"facebook_social";
                          
                          
                          //save username,profileid
                          NSString *facebookimageUrl=[[NSString alloc] initWithFormat:@"%@%@%@",@"https://graph.facebook.com/",social_id,@"/picture?type=large"];
                          
                          NSLog(@"FB,IMAGE URL %@",facebookimageUrl);
                          
                          chamaahdata *obj2=[chamaahdata getInstance];
                          obj2.facebookimageurlGlob= facebookimageUrl;
                          
                          NSString *imageurl=obj2.facebookimageurlGlob;
                          
                          chamaahdata *obj3=[chamaahdata getInstance];
                          obj3.facebookprofileidGlob= social_id;
                          
                          NSString *socialidurl=obj3.facebookprofileidGlob;
                          
                          chamaahdata *obj4=[chamaahdata getInstance];
                          obj4.facebookprofilenameGlob= social_username;
                          
                          chamaahdata *obj5=[chamaahdata getInstance];
                          obj5.facebookprofileemailGlob= social_email;
                          
                          
                          
                          [self.view setUserInteractionEnabled:NO];
                          
                          [self.activityIndicatorView startAnimating];
                          
                          
                          dispatch_queue_t queue = dispatch_get_global_queue(
                                                                             DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                          dispatch_async(queue, ^{
                              //Load the json on another thread
                              @try {
                                  
                                  
                                  if([social_id isEqualToString:@""] ) {
                                      
                                      [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                      
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          // UI code here
                                          
                                          [self.view setUserInteractionEnabled:YES];
                                          
                                          [self alertStatus:@"problem with login with facebook " :@"Login not succesfull!"];
                                          
                                      });
                                      
                                      
                                      
                                  } else {
                                      
                                      
                                      //show request sending
                                      
                                      //end of show request sending
                                      
                                      //detect user country
                                      
                                      //end of user country detect
                                      NSLocale *locale = [NSLocale currentLocale];
                                      NSString *countrycode = [locale objectForKey: NSLocaleCountryCode];
                                      
                                      NSString *countryname = [locale displayNameForKey: NSLocaleCountryCode
                                                                                  value: countrycode];
                                      
                                      
                                      NSLog(@"User Country Code : %@",countrycode);
                                      
                                      NSLog(@"User Country Name : %@",countryname);
                                      
                                      //get unique device identifier
                                      
                                      NSArray *allIParray=self.localIPAddresses;
                                      
                                      
                                      NSString * overall_allIPS = [[allIParray valueForKey:@"description"] componentsJoinedByString:@","];
                                      
                                      
                                      NSArray *subStrings = [overall_allIPS componentsSeparatedByString:@","];                                   NSString *allIPS = [subStrings objectAtIndex:0];
                                      
                                      
                                      
                                      
                                      NSString *platform=@"ios";
                                      
                                      NSString *version=@"1.0.8";
                                      
                                      
                                      NSString *deviceid= [[[UIDevice currentDevice] identifierForVendor] UUIDString];
                                      NSString *combinedStr =[[NSString alloc] initWithFormat:@"%@%@",accesstoken,social_id];
                                      combinedStr=[combinedStr stringByAppendingString:deviceid];
                                      
                                      //createtoken value
                                      NSString *shaadstring =[menuViewController createSHA512:combinedStr];
                                      
                                      
                                      //end of createloginstring
                                      
                                      //&ipaddress=%@&platform=%@&version=%@",[_txtUsername text],[_txtPassword text],shaadstring,deviceid,allIPS,platform,version];
                                      
                                      chamaahdata *obj=[chamaahdata getInstance];
                                      obj.useridGlob= social_id;
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      chamaahdata *obj2=[chamaahdata getInstance];
                                      obj2.tokenString= shaadstring;
                                      

                                      
                                      
                                      NSString *post =[[NSString alloc] initWithFormat:@"username=%@&userid=%@&loginstring=%@&deviceid=%@&logintype=%@&appcountry=%@&ipaddress=%@&platform=%@&version=%@&social_email=%@",social_username,social_id,shaadstring,deviceid,logintype,countrycode,allIPS,platform,version,social_email];
                                      NSLog(@"PostData: %@",post);
                                      
                                      NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/chamah_front/chama_socialloginrequestjson.php"];
                                      
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
                                          NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                                          NSLog(@"%d",success);
                                          if(success == 1)
                                          {
                                              //When json is loaded stop the indicator
                                              
                                              [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                              
                                              //dismiss alert loading
                                              
                                              //end of dismiss alert view status
                                              
                                              //switch view here
                                              //switch to dashboard after succesfull login
                                              
                                              //asign user id from usernametextfield
                                              NSString *currency = (NSString *) [jsonData objectForKey:@"currency"];
                                              
                                              
                                              
                                              NSString *dollarrate = (NSString *) [jsonData objectForKey:@"dollarrate"];
                                              
                                              
                                              
                                              
                                              NSString *realuserid = (NSString *) [jsonData objectForKey:@"userid"];
                                              
                                              
                                                NSString *wayawayauserid = (NSString *) [jsonData objectForKey:@"userid"];
                                              
                                              
                                              
                                                NSString *message1 = (NSString *) [jsonData objectForKey:@"message1"];
                                              
                                              
                                              
                                                NSString *message2 = (NSString *) [jsonData objectForKey:@"message2"];
                                              
                                              
                                                NSString *message3 = (NSString *) [jsonData objectForKey:@"message3"];
                                              
                                                NSString *message4 = (NSString *) [jsonData objectForKey:@"message4"];
                                              
                                                NSString *message5 = (NSString *) [jsonData objectForKey:@"message5"];
                                              
                                              
                                              chamaahdata *obj6=[chamaahdata getInstance];
                                              obj6.useridGlob= social_id;
                                              
                                              chamaahdata *obj7=[chamaahdata getInstance];
                                              obj7.tokenString= shaadstring;

                                             // chamaahdata *obj=[chamaahdata getInstance];
                                             // obj.user_name= user_name;
                                              
                                            
                                              
                                              chamaahdata *obj8=[chamaahdata getInstance];
                                              obj8.username_id= realuserid;
                                              
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  // UI code here
                                                  
                                                  [self.view setUserInteractionEnabled:YES];
                                                  
                                                  
                                                  mainmenuViewController * dashboard =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
                                                  [self presentViewController:dashboard animated:YES completion:NULL];
                                                  
                                                  
                                              });
                                              
                                              
                                              
                                              //end of switch to dashboard after succesfull login
                                              
                                              
                                          }else if(success == 2){
                                              //verify account
                                              
                                              [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                              
                                              //dismiss alert loading
                                              
                                              //end of dismiss alert view status
                                              
                                              //switch view here
                                              //switch to dashboard after succesfull login
                                              
                                              //asign user id from usernametextfield
                                              NSString *currency = (NSString *) [jsonData objectForKey:@"currency"];
                                              
                                              
                                              
                                              NSString *dollarrate = (NSString *) [jsonData objectForKey:@"dollarrate"];
                                              
                                              
                                              NSString *message1 = (NSString *) [jsonData objectForKey:@"message1"];
                                              
                                              
                                              
                                              NSString *message2 = (NSString *) [jsonData objectForKey:@"message2"];
                                              
                                              
                                              NSString *message3 = (NSString *) [jsonData objectForKey:@"message3"];
                                              
                                              NSString *message4 = (NSString *) [jsonData objectForKey:@"message4"];
                                              
                                              NSString *message5 = (NSString *) [jsonData objectForKey:@"message5"];
                                              
                                              
                                            
                                              
                                              
                                              
                                              
                                              
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  // UI code here
                                                  
                                                  [self.view setUserInteractionEnabled:YES];
                                                  
                                       //switch to login page
                                                  
                                                  
                                                  mainmenuViewController * dashboard =[[mainmenuViewController alloc]initWithNibName:nil bundle:nil];
                                                  [self presentViewController:dashboard animated:YES completion:NULL];
                                                  
                                                  
                                              });
                                              
                                              
                                              
                                              
                                          }
                                          
                                          
                                          
                                          else {
                                              
                                              //When json is loaded stop the indicator
                                              
                                              
                                              [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  // UI code here
                                                  
                                                  [self.view setUserInteractionEnabled:YES];
                                                  
                                                  
                                                  NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                                                  [self alertStatus:error_msg :@"Login Failed!"];
                                              });
                                              
                                              
                                          }
                                          
                                      } else {
                                          
                                          
                                          
                                          [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                                          
                                          
                                          if (error) NSLog(@"Error: %@", error);
                                          
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              // UI code here
                                              
                                              [self.view setUserInteractionEnabled:YES];
                                              
                                              [self alertStatus:@"Connection Failed" :@"Login Failed!"];
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
                                      
                                      
                                      [self alertStatus:@"Login Failed." :@"Login Failed!"];
                                      
                                      
                                      
                                  });
                              }
                              
                              
                          });
                          
                          
                          
                          
                          
                          
                          //end asynctask login here
                          ///
                          ///
                          ///
                          ///
                          
                          
                          
                          
                          
                          
                          
                          
                      }
                  }];
                 
                 
                 //end of if access token is set
                 
             }
             
             
             
             
             //action when logged in
             
             
             
         }
     }];
    
  
    
}

- (IBAction)signup_normal:(id)sender {
    
    
    signupinitialViewCellViewController * dashboard =[[signupinitialViewCellViewController alloc]initWithNibName:nil bundle:nil];
    [self presentViewController:dashboard animated:YES completion:NULL];
}
@end
