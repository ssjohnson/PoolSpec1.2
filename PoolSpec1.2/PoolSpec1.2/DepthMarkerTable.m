//
//  DepthMarkerTable.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/25/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "DepthMarkerTable.h"
#import "LSTCell.h"
#import "LTFCell.h"
#import "NameImageViewCell.h"

@interface DepthMarkerTable ()

@end

@implementation DepthMarkerTable

@synthesize itemArray;
@synthesize textFieldArray;
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
        
        poolName = @" ";
        
        //Init & Alloc Arrays
        itemArray = [[NSArray alloc] initWithObjects:
                          @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"1/2",
                          @"FEET DEEP", @"INCHES DEEP", @"FEET", @"INCHES", @"DEEP",
                          @"Graphical No Diving", @"No Diving (Words)", nil];
        
        textFieldArray = [[NSMutableArray alloc] init];
        for(int i = 0; i < [itemArray count]; i++)
        {
            [textFieldArray addObject:@"1"];
        }
        [textFieldArray addObject:@" "];
        
        switchArray = [[NSMutableArray alloc] init];
        for(int i = 0; i < [itemArray count]; i++)
        {
            NSNumber *x = [NSNumber numberWithInteger:0];
            [switchArray addObject:x];
        }
        
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
        else if([cell isMemberOfClass:[LSTCell class]])
        {
            LSTCell *ls = cell;
            [ls.ItemTextField resignFirstResponder];
        }
        else if(([cell isMemberOfClass:[NameImageViewCell class]]))
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch(section)
    {
        case 0:
            return 1;
        case 1:
            return 18;
        case 2:
            return [picArray count];
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *holder = @"Pool Name";
    switch(section)
    {
        case 0:
            break;
        case 1:
            holder = @"Depth Markers";
            break;
        case 2:
            holder = @"Pictures";
            break;
    }
    return holder;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath section] < 2)
        return 44;
    else
        return 150;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath section] == 0)
    {
        LTFCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LTFCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LTFCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LTFCell"];
        
        cell.cellLabel.text = @"Pool Name:";
        cell.cellTextField.index = [itemArray count];
        cell.cellTextField.text = [textFieldArray objectAtIndex:[itemArray count]];
        [cell.cellTextField setDelegate:self];
        
        return cell;
    }
    else if([indexPath section] == 1)
    {
        LSTCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LSTCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LSTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSTCell"];
        
        cell.ItemNameLabel.text = [itemArray objectAtIndex:[indexPath row]];
        cell.ItemSwitch.tag = [indexPath row];
        cell.ItemTextField.text = [textFieldArray objectAtIndex:[indexPath row]];
        cell.ItemTextField.index = [indexPath row];
        [cell.ItemTextField setDelegate:self];
        
        if([[switchArray objectAtIndex:[indexPath row]] isEqualToNumber:[NSNumber numberWithInt:0]])
        {
            [cell.ItemSwitch setOn:NO];
            [cell.ItemTextField setHidden:YES];
        }
        else
        {
            [cell.ItemSwitch setOn:YES];
            [cell.ItemTextField setHidden:NO];
        }
        return cell;
    }
    else
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

//************** TextField Delegate

- (void) textFieldDidEndEditing:(CustomTextField *)textField
{
    UITableViewCell *cell = [[textField superview] superview];
    if([cell isMemberOfClass:[NameImageViewCell class]])
    {
        [picNameArray insertObject:textField.text atIndex:textField.tag];
    }
    else
        [textFieldArray replaceObjectAtIndex:textField.index withObject:textField.text];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)switchHit:(UISwitch *)sender {
    NSLog(@"CALLED");
    if([sender isOn])
    {
        NSNumber *x = [NSNumber numberWithInteger:1];
        [switchArray replaceObjectAtIndex:sender.tag withObject:x];
    }
    else
    {
        NSNumber *x = [NSNumber numberWithInteger:0];
        [switchArray replaceObjectAtIndex:sender.tag withObject:x];
    }
}

//************* Email Delegate

- (IBAction)sendEmail:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"PoolSpec1.2 Test Email: Depth Marker Request"];
        
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
        
        [emailBody appendFormat:@"Depth Marker Request For: %@ \n\n", [textFieldArray objectAtIndex:[itemArray count]]];
        
        
        for(int i = 0; i < [itemArray count]; i++)
        {
            if([[switchArray objectAtIndex:i]isEqualToNumber:[NSNumber numberWithInteger:1]])
            {
                [emailBody appendFormat:@"Number: %@ x %@ \n", [itemArray objectAtIndex:i], [textFieldArray objectAtIndex:i]];
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
