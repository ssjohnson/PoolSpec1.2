//
//  PoolSpecTable.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/4/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "PoolSpecTable.h"
#import "LTFCell.h"
#import "CustomTextField.h"
#import "NameImageViewCell.h"

@interface PoolSpecTable ()

@end

@implementation PoolSpecTable

@synthesize itemArray;
@synthesize textFieldArray;
@synthesize picArray;
@synthesize picNameArray;


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
    
//Fill Item Array
    
    itemArray = [[NSArray alloc] initWithObjects:
                 //POOL NAME - SECTION 0
                 @"Pool Name:",
                 
                 //SPECIFICATIONS - SECTION 1
                 @"Length", @"Width", @"Perimeter", @"Average Depth", @"Gallons", @"Deepest to Shallowest",
                 @"Surface Type", @"Skimmers (#, type)", @"Equalizers (#,type)",
                 @"Return Fittings (#,type)", @"Pool Lights (#, type)", @"Coping (Color, size)",
                 @"Waterline Tile (size, color, rows)", @"Transition Tile (size, color, rows)",
                 @"Step Transition (size, color, rows)", @"Riser Transition (size, color, rows)",
                 @"Cup Anchors (#, metal/plastic)", @"Railings (#, metal/plastic, size)",
                 @"Ladders (#, metal/plastic, size)", @"Pool Fill (size, thread)",
                 @"Expansion Joint (size)", @"Deck Material",
                 
                 //FILTER ROOM SPECS - SECTION 2
                 @"Drains (#, size, make)",
                 @"SVRS (Vacless, StingL)", @"Motor (Brand, Model, Hp)", @"Volts, Amps, Phase",
                 @"Filter Type/Size", @"Multiport / 4 Valve / Push Pull", @"Skimmer Line (Size, Valve Type)",
                 @"Main Drain Line (Size, Valve Type)",
                 @"Return Line (Size, Valve Type)", @"Backwash Line (Size, Valve Type)",
                 @"Vac Line (Size, Valve Type)", @"Flowmeter (size, brand)", @"Chlorinator (type, GPD)",
                 @"Acid Feeder (type, GPD)", @"Vac Gauge (Yes/No)", @"Chemical Controller (Make, Model)",
                 @"Heater (Model #)", @"Gas Type, BTUs, Electric Supply", @"Chlorine Vats", @"Acid Vats",
                 
                 //DEPTH MARKERS: TILE LINE - SECTION 3
                 @"Vinyl or Tile",
                 
                 //DEPTH MARKERS: TILE QUANTITY - SECTION 4
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"1/2",
                 @"FEET DEEP", @"INCHES DEEP", @"FEET", @"INCHES", @"DEEP",
                 @"Graphical No Diving", @"No Diving (Words)",
                 
                 //DEPTH MARKERS: DECK - SECTION 5
                 @"On Deck or Cope", @"Vinyl / NS Tile / Stencil",
                 
                 //DEPTH MARKERS: TILE QUANTITY - SECTION 6
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"1/2",
                 @"FEET DEEP", @"INCHES DEEP", @"FEET", @"INCHES", @"DEEP",
                 @"Graphical No Diving", @"No Diving (Words)", nil];
        
    //**************** Text from text fields array
        
        textFieldArray = [[NSMutableArray alloc] init];
        for(int i = 0; i < [itemArray count]; i++)
        {
            [textFieldArray addObject:@" "];
        }
        
        NSLog(@"%d", textFieldArray.count);
        
    //**************** Init Picture Array
        picArray = [[NSMutableArray alloc] init];
        //picNameArray = [[NSMutableArray alloc] init];
        
    //**************** Add hideKeyboard on Tap Gesture
        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.tableView addGestureRecognizer:gestureRecognizer];
        gestureRecognizer.cancelsTouchesInView = NO;
        
    }
    
}

-(void)hideKeyboard
{
    for(UITableViewCell *cell in self.tableView.subviews)
    {
        if([cell isMemberOfClass:[LTFCell class]])
        {
            LTFCell *l = cell;
            [l.cellTextField resignFirstResponder];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section==0)
        return 1;
    else if(section==1)
        return 22;
    else if(section==2)
        return 20;
    else if(section==3)
        return 1;
    else if(section==4)
        return 18;
    else if(section==5)
        return 2;
    else if(section==6)
        return 18;
    else if (section == 7)
        return picArray.count;
    else
        return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath section] < 7)
        return 60;
    else
        return 150;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header = @"Pool Name";
    
    if (section==1)
        header = @"Specifications";
    else if (section == 2)
        header = @"Filter Room";
    else if (section == 3)
        header = @"Depth Markers: Tile Line";
    else if (section == 4)
        header = @"Tile : Quantity";
    else if (section == 5)
        header = @"Depth Markers : Deck";
    else if (section == 6)
        header = @"Tile : Quantity";
    else if (section == 7)
        header = @"Pictures";
    
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = 0;
    switch([indexPath section])
    {
        case 0:
            index = [indexPath row];
            break;
        case 1:
            index = [indexPath row] + 1;
            break;
        case 2:
            index = [indexPath row] + 23;
            break;
        case 3:
            index = [indexPath row] + 43;
            break;
        case 4:
            index = [indexPath row] + 44;
            break;
        case 5:
            index = [indexPath row] + 62;
            break;
        case 6:
            index = [indexPath row] + 64;
            break;
        default:
            break;
    }
    
    if([indexPath section] < 7)
    {
        LTFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LTFCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LTFCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LTFCell"];
        cell.cellTextField.index = index;
        [cell.cellTextField setDelegate:self];
        [cell.cellLabel setText:[itemArray objectAtIndex:index]];
        [cell.cellTextField setText:[textFieldArray objectAtIndex:index]];
        return cell;
    }
    if([indexPath section] == 7)
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

//******** Text Field Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) textFieldDidEndEditing:(CustomTextField *)textField
{
    NSLog(@"Called");
    UITableViewCell *cell = [[textField superview] superview];
    if([cell isMemberOfClass:[NameImageViewCell class]])
    {
        [picNameArray insertObject:textField.text atIndex:textField.tag];
    }
    else
        [textFieldArray replaceObjectAtIndex:textField.index withObject:textField.text];
}

//*********** Email Delegate

- (IBAction)sendEmail:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"PoolSpec1.2 Test Email: Pool Spec Sheet"];
        
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
        
        [emailBody appendFormat:@"Pool Spec Sheet: \n\n"];
        
        for(int i = 0; i < [itemArray count]; i++)
        {
            switch(i)
            {
                case 0:
                    [emailBody appendFormat:@"\nPOOLNAME: \n"];
                    break;
                case 1:
                    [emailBody appendFormat:@"\nSPECIFICATIONS: \n"];
                    break;
                case 23:
                    [emailBody appendFormat:@"\nFILTER ROOM: \n"];
                    break;
                case 43:
                    [emailBody appendFormat:@"\nDEPTH MARKERS (TILE LINE): \n"];
                    break;
                case 44:
                    [emailBody appendFormat:@"\nTILE - QUANTITY: \n"];
                    break;
                case 62:
                    [emailBody appendFormat:@"\nDEPTH MARKERS (DECK): \n"];
                    break;
                case 64:
                    [emailBody appendFormat:@"\nTILE - QUANTITY: \n"];
                    break;
                default:
                    break;
            }
            NSString *p1 = [textFieldArray objectAtIndex:i];
            if([p1 isEqual:@" "])
                p1 = @"-";
            [emailBody appendFormat:@"%@ : %@\n", [itemArray objectAtIndex:i], p1];
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


//*********** Camera Delegate

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

//********** Back Button

- (IBAction)goBack:(id)sender {
    picArray = nil;
    itemArray = nil;
    textFieldArray = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
