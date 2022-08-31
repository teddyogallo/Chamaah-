//
//  chamaahdata.h
//  chamah
//
//  Created by Teddy Ogallo on 27/01/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface chamaahdata : NSObject{
    
    NSString *facebookimageurlGlob;
    
    NSString *facebookprofileidGlob;
    
    NSString *facebookprofilenameGlob;
    
    NSString* facebookprofileemailGlob;
    
    NSString* useridGlob;
    
    NSString* logintype;
    
    NSString *tokenString;
    
   
    
}

@property(nonatomic,retain)NSString *facebookimageurlGlob;

@property(nonatomic,retain)NSMutableArray *group_notifications;
@property(nonatomic,retain)NSString *useridGlob;
@property(nonatomic,retain)NSString *logintype;
@property(nonatomic,retain)NSString *tokenString;

@property(nonatomic,retain)NSString *facebookprofileidGlob;

@property(nonatomic,retain)NSString *facebookprofilenameGlob;

@property(nonatomic,retain)NSString *facebookprofileemailGlob;

+(chamaahdata*)getInstance;



@property (strong, nonatomic) NSString *cardtypeA1;
@property (strong, nonatomic) NSString *cardidA1;
@property (strong, nonatomic) NSString *cardnumberA1;

@property (strong, nonatomic) NSString *cardtypeA2;
@property (strong, nonatomic) NSString *cardidA2;
@property (strong, nonatomic) NSString *cardnumberA2;

@property (strong, nonatomic) NSString *cardtypeA3;
@property (strong, nonatomic) NSString *cardidA3;
@property (strong, nonatomic) NSString *cardnumberA3;

@property (strong, nonatomic) NSString *cardtypeA4;
@property (strong, nonatomic) NSString *cardidA4;
@property (strong, nonatomic) NSString *cardnumberA4;

@property (strong, nonatomic) NSString *cardtypeA5;
@property (strong, nonatomic) NSString *cardidA5;
@property (strong, nonatomic) NSString *cardnumberA5;

@property (strong, nonatomic) NSString *cardtypeA6;
@property (strong, nonatomic) NSString *cardidA6;
@property (strong, nonatomic) NSString *cardnumberA6;

@property (strong, nonatomic) NSString *cardtypeA7;
@property (strong, nonatomic) NSString *cardidA7;
@property (strong, nonatomic) NSString *cardnumberA7;

@property (strong, nonatomic) NSString *cardtypeA8;
@property (strong, nonatomic) NSString *cardidA8;
@property (strong, nonatomic) NSString *cardnumberA8;

@property (strong, nonatomic) NSString *cardtypeA9;
@property (strong, nonatomic) NSString *cardidA9;
@property (strong, nonatomic) NSString *cardnumberA9;

@property (strong, nonatomic) NSString *cardtypeA10;
@property (strong, nonatomic) NSString *cardidA10;
@property (strong, nonatomic) NSString *cardnumberA10;

@property (strong, nonatomic) NSString *cardtypeA11;
@property (strong, nonatomic) NSString *cardidA11;
@property (strong, nonatomic) NSString *cardnumberA11;

@property (strong, nonatomic) NSString *cardtypeA12;
@property (strong, nonatomic) NSString *cardidA12;
@property (strong, nonatomic) NSString *cardnumberA12;

@property (strong, nonatomic) NSString *cardtypeA13;
@property (strong, nonatomic) NSString *cardidA13;
@property (strong, nonatomic) NSString *cardnumberA13;

@property (strong, nonatomic) NSString *cardtypeA14;
@property (strong, nonatomic) NSString *cardidA14;
@property (strong, nonatomic) NSString *cardnumberA14;

@property (strong, nonatomic) NSString *cardtypeA15;
@property (strong, nonatomic) NSString *cardidA15;
@property (strong, nonatomic) NSString *cardnumberA15;

@property (strong, nonatomic) NSString *cardtypeA16;
@property (strong, nonatomic) NSString *cardidA16;
@property (strong, nonatomic) NSString *cardnumberA16;

@property (strong, nonatomic) NSString *cardtypeA17;
@property (strong, nonatomic) NSString *cardidA17;
@property (strong, nonatomic) NSString *cardnumberA17;

@property (strong, nonatomic) NSString *cardtypeA18;
@property (strong, nonatomic) NSString *cardidA18;
@property (strong, nonatomic) NSString *cardnumberA18;

@property (strong, nonatomic) NSString *cardtypeA19;
@property (strong, nonatomic) NSString *cardidA19;
@property (strong, nonatomic) NSString *cardnumberA19;

@property (strong, nonatomic) NSString *cardtypeA20;
@property (strong, nonatomic) NSString *cardidA20;
@property (strong, nonatomic) NSString *cardnumberA20;

//declare for card numbering

@property (strong, nonatomic) NSString *cardidmain;

@property (strong, nonatomic) NSString *cardwithdrawmain;

@property (strong, nonatomic) NSString *cardstatusmain;

@property (strong, nonatomic) NSString *cardtypemain;

@property (strong, nonatomic) NSString *loan_limit;
@property (strong, nonatomic) NSString *loan_balance;
@property (strong, nonatomic) NSString *group_number;
@property (strong, nonatomic) NSString *contacts_number;
@property (strong, nonatomic) NSString *user_balance;
@property (strong, nonatomic) NSString *user_name;
@property (strong, nonatomic) NSString *user_currency;

@property (strong, nonatomic) NSString *username_id;


@property (strong, nonatomic) NSString *active_group;

@property (strong, nonatomic) NSString *groupbalance_main;


@property (strong, nonatomic) NSString *groupid_main;


@property (strong, nonatomic) NSString *groupname_main;



@end
