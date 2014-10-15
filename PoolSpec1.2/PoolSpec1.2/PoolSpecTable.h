//
//  PoolSpecTable.h
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/4/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface PoolSpecTable : UITableViewController <UITextFieldDelegate, MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) NSArray *itemArray;
@property (strong, nonatomic) NSMutableArray *textFieldArray;
@property (strong, nonatomic) NSMutableArray *picArray;
@property (strong, nonatomic) NSMutableArray *picNameArray;

- (IBAction)sendEmail:(id)sender;
- (IBAction)takePhoto:(id)sender;
- (IBAction)goBack:(id)sender;


@end
