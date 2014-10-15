//
//  SkimmerTable.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 3/13/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "SkimmerTable.h"
#import "LTFCell.h"
#import "LSCell.h"
#import "NameImageViewCell.h"
#import "CustomTextField.h"

@interface SkimmerTable ()

@end

@implementation SkimmerTable

@synthesize itemArray;
@synthesize switchArray;
@synthesize picArray;
@synthesize picNameArray;
@synthesize poolName;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    @autoreleasepool {
    
    itemArray = [[NSArray alloc] initWithObjects:@"Remove Skimmer", @"Replace Skimmer", @"Install Skimmer Pad",
                 @"Replace Skimmer Pad", @"Change Skimmer Collar", nil];

    switchArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [itemArray count]; i++)
        [switchArray addObject:[NSNumber numberWithInt:0]];
    
        picArray = [[NSMutableArray alloc] init];
        picNameArray = [[NSMutableArray alloc] init];
        
        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.tableView addGestureRecognizer:gestureRecognizer];
        gestureRecognizer.cancelsTouchesInView = NO;
    }
}


//****************** HIDE KEYBOARD
-(void) hideKeyboard {
    for(UITableViewCell *cell in self.tableView.visibleCells)
    {
        if([cell isMemberOfClass:[LTFCell class]])
        {
            LTFCell *lf = cell;
            [lf.cellTextField resignFirstResponder];
        }
        else if([cell isMemberOfClass:[NameImageViewCell class]])
        {
            NameImageViewCell *nivc = cell;
            [nivc.ImageName resignFirstResponder];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:
            return 1;
        case 1:
            return 5;
        case 2:
            return [picArray count];
        default:
            break;
    }
    return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath section] < 2)
        return 44;
    else
        return 150;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header = @"Pool Name";
    switch (section) {
        case 0:
            break;
        case 1:
            header = @"Skimmer Repairs";
            break;
        case 2:
            header = @"Pictures";
            break;
        default:
            break;
    }
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath section] == 0)
    {
        LTFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LTFCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LTFCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LTFCell"];
        
        cell.cellLabel.text = @"Pool Name:";
        cell.cellTextField.text = poolName;
        [cell.cellTextField setDelegate:self];
        
        return cell;
    }

    else if([indexPath section] == 1)
    {
        LSCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSCell"];
        
        cell.cellLabel.text = [itemArray objectAtIndex:[indexPath row]];
        cell.cellSwitch.tag = [indexPath row];
        
        if([[switchArray objectAtIndex:[indexPath row]] isEqualToNumber:[NSNumber numberWithInt:0]])
            [cell.cellSwitch setOn:NO];
        else
            [cell.cellSwitch setOn:YES];
        
        return cell;
    }

    if([indexPath section] == 2)
    {
        NameImageViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NameImageViewCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[NameImageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NameImageViewCell"];
        [cell.ImageName setTag:[indexPath row]];
        [cell.Picture setImage:[UIImage imageWithData:[picArray objectAtIndex:[indexPath row]]]];
        [cell.ImageName setDelegate:self];
        return cell;
    }
    return nil;
}

- (void) textFieldDidEndEditing:(CustomTextField *)textField
{
    UITableViewCell *cell = [[textField superview] superview];
    if([cell isMemberOfClass:[NameImageViewCell class]])
    {
        [picNameArray insertObject:textField.text atIndex:textField.tag];
    }
    else
        poolName = textField.text;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)switchHit:(UISwitch *)sender {
    if([sender isOn])
        [switchArray replaceObjectAtIndex:sender.tag withObject:[NSNumber numberWithInt:1]];
    else
        [switchArray replaceObjectAtIndex:sender.tag withObject:[NSNumber numberWithInt:0]];
}

//************* Email Delegate

- (IBAction)sendEmail:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"PoolSpec1.2 Test Email: Skimmer Construction Request"];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"sjohnson@americanpool.com", nil];
        [mailer setToRecipients:toRecipients];
        
        for(int i = 0; i < [picArray count]; i++)
        {
            NSString *fileName = [picNameArray objectAtIndex:i];
            if(fileName == NULL)
                fileName = [NSString stringWithFormat:@"Image %d", i];
            [mailer addAttachmentData:[picArray objectAtIndex:i] mimeType:@"image/jpeg" fileName:fileName];
        }
        
        NSMutableString *emailBody = [[NSMutableString alloc] init];
        
        [emailBody appendFormat:@"Skimmer Construction Request For: %@ \n\n", poolName];
        
        
        for(int i = 0; i < [itemArray count]; i++)
        {
            if([[switchArray objectAtIndex:i]isEqualToNumber:[NSNumber numberWithInteger:1]])
            {
                [emailBody appendFormat:@"%@\n", [itemArray objectAtIndex:i]];
            }
        }
        
        
        [mailer setMessageBody:emailBody isHTML:NO];
        
        [self presentViewController:mailer animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed");
            break;
        default:
            NSLog(@"Mail not sent");
            break;
    }
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:^
     (void){
         //If email sent successfully, remove previous form
         if(result == MFMailComposeResultSent)
         {
             itemArray = nil;
             picArray = nil;
             [self dismissViewControllerAnimated:YES completion:^(void){
                 [self dismissViewControllerAnimated:YES completion:nil];
             }];
             
         }
         else
             return;
     }];
}

//************* Camera Delegate

- (IBAction)takePhoto:(id)sender {
    @autoreleasepool {
        UIImagePickerController *imagePicker;
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
    @autoreleasepool {
        UIImage *chosenImage=[info objectForKey:UIImagePickerControllerOriginalImage];
        NSData *picData = [[NSData alloc] initWithData:UIImageJPEGRepresentation(chosenImage, 0.0)];
        [picArray addObject:picData];
    }
    [self.tableView reloadData];
}


- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
