//
//  PartsListTable.h
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/6/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface PartsListTable : UITableViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) NSArray *itemArray;
@property (strong, nonatomic) NSArray *partsNumberArray;
@property (strong, nonatomic) NSArray *belAquaNumbersArray;
@property (strong, nonatomic) NSArray *priceArray;
@property (strong, nonatomic) NSMutableArray *textFieldArray;
@property (strong, nonatomic) NSMutableArray *switchArray;
@property (strong, nonatomic) NSMutableArray *picArray;
@property (strong, nonatomic) NSMutableArray *picNameArray;

- (IBAction)switchHit:(UISwitch *)sender;
- (IBAction)sendEmail:(id)sender;
- (IBAction)takePhoto:(id)sender;
- (IBAction)goBack:(id)sender;



@end
