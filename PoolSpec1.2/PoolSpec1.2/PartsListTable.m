//
//  PartsListTable.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/6/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "PartsListTable.h"
#import "LTFCell.h"
#import "LSTCell.h"
#import "NameImageViewCell.h"
#import "CustomTextField.h"

@interface PartsListTable ()

@end

@implementation PartsListTable

@synthesize itemArray;
@synthesize partsNumberArray;
@synthesize belAquaNumbersArray;
@synthesize priceArray;
@synthesize textFieldArray;
@synthesize switchArray;
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
        
        [[UISwitch appearance] setOnImage:[UIImage imageNamed:@"yesSwitch"]];
        [[UISwitch appearance] setOffImage:[UIImage imageNamed:@"noSwitch"]];
        
        itemArray = [[NSArray alloc] initWithObjects:
                          //"Chemfeeder Equipment", 11 items
                          @"30 Gallon Acid Crock w/ Cover", @"30 Gallon Crock Cover", @"50 Gallon Chlorine Crock w/ Cover", @"50 Gallon Crock Cover",
                          @"1/4 Blue White Pump Tube", @"3/8 Blue White Pump Tube", @"Blue White Tubing (per ft)",
                          @"RolaChem Injection Fitting", @"RolaChem Tubing (per foot)", @"RolaChem Inside Tube", @"RolaChem In Barrel Weight",
                          //"Chemical Feeders", 6 items
                          @"Hayward Off Line Puck Feeder", @"Rainbow 40lb In Line", @"RolaChem 1.12 GPD",
                          @"RolaChem 12 GPD", @"RolaChem 32 GPD", @"RolaChem 72 GPD",
                          //"Chemicals", 7 items
                          @"Tile Cleaner Case(12)", @"100lb Granular Chlorine", @"25lb DE Bag",
                          @"Calcium Chloride (50lb)", @"SequaSol Case(12/cs)",
                          @"Sodium BiCarbonate(50lb)", @"Super Blue Case(12/cs)",
                          //"Cleaning Equipment", 12 items
                          @"25' Vacuum Hose", @"50' Vacuum Hose", @"Hose Hangers", @"12x24 Telepole",
                          @"Nylon Bristle Brush", @"Leaf Rake", @"Vaccuum Head (Plaster)", @"Vacuum Head (Vinyl)",
                          @"Spa Wand", @"Leaf Trap (w/ 3ft Hose)", @"Tile Brush", @"Algae Brush",
                          //"Filter Accessories", 6 items
                          @"Pressure Gauge", @"Vacuum Gauge", @"BW 1.5 in. Top Mount Flowmeter", @"BW 2.0 in. Top Mount Flowmeter",
                          @"BW 3.0 in. Top Mount Flowmeter", @"BW 6.0 in. Top Mount Flowmeter",
                          //"Ladders And Deck Equipment", 8 items
                          @"Ladder Wedge #4", @"Deck Anchor Repair Plate", @"Hayward Standard Eyeball Fitting",
                          @"Male Ladder Bumper", @"Female Ladder Bumper", @"Silver Esch Plate", @"White Esch Plate",
                          @"Thermometer",
                          //"Safety Equipment", 14 items
                          @"LifeLine Rope (in Feet)", @"LifeLine Rope Clamp", @"LifeLine Floats", @"Rescue Tube",
                          @"Rescue Hook", @"Head Immobilizer", @"Backboard with 3 Straps", @"Backboard Strap",
                          @"No Glassware Sign", @"Pool Capacity Sign", @"No Diving Sign",
                          @"No Lifeguard on Duty Sign", @"NY Urinating Sign", @"NY Infection Sign",
                          //"Skimmer Equipment", 10 items
                          @"Sylvan Lid", @"Baker Hydro Weir", @"Baker Hydro Basket",
                          @"Hayward Lid(1070, 1071)", @"Hayward Basket(1070, 1071)", @"Hayward Weir(1070, 1071)",
                          @"Hayward Lid(1082, 1085)", @"Hayward Basket(1082, 1085)",
                          @"Hayward Weir(1082, 1085)", @"Basket Support Ring(1082, 1085)", nil];
        
        partsNumberArray = [[NSArray alloc] initWithObjects:
                       //Chemfeeder Equipment
                       @"115P100129", @"115P100162", @"115P100130", @"115P100167",
                       @"115P100179", @"115P100041", @"115P100044", @"115P100083",
                       @"115P100081", @"115P100082", @"115P100097",
                       //Chemical Feeders
                       @"115P100904", @"115P100072", @"115P100733", @"115P100734", @"115P100732",
                       @"115P100735",
                       //Chemicals
                       @"125P102789", @"125P100225", @"125P100051", @"125P100426", @"125P100464",
                       @"125P101770", @"125P100748",
                       //Cleaning Equipment
                       @"130P102800", @"130P100119", @"130P102802", @"130P100227", @"130P100457", @"130P100071",
                       @"130P100077", @"130P100076", @"130P100137", @"130P100722",
                       @"130P100082", @"130P100053",
                       //Filter Accessories
                       @"175P100065", @"175P100067", @"175P100046", @"175P100047",
                       @"175P100048", @"175P100050",
                       //Ladders and Deck Equipment
                       @"200P102835", @"200P100069", @"175P100087", @"200P100039",
                       @"200P100152", @"115P100086", @"200P100085", @"200P100717",
                       //Safety Equipment
                       @"305P102066", @"200P100805", @"305P100430", @"305P100730", @"305P100073",
                       @"305P100528", @"305P100771", @"305P100773", @"310P100598", @"310P100302",
                       @"310P100067", @"310P100301", @"310P100304", @"310P100303",
                       //Skimmer Equipment
                       @"315P102787", @"315P102770", @"315P102772",
                       @"315P102775", @"315P100089", @"315P100813",
                       @"315P101536", @"315P100814", @"315P100092", @"315P102774",
                       nil];
        
               
        textFieldArray = [[NSMutableArray alloc] init];
        for(int i = 0; i < [itemArray count]; i++)
        {
            [textFieldArray addObject:@"1"];
        }
        [textFieldArray addObject:@"-"];
        
        switchArray = [[NSMutableArray alloc] init];
        for(int i = 0; i < [itemArray count]; i++)
        {
            NSNumber *x = [NSNumber numberWithInteger:0];
            [switchArray addObject:x];
        }
        
        picArray = [[NSMutableArray alloc] init];
        
        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.tableView addGestureRecognizer:gestureRecognizer];
        gestureRecognizer.cancelsTouchesInView = NO;
    }
}

//****************** HIDE KEYBOARD
-(void) hideKeyboard {
    for(UITableViewCell *cell in self.tableView.visibleCells)
    {
        if([cell isMemberOfClass:[LSTCell class]])
        {
            LSTCell *ls = cell;
            [ls.ItemTextField resignFirstResponder];
        }
        else if([cell isMemberOfClass:[LTFCell class]])
        {
            LTFCell *lf = cell;
            [lf.cellTextField resignFirstResponder];
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
    return 10;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath section] == 0)
        return 44;
    else if([indexPath section] < 9)
        return 60;
    else
        return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch(section)
    {
        case 0:
            return 1;
        case 1:
            return 11;
        case 2:
            return 6;
        case 3:
            return 7;
        case 4:
            return 12;
        case 5:
            return 6;
        case 6:
            return 8;
        case 7:
            return 14;
        case 8:
            return 10;
        case 9:
            return picArray.count;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header = @"Pool Name";
    switch (section) {
        case 0:
            break;
        case 1:
            header = @"Chemfeeder Equipment";
            break;
        case 2:
            header = @"Chem Feeders";
            break;
        case 3:
            header = @"Chemicals";
            break;
        case 4:
            header = @"Cleaning Equipment";
            break;
        case 5:
            header = @"Filter Accessories";
            break;
        case 6:
            header = @"Ladder and Deck Equipment";
            break;
        case 7:
            header = @"Safety Equipment";
            break;
        case 8:
            header = @"Skimmer Equipment";
            break;
        case 9:
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
    switch([indexPath section])
    {
            case 1:
                index = [indexPath row];
                break;
            case 2:
                index = [indexPath row] + 11;
                break;
            case 3:
                index = [indexPath row] + 17;
                break;
            case 4:
                index = [indexPath row] + 24;
                break;
            case 5:
                index = [indexPath row] + 36;
                break;
            case 6:
                index = [indexPath row] + 42;
                break;
            case 7:
                index = [indexPath row] + 50;
                break;
            case 8:
                index = [indexPath row] + 64;
                break;
            default:
                break;
    }
    if([indexPath section] == 0)
    {
        LTFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LTFCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LTFCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LTFCell"];
        
        cell.cellLabel.text = @"Pool Name:";
        cell.cellTextField.index = [itemArray count];
        [cell.cellTextField setDelegate:self];
        
        return cell;
    }
    else if([indexPath section] < 9)
    {
        LSTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSTCell" forIndexPath:indexPath];
        if(cell == nil)
            cell = [[LSTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSTCell"];
        
        cell.ItemNameLabel.text = [itemArray objectAtIndex:index];
        cell.ItemSwitch.tag = index;
        [cell.ItemTextField setDelegate:self];
        [cell.ItemTextField setText:[textFieldArray objectAtIndex:index]];
        cell.ItemTextField.index = index;

//******************* Compare Numbers To Tell If Switch Is On
        
        if([[switchArray objectAtIndex:index] isEqualToNumber:[NSNumber numberWithInteger:0]])
        {
            [cell.ItemSwitch setOn:NO];
            [cell.ItemTextField setHidden:YES];
        }
        else
        {
            [cell.ItemSwitch setOn:YES];
            [cell.ItemTextField setHidden:NO];
            [cell.ItemTextField setText:[textFieldArray objectAtIndex:index]];
        }
        return cell;
    }
    else if([indexPath section] == 9)
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

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
        [mailer setSubject:@"PoolSpec1.2 Test Email: Parts List"];
        
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
                
        [emailBody appendFormat:@"Parts List For: %@ \n\n", [textFieldArray objectAtIndex:[itemArray count]]];
        
        
        for(int i = 0; i < [itemArray count]; i++)
        {
            if([[switchArray objectAtIndex:i]isEqualToNumber:[NSNumber numberWithInteger:1]])
            {
                [emailBody appendFormat:@"%@ x %@ : %@\n", [itemArray objectAtIndex:i], [textFieldArray objectAtIndex:i], [partsNumberArray objectAtIndex:i]];
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
