//
//  DeckAnchorTable.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 3/13/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "DeckAnchorTable.h"
#import "LTFCell.h"
#import "LSCell.h"
#import "CustomTextField.h"
#import "NameImageViewCell.h"

@interface DeckAnchorTable ()

@end

@implementation DeckAnchorTable

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
        
        [[UISwitch appearance] setOnImage:[UIImage imageNamed:@"yesSwitch"]];
        [[UISwitch appearance] setOffImage:[UIImage imageNamed:@"noSwitch"]];
        
        //Initialize Array
        itemArray = [[NSArray alloc] initWithObjects:
                          //Deck
                          @"Deck Patch", @"Replace Panel",
                          //Anchors
                          @"Remove / Replace Anchor", @"Reset Anchor", nil];
        
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 2;
        case 3:
            return [picArray count];
        default:
            break;
    }
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath section] < 3)
        return 44;
    else
        return 150;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header = @"Pool Name";
    switch (section) {
        case 0:
            break;
        case 1:
            header = @"Deck";
            break;
        case 2:
            header = @"Anchors";
            break;
        case 3:
            header = @"Pictures";
            break;
        default:
            break;
    }
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = 0;
    switch ([indexPath section]) {
        case 0:
            break;
        case 1:
            index = [indexPath row];
            break;
        case 2:
            index = [indexPath row] + 2;
            break;
        default:
            break;
    }
    
    if([indexPath section] == 0)
    {
        LTFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LTFCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LTFCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LTFCell"];
        
        cell.cellLabel.text = @"Pool Name";
        cell.cellTextField.text = poolName;
        [cell.cellTextField setDelegate:self];
        
        return cell;
    }
    else if([indexPath section] < 3)
    {
        LSCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSCell"];
        
        cell.cellLabel.text = [itemArray objectAtIndex:index];
        
        if([[switchArray objectAtIndex:index] isEqualToNumber:[NSNumber numberWithInt:0]])
            [cell.cellSwitch setOn:NO];
        else
            [cell.cellSwitch setOn:YES];
        
        cell.cellSwitch.tag = index;
        
        return cell;
    }
    if([indexPath section] == 3)
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
        [mailer setSubject:@"PoolSpec1.2 Test Email: Deck / Anchor Construction Request"];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"stevejohnson@americanpool.com", nil];
        [mailer setToRecipients:toRecipients];
        
        for(int i = 0; i < [picArray count]; i++)
        {
            NSString *fileName = [picNameArray objectAtIndex:i];
            if(fileName == NULL)
                fileName = [NSString stringWithFormat:@"Image %d", i];
            [mailer addAttachmentData:[picArray objectAtIndex:i] mimeType:@"image/jpeg" fileName:fileName];
        }
        
        NSMutableString *emailBody = [[NSMutableString alloc] init];
        
        [emailBody appendFormat:@"Deck / Anchor Construction Request For: %@ \n\n", poolName];
        
        
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
        [picNameArray addObject:@"Image"];
    }
    [self.tableView reloadData];
}


- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
