//
//  LSTCell.h
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/6/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTextField.h"

@interface LSTCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *ItemNameLabel;
@property (strong, nonatomic) IBOutlet CustomTextField *ItemTextField;

@property (strong, nonatomic) IBOutlet UISwitch *ItemSwitch;

- (IBAction)switchHit:(UISwitch *)sender;

@end
