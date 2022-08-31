//
//  chamaahdata.m
//  chamah
//
//  Created by Teddy Ogallo on 27/01/2017.
//  Copyright © 2017 Teddy Ogallo. All rights reserved.
//

#import "chamaahdata.h"

@implementation chamaahdata

@synthesize facebookimageurlGlob=_facebookimageurlGlob;
@synthesize facebookprofileidGlob=_facebookprofileidGlob;
@synthesize facebookprofilenameGlob=_facebookprofilenameGlob;
@synthesize facebookprofileemailGlob=_facebookprofileemailGlob;
@synthesize useridGlob=_useridGlob;
@synthesize logintype=_logintype;
@synthesize tokenString=_tokenString;



//FOR LOADING CARDS
@synthesize cardtypeA1= _cardtypeA1;
@synthesize cardidA1= _cardidA1;
@synthesize cardnumberA1= _cardnumberA1;

@synthesize cardtypeA2= _cardtypeA2;
@synthesize cardidA2= _cardidA2;
@synthesize cardnumberA2= _cardnumberA2;

@synthesize cardtypeA3= _cardtypeA3;
@synthesize cardidA3= _cardidA3;
@synthesize cardnumberA3= _cardnumberA3;

@synthesize cardtypeA4= _cardtypeA4;
@synthesize cardidA4= _cardidA4;
@synthesize cardnumberA4= _cardnumberA4;

@synthesize cardtypeA5= _cardtypeA5;
@synthesize cardidA5= _cardidA5;
@synthesize cardnumberA5= _cardnumberA5;

@synthesize cardtypeA6= _cardtypeA6;
@synthesize cardidA6= _cardidA6;
@synthesize cardnumberA6= _cardnumberA6;

@synthesize cardtypeA7= _cardtypeA7;
@synthesize cardidA7= _cardidA7;
@synthesize cardnumberA7= _cardnumberA7;

@synthesize cardtypeA8= _cardtypeA8;
@synthesize cardidA8= _cardidA8;
@synthesize cardnumberA8= _cardnumberA8;

@synthesize cardtypeA9= _cardtypeA9;
@synthesize cardidA9= _cardidA9;
@synthesize cardnumberA9= _cardnumberA9;

@synthesize cardtypeA10= _cardtypeA10;
@synthesize cardidA10= _cardidA10;
@synthesize cardnumberA10= _cardnumberA10;

@synthesize cardtypeA11= _cardtypeA11;
@synthesize cardidA11= _cardidA11;
@synthesize cardnumberA11= _cardnumberA11;

@synthesize cardtypeA12= _cardtypeA12;
@synthesize cardidA12= _cardidA12;
@synthesize cardnumberA12= _cardnumberA12;

@synthesize cardtypeA13= _cardtypeA13;
@synthesize cardidA13= _cardidA13;
@synthesize cardnumberA13= _cardnumberA13;

@synthesize cardtypeA14= _cardtypeA14;
@synthesize cardidA14= _cardidA14;
@synthesize cardnumberA14= _cardnumberA14;

@synthesize cardtypeA15= _cardtypeA15;
@synthesize cardidA15= _cardidA15;
@synthesize cardnumberA15= _cardnumberA15;

@synthesize cardtypeA16= _cardtypeA16;
@synthesize cardidA16= _cardidA16;
@synthesize cardnumberA16= _cardnumberA16;

@synthesize cardtypeA17= _cardtypeA17;
@synthesize cardidA17= _cardidA17;
@synthesize cardnumberA17= _cardnumberA17;

@synthesize cardtypeA18= _cardtypeA18;
@synthesize cardidA18= _cardidA18;
@synthesize cardnumberA18= _cardnumberA18;

@synthesize cardtypeA19= _cardtypeA19;
@synthesize cardidA19= _cardidA19;
@synthesize cardnumberA19= _cardnumberA19;

@synthesize cardtypeA20= _cardtypeA20;
@synthesize cardidA20= _cardidA20;
@synthesize cardnumberA20= _cardnumberA20;




@synthesize cardidmain= _cardidmain;
@synthesize cardwithdrawmain= _cardwithdrawmain;

@synthesize cardstatusmain= _cardstatusmain;

@synthesize cardtypemain= _cardtypemain;




@synthesize group_notifications=_group_notifications;


@synthesize loan_limit=_loan_limit;
@synthesize loan_balance=_loan_balance;
@synthesize group_number=_group_number;
@synthesize user_name=_user_name;
@synthesize user_balance=_user_balance;
@synthesize contacts_number=_contacts_number;
@synthesize user_currency=_user_currency;

@synthesize active_group=_active_group;

//for group details

@synthesize groupbalance_main=_groupbalance_main;
@synthesize groupid_main=_groupid_main;
@synthesize groupname_main=_groupname_main;

@synthesize username_id=_username_id;





static chamaahdata *instance =nil;
+(chamaahdata *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [chamaahdata new];
        }
    }
    return instance;
}






@end
