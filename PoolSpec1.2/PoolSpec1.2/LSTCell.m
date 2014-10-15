//
//  LSTCell.m
//  PoolSpec1.2
//
//  Created by Sean Johnson on 2/6/13.
//  Copyright (c) 2013 Sean Johnson. All rights reserved.
//

#import "LSTCell.h"

@implementation LSTCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)switchHit:(UISwitch *)sender {
    if([sender isOn])
        [_ItemTextField setHidden:NO];
    else
        [_ItemTextField setHidden:YES];
}
@end
