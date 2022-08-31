//
//  selectimageViewController.h
//  chamah
//
//  Created by Teddy Ogallo on 26/02/2018.
//  Copyright © 2018 Teddy Ogallo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectimageViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>  
- (IBAction)takephoto:(id)sender;
- (IBAction)selectimage:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
