//
//  newgroupViewController.m
//  chamah
//
//  Created by Teddy Ogallo on 09/12/2016.
//  Copyright © 2016 Teddy Ogallo. All rights reserved.
//

#import "newgroupViewController.h"
#import "chamaahdata.h"
#import "SBJson.h"
#import "mainmenuViewController.h"
#import "menuViewController.h"
#import "groupcreated2ViewController.h"

@interface newgroupViewController ()

@end

@implementation newgroupViewController

@synthesize accountnoViewArray;
@synthesize rotationViewArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


@synthesize cardtype1= _cardtype1;
@synthesize cardid1= _cardid1;
@synthesize cardnumber1= _cardnumber1;

@synthesize cardtype2= _cardtype2;
@synthesize cardid2= _cardid2;
@synthesize cardnumber2= _cardnumber2;

@synthesize cardtype3= _cardtype3;
@synthesize cardid3= _cardid3;
@synthesize cardnumber3= _cardnumber3;

@synthesize cardtype4= _cardtype4;
@synthesize cardid4= _cardid4;
@synthesize cardnumber4= _cardnumber4;

@synthesize cardtype5= _cardtype5;
@synthesize cardid5= _cardid5;
@synthesize cardnumber5= _cardnumber5;

@synthesize cardtype6= _cardtype6;
@synthesize cardid6= _cardid6;
@synthesize cardnumber6= _cardnumber6;

@synthesize cardtype7= _cardtype7;
@synthesize cardid7= _cardid7;
@synthesize cardnumber7= _cardnumber7;

@synthesize cardtype8= _cardtype8;
@synthesize cardid8= _cardid8;
@synthesize cardnumber8= _cardnumber8;

@synthesize cardtype9= _cardtype9;
@synthesize cardid9= _cardid9;
@synthesize cardnumber9= _cardnumber9;

@synthesize cardtype10= _cardtype10;
@synthesize cardid10= _cardid10;
@synthesize cardnumber10= _cardnumber10;

@synthesize cardtype11= _cardtype11;
@synthesize cardid11= _cardid11;
@synthesize cardnumber11= _cardnumber11;

@synthesize cardtype12= _cardtype12;
@synthesize cardid12= _cardid12;
@synthesize cardnumber12= _cardnumber12;

@synthesize cardtype13= _cardtype13;
@synthesize cardid13= _cardid13;
@synthesize cardnumber13= _cardnumber13;

@synthesize cardtype14= _cardtype14;
@synthesize cardid14= _cardid14;
@synthesize cardnumber14= _cardnumber14;

@synthesize cardtype15= _cardtype15;
@synthesize cardid15= _cardid15;
@synthesize cardnumber15= _cardnumber15;

@synthesize cardtype16= _cardtype16;
@synthesize cardid16= _cardid16;
@synthesize cardnumber16= _cardnumber16;

@synthesize cardtype17= _cardtype17;
@synthesize cardid17= _cardid17;
@synthesize cardnumber17= _cardnumber17;

@synthesize cardtype18= _cardtype18;
@synthesize cardid18= _cardid18;
@synthesize cardnumber18= _cardnumber18;

@synthesize cardtype19= _cardtype19;
@synthesize cardid19= _cardid19;
@synthesize cardnumber19= _cardnumber19;

@synthesize cardtype20= _cardtype20;
@synthesize cardid20= _cardid20;
@synthesize cardnumber20= _cardnumber20;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    //load Card Numbers
    
    
    chamaahdata *obj3=[chamaahdata getInstance];
    
    NSString *useridthis2=obj3.useridGlob;
    
    chamaahdata *obj4=[chamaahdata getInstance];
    
    NSString *tokenthis2=obj4.tokenString;
    
    
    
    
    
    chamaahdata *obj5=[chamaahdata getInstance];
    
    _cardtype1=obj5.cardtypeA1;
    
    chamaahdata *obj6=[chamaahdata getInstance];
    
    _cardnumber1=obj6.cardnumberA1;
    
    chamaahdata *obj7=[chamaahdata getInstance];
    
    _cardid1=obj7.cardidA1;
    
    
    chamaahdata *obj8=[chamaahdata getInstance];
    
    _cardid2=obj8.cardidA2;
    
    chamaahdata *obj9=[chamaahdata getInstance];
    
    _cardnumber2=obj9.cardnumberA2;
    
    chamaahdata *obj10=[chamaahdata getInstance];
    
    _cardtype2=obj10.cardidA10;
    
    chamaahdata *obj11=[chamaahdata getInstance];
    
    _cardid3=obj11.cardidA3;
    
    
    chamaahdata *obj12=[chamaahdata getInstance];
    
    _cardnumber3=obj12.cardnumberA3;
    
    
    chamaahdata *obj13=[chamaahdata getInstance];
    
    _cardtype3=obj13.cardtypeA3;
    
    chamaahdata *obj14=[chamaahdata getInstance];
    
    _cardid4=obj14.cardidA4;
    
    chamaahdata *obj15=[chamaahdata getInstance];
    
    _cardnumber4=obj15.cardnumberA4;
    
    chamaahdata *obj16=[chamaahdata getInstance];
    
    _cardtype4=obj16.cardtypeA4;
    
    
    chamaahdata *obj17=[chamaahdata getInstance];
    
    _cardid5=obj17.cardidA5;
    
    chamaahdata *obj18=[chamaahdata getInstance];
    
    _cardnumber5=obj18.cardnumberA5;
    
    chamaahdata *obj19=[chamaahdata getInstance];
    
    _cardtype5=obj19.cardtypeA5;
    
    
    
    
    chamaahdata *obj20=[chamaahdata getInstance];
    
    _cardid6=obj20.cardidA6;
    
    chamaahdata *obj21=[chamaahdata getInstance];
    
    _cardnumber6=obj21.cardnumberA6;
    
    chamaahdata *obj22=[chamaahdata getInstance];
    
    _cardtype6=obj22.cardtypeA6;
    
    
    
    chamaahdata *obj23=[chamaahdata getInstance];
    
    _cardid7=obj23.cardidA7;
    
    chamaahdata *obj24=[chamaahdata getInstance];
    
    _cardnumber7=obj24.cardnumberA7;
    
    chamaahdata *obj25=[chamaahdata getInstance];
    
    _cardtype7=obj25.cardtypeA7;
    
    
    chamaahdata *obj26=[chamaahdata getInstance];
    
    _cardid8=obj26.cardidA8;
    
    chamaahdata *obj27=[chamaahdata getInstance];
    
    _cardnumber8=obj27.cardnumberA8;
    
    chamaahdata *obj28=[chamaahdata getInstance];
    
    _cardtype8=obj28.cardtypeA8;
    
    
    chamaahdata *obj29=[chamaahdata getInstance];
    
    _cardid9=obj29.cardidA9;
    
    
    chamaahdata *obj30=[chamaahdata getInstance];
    
    _cardnumber9=obj30.cardnumberA9;
    
    chamaahdata *obj31=[chamaahdata getInstance];
    
    _cardtype9=obj3.cardtypeA9;
    
    
    chamaahdata *obj32=[chamaahdata getInstance];
    
    _cardid10=obj32.cardidA10;
    
    chamaahdata *obj33=[chamaahdata getInstance];
    
    _cardnumber10=obj33.cardnumberA10;
    
    chamaahdata *obj34=[chamaahdata getInstance];
    
    _cardtype10=obj34.cardtypeA10;
    
    
    chamaahdata *obj35=[chamaahdata getInstance];
    
    _cardid11=obj35.cardidA11;
    
    chamaahdata *obj36=[chamaahdata getInstance];
    
    _cardnumber11=obj36.cardnumberA11;
    
    chamaahdata *obj37=[chamaahdata getInstance];
    
    _cardtype11=obj37.cardtypeA11;
    
    
    chamaahdata *obj38=[chamaahdata getInstance];
    
    _cardid12=obj38.cardidA12;
    
    chamaahdata *obj39=[chamaahdata getInstance];
    
    _cardnumber12=obj39.cardnumberA12;
    
    chamaahdata *obj40=[chamaahdata getInstance];
    
    _cardid13=obj40.cardidA13;
    
    chamaahdata *obj41=[chamaahdata getInstance];
    
    _cardnumber13=obj41.cardnumberA13;
    
    chamaahdata *obj42=[chamaahdata getInstance];
    
    _cardtype13=obj42.cardtypeA13;
    
    
    
    
    chamaahdata *obj43=[chamaahdata getInstance];
    
    _cardid14=obj43.cardidA14;
    
    chamaahdata *obj44=[chamaahdata getInstance];
    
    _cardnumber14=obj44.cardnumberA14;
    
    chamaahdata *obj45=[chamaahdata getInstance];
    
    _cardtype14=obj45.cardtypeA14;
    
    
    chamaahdata *obj46=[chamaahdata getInstance];
    
    _cardid15=obj46.cardidA15;
    
    chamaahdata *obj47=[chamaahdata getInstance];
    
    _cardnumber15=obj47.cardnumberA15;
    
    chamaahdata *obj48=[chamaahdata getInstance];
    
    _cardtype15=obj48.cardtypeA15;
    
    
    
    chamaahdata *obj49=[chamaahdata getInstance];
    
    _cardid16=obj49.cardidA16;
    
    chamaahdata *obj50=[chamaahdata getInstance];
    
    _cardnumber16=obj50.cardnumberA16;
    
    chamaahdata *obj51=[chamaahdata getInstance];
    
    _cardtype16=obj51.cardtypeA16;
    
    
    chamaahdata *obj52=[chamaahdata getInstance];
    
    _cardid17=obj52.cardidA17;
    
    chamaahdata *obj53=[chamaahdata getInstance];
    
    _cardnumber17=obj53.cardnumberA17;
    
    chamaahdata *obj54=[chamaahdata getInstance];
    
    _cardtype17=obj54.cardtypeA17;
    
    
    chamaahdata *obj55=[chamaahdata getInstance];
    
    _cardid18=obj55.cardidA18;
    
    chamaahdata *obj56=[chamaahdata getInstance];
    
    _cardnumber18=obj56.cardnumberA18;
    
    chamaahdata *obj57=[chamaahdata getInstance];
    
    _cardtype18=obj57.cardtypeA18;
    
    
    chamaahdata *obj58=[chamaahdata getInstance];
    
    _cardid19=obj58.cardidA19;
    
    chamaahdata *obj59=[chamaahdata getInstance];
    
    _cardnumber19=obj59.cardnumberA19;
    
    chamaahdata *obj60=[chamaahdata getInstance];
    
    _cardtype19=obj60.cardtypeA19;
    
    
    chamaahdata *obj61=[chamaahdata getInstance];
    
    _cardid20=obj61.cardidA20;
    
    chamaahdata *obj62=[chamaahdata getInstance];
    
    _cardnumber20=obj62.cardnumberA20;
    
    chamaahdata *obj63=[chamaahdata getInstance];
    
    _cardtype20=obj63.cardtypeA20;
    
    
    
    
    
    if ([_cardid1 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:@"No Account Loaded", nil];
        
    }else  if([_cardid2 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1, nil];
        
    }else if([_cardid3 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2, nil];
        
    }else if([_cardid4 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3, nil];
        
        
    }else if([_cardid5 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4, nil];
        
        
    }else if([_cardid6 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5, nil];
        
        
    }else if([_cardid7 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6, nil];
        
        
    }else if([_cardid8 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7, nil];
        
        
    }else if([_cardid9 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8, nil];
        
        
    }else if([_cardid10 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9, nil];
        
        
    }else if([_cardid11 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10, nil];
        
        
    }else if([_cardid12 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11, nil];
        
        
    }else if([_cardid13 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12, nil];
        
        
    }else if([_cardid14 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12,_cardnumber13, nil];
        
        
    }else if([_cardid15 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12,_cardnumber13,_cardnumber14, nil];
        
        
    }else if([_cardid16 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12,_cardnumber13,_cardnumber14,_cardnumber15, nil];
        
        
    }else if([_cardid17 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12,_cardnumber13,_cardnumber14,_cardnumber15,_cardnumber16, nil];
        
        
    }else if([_cardid18 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12,_cardnumber13,_cardnumber14,_cardnumber15,_cardnumber16,_cardnumber17, nil];
        
        
    }else if([_cardid19 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12,_cardnumber13,_cardnumber14,_cardnumber15,_cardnumber16,_cardnumber17,_cardnumber18, nil];
        
        
    }else if([_cardid20 length] == 0){
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12,_cardnumber13,_cardnumber14,_cardnumber15,_cardnumber16,_cardnumber17,_cardnumber18,_cardnumber19, nil];
        
        
    }else {
        
        //show alert that Card Data Cannot be loaded
        
        self.accountnoViewArray =[[NSArray alloc] initWithObjects:_cardnumber1,_cardnumber2,_cardnumber3,_cardnumber4,_cardnumber5,_cardnumber6,_cardnumber7,_cardnumber8,_cardnumber9,_cardnumber10,_cardnumber11,_cardnumber12,_cardnumber13,_cardnumber14,_cardnumber15,_cardnumber16,_cardnumber17,_cardnumber18,_cardnumber19,_cardnumber20, nil];
        
        
    }
    
    
    
    //end of load card details
    
    //delegate the settlement account textfield
    self.settlement_account_textfield.delegate=self;
    
    
    accountnoView  = [[UIPickerView alloc] initWithFrame:CGRectZero];
    accountnoView    .delegate = self;
    accountnoView   .dataSource = self;
    [accountnoView     setShowsSelectionIndicator:YES];
    _settlement_account_textfield.inputView = accountnoView  ;
    // Create done button in UIPickerView
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [mypickerToolbar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [barItems addObject:doneBtn];
    [mypickerToolbar setItems:barItems animated:YES];
    _settlement_account_textfield.inputAccessoryView = mypickerToolbar;

    
    
    
    
    //end of delagate textfield
    
    //asign values to period array and delegate textfield
    
    self.rotationViewArray =[[NSArray alloc] initWithObjects:@" ",@"Daily",@"Weekly",@"Fort Night",@"Monthly",@"2months",@"3months",@"4 Months",@"6Months",@"Yearly",@"2Years",@"3years",@"4years",@"5Years", nil];

    
    
    //delegate the settlement account textfield
    self.loan_rotation_time.delegate=self;
    
    
    rotationView  = [[UIPickerView alloc] initWithFrame:CGRectZero];
    rotationView   .delegate = self;
    rotationView   .dataSource = self;
    [rotationView     setShowsSelectionIndicator:YES];
    _loan_rotation_time.inputView = rotationView  ;
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
    _loan_rotation_time.inputAccessoryView = mypickerToolbar2;
    
    
    
    
    
    //end of delagate textfield

    
    
    
    
    
    //end of delegate textfield
    
    
    
    
  
    
    
    
    
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


-(void)pickerDoneClicked
{
    NSLog(@"Done Clicked");
    [_settlement_account_textfield resignFirstResponder];
}

-(void)pickerDoneClicked2
{
    NSLog(@"Done Clicked");
    [_loan_rotation_time resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

{
    if([pickerView isEqual: accountnoView]){
        // return the appropriate number of components, for instance
        return 1;
    }
    
    if([pickerView isEqual: rotationView]){
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
    if([pickerView isEqual: accountnoView]){
        // return the appropriate number of components, for instance
        self.settlement_account_textfield.text = [accountnoViewArray objectAtIndex:row];
    }
    
    if([pickerView isEqual: rotationView]){
        // return the appropriate number of components, for instance
        self.loan_rotation_time.text = [rotationViewArray objectAtIndex:row];
    }
    
    
    
    //self.currencyTextField.text = [_currencyArray objectAtIndex:row];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

{
    
    if([pickerView isEqual: accountnoView]){
        // return the appropriate number of components, for instance
        return [accountnoViewArray count];
    }
    
    if([pickerView isEqual: rotationView]){
        // return the appropriate number of components, for instance
        return [rotationViewArray count];
    }
    
    else{
        return 0;
    }
    
    
    //return [_currencyArray count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

{
    
    if([pickerView isEqual: accountnoView]){
        // return the appropriate number of components, for instance
        return [accountnoViewArray objectAtIndex:row];
    }
    
    if([pickerView isEqual: rotationView]){
        // return the appropriate number of components, for instance
        return [rotationViewArray objectAtIndex:row];    }
    
    else{
        return 0;
    }
    
    
    
    //return [_currencyArray objectAtIndex:row];
    
}




- (IBAction)profile_details:(id)sender {
}
- (IBAction)groupname_info:(id)sender {
}

- (IBAction)description_info:(id)sender {
}
- (IBAction)loan_rotation_info:(id)sender {
}
- (IBAction)rotation_time_info:(id)sender {
}
- (IBAction)settlement_account_info:(id)sender {
}

- (IBAction)schedule_button:(id)sender {
}

- (IBAction)add_contacts:(id)sender {
}

- (IBAction)view_members:(id)sender {
}

- (IBAction)add_facebook:(id)sender {
}

- (IBAction)add_pictures:(id)sender {
}

- (IBAction)view_media:(id)sender {
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


- (IBAction)save_button:(id)sender {
    
    if([_limit_switch isOn]) {
        
        
        self.limit_switch_value=@"YES";
    } else {
        
        self.limit_switch_value=@"NO";
    }
    
    if([_memberloan_switch isOn]) {
        
        
        self.memberloan_switch_value=@"YES";
    } else {
        
        self.memberloan_switch_value=@"NO";
        
        
        
        
    }
    
    
    if([_rotational_switch isOn]) {
        
        
        self.rotationalswitch_value=@"YES";
    } else {
        
        self.rotationalswitch_value=@"NO";
        
        
        
        
    }
    
    
    
    if([_stealth_button isOn]) {
        
        
        self.stealth_switch_value=@"YES";
    } else {
        
        self.stealth_switch_value=@"NO";
        
        
        
        
    }



    
    
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
                
                NSString *post =[[NSString alloc] initWithFormat:@"userid=%@&logintoken=%@&group_name=%@&description=%@&limit_status=%@&limit_amount=%@&rotational_status=%@&loan_to_members_status=%@&rotational_type=%@&settlement_account_id=%@&device_id=%@&stealth=%@",useridthis,tokenthis,[_group_name_textfield text],[_description_edit text],_limit_switch_value,[_target_textfield text],_rotationalswitch_value,_memberloan_switch_value,[_loan_rotation_time text],_cardidmain,deviceid,_stealth_switch_value];
                
                
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
                    NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                    NSLog(@"%d",success);
                    if(success == 1)
                    {
                        
                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                        
                        //switch view here
                        //switch to dashboard after succesfull login
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                            
                            [self.view setUserInteractionEnabled:YES];
                            
                            
                        
                            
                            NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                            [self alertStatus:error_msg :@"Success!"];
                            
                            
                            groupcreated2ViewController * mimifirsttwoerror =[[groupcreated2ViewController alloc]initWithNibName:nil bundle:nil];
                            
                            [self presentViewController:mimifirsttwoerror animated:YES completion:NULL];
      
                            
                            
                            
                            
                            
                        });
                        
                        
                        
                        
                        
                        
                    }else if(success == 2)
                    {
                        
                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                        
                        
                        //invalid login
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                            
                            [self.view setUserInteractionEnabled:YES];
                            
                            NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                            [self alertStatus:error_msg :@"Failure!"];
                            
                            
                            menuViewController * mimifirsttwoerror =[[menuViewController alloc]initWithNibName:nil bundle:nil];
                            
                            [self presentViewController:mimifirsttwoerror animated:YES completion:NULL];
                            
                            
                        });
                        
                        
                        
                        
                    } else {
                        
                        [self.activityIndicatorView  performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // UI code here
                            
                            [self.view setUserInteractionEnabled:YES];
                            
                            NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                            [self alertStatus:error_msg :@"Failure!"];
                            
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
                
                
                [self alertStatus:@"Request not completed." :@"Send Money failed!"];
            });
            
            
        }
        
        
        
    });
    
    
  
    
    
    
    //end of send request to server
    
    
    
    
    
    
}

- (IBAction)backbutton:(id)sender {
    
   [self dismissViewControllerAnimated:YES completion:NULL];   
    
}

- (IBAction)form_group_background:(id)sender {
    
    [_group_name_textfield resignFirstResponder];
    [_target_textfield resignFirstResponder];
    [_loan_rotation_time resignFirstResponder];
    [_settlement_account_textfield resignFirstResponder];
    
}






@end
