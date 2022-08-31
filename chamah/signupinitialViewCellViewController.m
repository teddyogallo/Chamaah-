//
//  signupinitialViewCellViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 09/05/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "signupinitialViewCellViewController.h"
#import "signupfullViewController.h"
#import "menuViewController.h"
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



@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end

@interface signupinitialViewCellViewController ()

@end

@implementation signupinitialViewCellViewController


@synthesize countryViewArray;
@synthesize countrycodeM;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *countrycode=@"+254";
    
    _phone_country_code.text=[NSString stringWithFormat:@"%@", countrycode];
    
    countrycodeM =[[NSString alloc] initWithFormat:@"254"];
    
    self.countryViewArray =[[NSArray alloc] initWithObjects:@"United States",@"U.K",@"Kenya",@"South Africa",@"Uganda", nil];
    
    // self.country.delegate=self;
    
    
    countryView  = [[UIPickerView alloc] initWithFrame:CGRectZero];
    countryView   .delegate = self;
    countryView   .dataSource = self;
    [countryView     setShowsSelectionIndicator:YES];
    _country.inputView = countryView  ;
    // Create done button in UIPickerView
    UIToolbar*  mypickerToolbar2 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    mypickerToolbar2.barStyle = UIBarStyleBlackOpaque;
    [mypickerToolbar2 sizeToFit];
    NSMutableArray *barItems2 = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems2 addObject:flexSpace2];
    UIBarButtonItem *doneBtn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked2)];
    [barItems2 addObject:doneBtn2];
    [mypickerToolbar2 setItems:barItems2 animated:YES];
    _country.inputAccessoryView = mypickerToolbar2;
    
    
  /*
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];

    
  */
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pickerDoneClicked2
{
    NSLog(@"Done Clicked");
    [_country resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

{
    if([pickerView isEqual: countryView]){
        // return the appropriate number of components, for instance
        return 1;
    }
    
    
    else {
        
        return 0;
        
    }
    //return 1;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    
    
    if([countryView isEqual: countryView]){
        // return the appropriate number of components, for instance
        
         self.country.text = [countryViewArray objectAtIndex:row];
        
     
        
        
        NSString *rowString = [countryViewArray objectAtIndex:row];
        
        if ([rowString compare:@"Kenya"] == NSOrderedSame)
        {
            
            //populate phone number field with details
            NSString *countrycode=@"+254";
            
            _phone_country_code.text=[NSString stringWithFormat:@"%@", countrycode];

            
            countrycodeM =[[NSString alloc] initWithFormat:@"254"];
            
        }
        
        
      
        
        if ([rowString compare:@"United States"] == NSOrderedSame)
        {
            
            //populate phone number field with details
            NSString *countrycode=@"+1";
            
            _phone_country_code.text=[NSString stringWithFormat:@"%@", countrycode];
            
            countrycodeM =[[NSString alloc] initWithFormat:@"1"];
            
        }
        
        
        if ([rowString compare:@"U.K"] == NSOrderedSame)
        {
            
            //populate phone number field with details
            NSString *countrycode=@"+44";
            
            _phone_country_code.text=[NSString stringWithFormat:@"%@", countrycode];
            
            countrycodeM =[[NSString alloc] initWithFormat:@"44"];
            
        }
        

        
        if ([rowString compare:@"South Africa"] == NSOrderedSame)
        {
            
            //populate phone number field with details
            NSString *countrycode=@"+27";
            
            _phone_country_code.text=[NSString stringWithFormat:@"%@", countrycode];
            
            countrycodeM =[[NSString alloc] initWithFormat:@"27"];
            
        }
        

      
        
        if ([rowString compare:@"Uganda"] == NSOrderedSame)
        {
            
            //populate phone number field with details
            NSString *countrycode=@"+256";
            
            _phone_country_code.text=[NSString stringWithFormat:@"%@", countrycode];
            
            countrycodeM =[[NSString alloc] initWithFormat:@"256"];
            
        }
        

        

        
        
       
    }
    
    //self.currencyTextField.text = [_currencyArray objectAtIndex:row];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

{
    
    if([countryView isEqual: countryView]){
        // return the appropriate number of components, for instance
        return [countryViewArray count];
    }
    
    else{
        return 0;
    }
    
    
    //return [_currencyArray count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

{
    
    if([countryView isEqual: countryView]){
        // return the appropriate number of components, for instance
        return [countryViewArray objectAtIndex:row];
    }
    
    else{
        return 0;
    }
    
    
    
    //return [_currencyArray objectAtIndex:row];
    
}

/*
- (void)keyboardWillShow:(NSNotification*)aNotification {
    [UIView animateWithDuration:0.25 animations:^
     {
         
         [self.view setFrame:CGRectMake(0,-180,320,570)];
         
         
         
     }completion:^(BOOL finished)
     {
         
     }];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    [UIView animateWithDuration:0.25 animations:^
     {
         
         [self.view setFrame:CGRectMake(0,0,320,570)];
         
         
     }completion:^(BOOL finished)
     {
         
     }];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)continue_button:(id)sender {
    
    if(![ [_repeatpassword text] isEqualToString:[_password text] ]){
        // PHONENUMBER FIELD IS EMPTY
        
        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        
        
        [self alertStatus:@"The password entered must match with the Password entered in the repeat password field!":@"Request not processed!"];

        
        
        
    }else
    if([ [_password text] length] <6 || [ [_password text] length] >16){
        // PHONENUMBER FIELD IS EMPTY
        
        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        
        
        [self alertStatus:@"Please enter a password that is between 6 and 16 Digits in value " :@"Request not processed!"];
        
        
        
    }else   if([ [_country text]  isEqualToString:@""] ){
        // PHONENUMBER FIELD IS EMPTY
        
        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        
        
        [self alertStatus:@"Please request country" :@"Request not processed!"];
        
        
        
    }

    else if([[_email text] isEqualToString:@""] ) {
        
        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
        
        
        
        [self alertStatus:@"E-Mail field cannot be empty please re-enter" :@"Request not processed!"];
        
        
    }else {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //start of success async task
        
        [self.view setUserInteractionEnabled:NO];
        [self.activityIndicatorView startAnimating];
        
        //setup country prefix
        
   
        
        
            NSString *phonefull =[[NSString alloc] initWithFormat:@"%@%@",countrycodeM,[_phone_number text]];
        
        //end of setup Country Prefix
        
        
        
        
        dispatch_queue_t queue = dispatch_get_global_queue(
                                                           DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^{
            //Load the json on another thread
            @try {
                
                {
                    
                    //detect user country
                    
                                        NSLocale *locale = [NSLocale currentLocale];
                    NSString *countrycode = [locale objectForKey: NSLocaleCountryCode];
                    
                    NSString *countryname = [locale displayNameForKey: NSLocaleCountryCode
                                                                value: countrycode];
                    
                    
                    NSLog(@"User Country Code : %@",countrycode);
                    
                    NSLog(@"User Country Name : %@",countryname);
 
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
                    NSString *combinedStr =[_password text];
                    combinedStr=[combinedStr stringByAppendingString:deviceid];
                    
                    //createtoken value
                    NSString *shaadstring =[signupinitialViewCellViewController createSHA512:combinedStr];
                    
                    
                    //end of createloginstring
                    
                    NSString *telco_details=@"Apple";
                    
                     NSString *phone_details=@"Apple";
                    
                    
                    NSString *post =[[NSString alloc] initWithFormat:@"username=%@&email=%@&password=%@&country=%@&deviceid=%@&ipaddress=%@&devicecountry=%@&platform=%@&app_version=%@&telco=%@&devicemanufacturer=%@&devicemodel=%@&simserial=%@&simnumber=%@&token=%@",phonefull,[_email text],[_password text],[_country text],deviceid,allIPS,countrycode,platform,version,telco_details,telco_details,phone_details,deviceid,deviceid,shaadstring];
                    NSLog(@"PostData: %@",post);
                    
                    NSURL *url=[NSURL URLWithString:@"https://www.wayawaya.com/chamah_front/chamahsignupinitialjson.php"];
                    
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
                                obj.useridGlob= phonefull;
                                
                                
                                
                                
                                
                                
                                
                                chamaahdata *obj2=[chamaahdata getInstance];
                                obj2.tokenString= shaadstring;
                                
                                
                                
                                [self.view setUserInteractionEnabled:YES];
                                
                               confirmViewController * dashboard =[[confirmViewController alloc]initWithNibName:nil bundle:nil];
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
                                
                                signupfullViewController * verify =[[signupfullViewController alloc]initWithNibName:nil bundle:nil];
                                [self presentViewController:verify animated:YES completion:NULL];
                                
                                
                            });
                            
                            
                            
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
        
        //end of success async task
    });
        
        //end of validate user input fields
        
    }
    
    
}

- (IBAction)signup_background:(id)sender {
    
    
    [_email resignFirstResponder];
    [_country resignFirstResponder];
    [_phone_number resignFirstResponder];
    [_password resignFirstResponder];
    [_repeatpassword resignFirstResponder];
    
    [_promo_code resignFirstResponder];
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

- (IBAction)signup_initial:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
